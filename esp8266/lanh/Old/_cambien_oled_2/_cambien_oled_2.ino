//========== PZEM004T ==========//
#include <PZEM004Tv30.h>
PZEM004Tv30 pzem(D4, D3);

//========== PROTOCOL ==========//
#include <Wire.h>

//========== OLED ==========//
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128  // OLED display width, in pixels
#define SCREEN_HEIGHT 32  // OLED display height, in pixels
//
#define OLED_RESET -1         // Reset pin # (or -1 if sharing Arduino reset pin)
#define SCREEN_ADDRESS 0x3C  ///< See datasheet for Address; 0x3D for 128x64, 0x3C for 128x32
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);


//========== WIFI ==========//
#include <ESP8266WiFi.h>
#include <DNSServer.h>
#include <ESP8266WebServer.h>
#include <WiFiManager.h>
WiFiManager wifiManager;
#define Device_Name "CONG TO DIEN 1 Pha"
#define configWifi D0

//========== OTA ==========//
#include <ESP8266WiFiMulti.h>
ESP8266WiFiMulti WiFiMulti;

//========== FIREBASE ==========//
#include <FirebaseESP8266.h>
#define FIREBASE_HOST "https://startup2023-e6d76-default-rtdb.firebaseio.com/"
#define FIREBASE_AUTH "7MZn8r1bYzOMXaIun13GQpRAO1wFKCTpL7B2xswz"
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;
FirebaseJson json;

//========== EEPROM ==========//
#include <EEPROM.h>

//========== Time ==========//
#include <TimeLib.h>
#include <WiFiUdp.h>
#include <NTPClient.h>
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "1.asia.pool.ntp.org", 7*3600);

//========== API ==========//
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>
const String serverName = "192.168.0.118:4000/api/send-notification";
unsigned char countPushApi = 0;
unsigned char defaultCountPushApi = 1;

//========== ELECTRIC PARAMETER ==========//
float
voltage  ,
current  ,
power    ,
pf       ,
frequency,
energy;

//========== TIME PARAMETER ==========//
unsigned char 
second_, 
minute_, 
hour_, 
wday_, 
day_, 
month_,
countDelay = 0,
defaultCountDelay = 10;
unsigned int
year_;

unsigned long 
currentTime = 0,
timeDelay = 1000,
epoch_time;

//========== DATABASE PATH ==========//
String historyDataPath;
String historyPath = "ESP8266/Monitor1/History";
String nowDataPath = "ESP8266/Now1";
String voltagePath = "/Voltage";
String currentPath = "/Current";
String powerPath   = "/Power";
String freqPath    = "/Frequency";
String pfPath      = "/Pf";
String energyPath  = "/Energy";
String curPathThreshold = "Flutter/Monitor1/amperage/thresholdValue";
String volPathThreshold = "Flutter/Monitor1/voltage/thresholdValue";
String relayStatePath = "Flutter/Monitor1/isOn";
String gasPath = "/GasSensor";
String flamePath = "/FlameSensor";

//========== CONTROL DEVICE ==========//
#define buzzle D8
#define relay  D5

//========== CAM BIEN LUA ============//
#define cambienlua D6
unsigned char giatrilua;

//========== CAM BIEN GAS ============//
#define cambiengas D7
unsigned char giatrigas;

//========== DATABASE VARIAN ==========//
float read_voltage;
float read_amp;
unsigned char state;

//========== GLOBAL VARIAN ==========//
unsigned char warningFlag = 0;
unsigned char api_flag = 0;
unsigned char count_api = 0;

