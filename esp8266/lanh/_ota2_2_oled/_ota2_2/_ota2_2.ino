//========== PZEM004T ==========//
#include <PZEM004Tv30.h>
PZEM004Tv30 pzem(D4, D3);

//========== PROTOCOL ==========//
#include <SPI.h>
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

//========== ELECTRIC PARAMETER ==========//
float
voltage  ,
current  ,
power    ,
pf       ,
frequency,
energy;

//========== TIME PARAMETER ==========//
unsigned int 
second_, 
minute_, 
hour_, 
wday_, 
day_, 
month_, 
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
int giatrilua;

//========== CAM BIEN GAS ============//
#define cambiengas D7
int giatrigas;

//========== DATABASE VARIAN ==========//
float read_voltage;
float read_amp;
int state;

void setup() {
    Serial.begin(115200);
//    Wire.begin(D1,D2);               //Thiết lập chân kết nối I2C (SDA,SCL);
    
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

  // 2s CYCLE
  if (millis() - currentTime > timeDelay) {
    
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
    
    // DISPLAY PARAMETER
    getDataFromDatabase();
    processData();

    // DISPLAY PARAMETER
    getTimeDate();
    OLED();

    //PUT DATA
    putHistoryData();
    currentTime = millis();
  }
}

void OLED(){
    display.clearDisplay();
    display.setTextSize(1);
    display.setTextColor(SSD1306_WHITE);  // Draw white text
    display.setCursor(0, 0);              // Start at top-left corner
    display.print("   ELECTRIC METER");
    if (isValidPzem()){
      display.setTextSize(2);
      display.setCursor(0, 15);
      display.print(power);            display.print("W");
      display.setTextSize(1);                  // Normal 1:1 pixel scale
      display.setCursor(0, 35);
      display.print(voltage);          display.print("V / ");
      display.print(current);          display.print("A");
      display.setCursor(0, 45);
      display.print(frequency, 1);     display.print("Hz/");
      display.print(pf);               display.print("/");
      display.print(energy);           display.print("kWh");
    }else{
      display.setTextSize(2);
      display.setCursor(0, 15);
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


void processData(){

    if ((read_voltage < voltage) || (read_amp < current) || (giatrilua == 0) || (giatrigas == 0)) {
      // canh bao
  
      // coi
      digitalWrite(buzzle, HIGH);
      // kich relay
      digitalWrite(relay, HIGH);
      // doi trang trai thiet bi
      Firebase.RTDB.setInt(&fbdo, relayStatePath, 0);
      
    }else {
      // kiem tra xem co tin hieu bat led hay khong
      if (Firebase.RTDB.getInt(&fbdo, relayStatePath)) {
        if (fbdo.dataType() == "int") {
          int tmp = fbdo.intData();
          state = tmp;
        }
      }
      if (state == 1) {
  
        digitalWrite(relay, LOW);
        
      }else {
  
        digitalWrite(relay, HIGH);
        
      }
  
      // tat coi
      digitalWrite(buzzle, LOW);
    }
}