void setup() {
    Serial.begin(115200);
    pinMode(configWifi, INPUT);
    pinMode(buzzle, OUTPUT);
    pinMode(relay, OUTPUT);
    
    if (!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
      Serial.println("SSD1306 allocation failed");
      for (;;); // Don't proceed, loop forever
    }
    
    Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);

    wifiManager.setConfigPortalTimeout(60); // 1 minute

    if (!wifiManager.autoConnect(Device_Name)) {
      Serial.println("failed to connect and hit timeout");
      display.clearDisplay();
      display.setTextSize(1);
      display.setTextColor(WHITE);
      display.setCursor(0, 0);
      display.println("Dang Ket Noi....");
      display.display();
      delay(3000);
      //reset and try again, or maybe put it to deep sleep
      ESP.restart();
      delay(5000);
    }

    display.clearDisplay();
    display.display();
  
    display.setTextSize(1);
    display.setTextColor(WHITE);
    display.setCursor(0, 0);
    display.println("Wifi connecting to ");
    display.println( WiFi.SSID().c_str() );
    display.println("\nConnecting");
    display.display();
  
    
    while ( WiFi.status() != WL_CONNECTED ) {
      delay(500);
      display.print(".");
      display.display();
    }
  
    display.clearDisplay();
    display.display();
    display.setCursor(0, 0);
  
    display.println("Wifi Connected!");
    display.print("IP:");
    display.println(WiFi.localIP() );
    display.display();
    delay(1000);
    
    display.clearDisplay();
    display.display();
    timeClient.begin();

    // BUZZLE OFF, RELAY OFF
    digitalWrite(buzzle, LOW);
    digitalWrite(relay, HIGH);
    
    
}

void loop() {

  // BUTTON EVENT
  if (digitalRead(configWifi) == HIGH) {
      delay(30);
      if (digitalRead(configWifi) == HIGH) {
        delay(3000);
        if (digitalRead(configWifi) == HIGH) {
          wifiManager.resetSettings();
          delay(1000);
          ESP.restart();
        }
      }
    }
    
    // READ ELECTRIC PARAMETER
    voltage = pzem.voltage();
    current = pzem.current();
    power = pzem.power();
    energy = pzem.energy();
    frequency = pzem.frequency();
    pf = pzem.pf();

    // READ GAS AND FLAME SENSOR PARAMETER
    giatrilua = digitalRead(cambienlua);
    giatrigas = digitalRead(cambiengas);
    
    // PROCESS DATA
    processDataInHardware();
    
    // DISPLAY PARAMETER
    //OLED();

    // warning
    if(warningFlag){
      post_data_fb();
      api_flag = 1;
    }

    if (api_flag == 1){
        count_api++;
        SEND_MESSAGE_API(); 
    }
    

  // 1s CYCLE
  if (millis() - currentTime > timeDelay) {

    // INCREASE DELAY COUNT VAR
    countDelay++;
    
    //PUT DATA
    getTimeDate();
    putHistoryData();
    getDataFromDatabase();
    currentTime = millis();
  }
}

void OLED(){
    display.clearDisplay();
    display.setTextColor(SSD1306_WHITE);  // Draw white text

    if (isValidPzem()) {
      if(warningFlag){
        display.setCursor(0, 0);
        display.print("   ELECTRIC METER");
        display.setCursor(20, 15);
        display.print("OVERLOAD!!!!");
      }else{
        display.setTextSize(2);
        display.setCursor(0, 0);
        display.print(power, 2);   
        display.print("W");
        display.setTextSize(1);
        display.setCursor(80, 0);
        display.print(current, 2);          display.print("A");
        display.setCursor(11, 24);
        display.print(voltage, 2);          display.print("V");
        display.setCursor(80, 12);
        display.print(frequency);     display.print("Hz");
        display.setCursor(80, 24);
        display.print(energy, 2);           display.print("kWh");
      }
    }else{
      display.setCursor(0, 0);
      display.print("   ELECTRIC METER");
      display.setCursor(10, 15);
      display.print("NOT CONNECTED PZEM");
    }
    display.display();
}

void setJsonData(String path, float value){
    json.set(path, value);
}

void setAllJsonData(){
    setJsonData(voltagePath,voltage);
    setJsonData(currentPath,current);
    setJsonData(powerPath,power);
    setJsonData(freqPath,frequency);
    setJsonData(pfPath,pf);
    setJsonData(energyPath,energy);
    setJsonData(gasPath,(float)giatrigas);
    setJsonData(flamePath,(float)giatrilua);
}

void putData(String pathDatabase){
    Firebase.RTDB.setJSON(&fbdo, pathDatabase.c_str(), &json);
}

void putHistoryData() {
    if (!isValidPzem()){
      
    }else {
      
      // PUT DATA ON DATABASE
      historyDataPath = historyPath + String('/') + String(year_) + 
      String('/') + String(month_) + String('/') + String(day_) + 
      String('/') + String(hour_) + String('/') + String(minute_) + String('/');
      
      setAllJsonData();
      putData(historyDataPath);
      putData(nowDataPath);
    }
}

void getTimeDate(){
    timeClient.update();
    unsigned long unix_epoch = timeClient.getEpochTime(); 
    // GET NOW TIME AND DATE
    second_ = second(unix_epoch); 
    minute_ = minute(unix_epoch);      
    hour_   = hour(unix_epoch);        
    wday_    = weekday(unix_epoch);     
    day_    = day(unix_epoch);         
    month_  = month(unix_epoch);       
    year_   = year(unix_epoch);
 
}

boolean isValidPzem(){
    if (isnan(voltage) || (isnan(current)) || (isnan(power)) || (isnan(energy)) || (isnan(frequency)) || (isnan(pf))) {
      return false;
    }else {
      return true;
    }
}

void getDataFromDatabase(){

    if (Firebase.RTDB.getFloat(&fbdo, volPathThreshold)) {
      if (fbdo.dataType() == "float") {
        float floatVolValue = fbdo.floatData();
        read_voltage = floatVolValue;
      }
    }
  
    if (Firebase.RTDB.getFloat(&fbdo, curPathThreshold)) {
      if (fbdo.dataType() == "float") {
        float floatAmpValue = fbdo.floatData();
        read_amp = floatAmpValue;
      }
    }
}


void processDataInHardware(){

    if ((read_voltage < voltage) || (read_amp < current) || (giatrilua == 0) || (giatrigas == 0)) {
      // canh bao
      warningFlag = 1;
      // coi keu 10s
      digitalWrite(buzzle, HIGH);
      //10s
      if (countDelay == defaultCountDelay) {
        digitalWrite(buzzle, LOW);
        countDelay = 0;
      }
      // kich relay
      digitalWrite(relay, HIGH);
      
    }else {
      // kiem tra xem co tin hieu bat led hay khong
      if (Firebase.RTDB.getInt(&fbdo, relayStatePath)) {
        if (fbdo.dataType() == "int") {
          unsigned char tmp = fbdo.intData();
          state = tmp;
        }
      }
      if (state == 1) {
  
        digitalWrite(relay, LOW);
        
      }else {
  
        digitalWrite(relay, HIGH);
        
      }
      warningFlag = 0;
      digitalWrite(buzzle, LOW);
    }
}

void SEND_MESSAGE_API(){
    
  // push notif
  WiFiClientSecure client;
  HTTPClient https;
  client.setInsecure();
  
  // Your Domain name with URL path or IP address with path
  https.begin(client, serverName.c_str());
  https.addHeader("Content-Type", "application/json");
  int httpResponseCode = https.POST("{\"fcm_token\": \"dbzR0ayBT2Guzp3u3sginN:APA91bHYe_4BXRfbB9mRT9GJNLupr6M-X23i1AhvHhgg93bMSg6UzwpijIKQ063Op5JrEO3LMIOgaGg4Lkd367GuLLSNNTTUl5btWum8q8CH_AxPBkVbxZcHMbytqIBqU93xWyhGC_0x\"}");
  display.clearDisplay();
  display.setTextColor(SSD1306_WHITE);
  display.setTextSize(1);
  display.setCursor(0, 0);
  display.print(httpResponseCode);
  display.setCursor(20, 15);
  display.print(count_api);
  display.display();
  if (httpResponseCode == 200) {
    api_flag = 0;
  }
  else {}
  https.end();
}

void post_data_fb(){

  // doi trang trai thiet bi
    Firebase.RTDB.setInt(&fbdo, relayStatePath, 0);
}
