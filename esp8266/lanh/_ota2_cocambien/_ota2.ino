//========== PZEM004T ==========//
#include <PZEM004Tv30.h>
PZEM004Tv30 pzem(D4, D3);

//========== PROTOCOL ==========//
#include <SPI.h>
#include <Wire.h>

//========== OLED ==========//
//#include <Adafruit_GFX.h>
//#include <Adafruit_SSD1306.h>

//#define SCREEN_WIDTH 128  // OLED display width, in pixels
//#define SCREEN_HEIGHT 32  // OLED display height, in pixels
//
//#define OLED_RESET -1         // Reset pin # (or -1 if sharing Arduino reset pin)
//#define SCREEN_ADDRESS 0x3C  ///< See datasheet for Address; 0x3D for 128x64, 0x3C for 128x32
//Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);


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

//========== LCD1602 ==========//
#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27, 16, 2); // địa chỉ màn hình, thường là 0X27 hoặc 0X3F

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
    Wire.begin(D1,D2);               //Thiết lập chân kết nối I2C (SDA,SCL);
    lcd.init();                      //Khởi tạo LCD
    lcd.clear();                     //Xóa màn hình
    lcd.backlight();
    pinMode(configWifi, INPUT);
    pinMode(buzzle, OUTPUT);
    pinMode(relay, OUTPUT);
    Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);

    wifiManager.setConfigPortalTimeout(60); // 1 minute

    if (!wifiManager.autoConnect(Device_Name)) {
      Serial.println("failed to connect and hit timeout");
      lcd.clear();
      lcd.setCursor(0,0);
      lcd.print("Dang Ket Noi....");
      delay(3000);
      //reset and try again, or maybe put it to deep sleep
      ESP.restart();
      delay(5000);
    }
  
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Wifi connecting to ");
    lcd.print(WiFi.SSID().c_str());
  
    lcd.print("\nConnecting");
    while ( WiFi.status() != WL_CONNECTED ) {
      delay(500);
      lcd.print(".");
    }
  
    lcd.clear();
    lcd.setCursor(0,0);
  
    lcd.println("Wifi Connected!");
    lcd.print("IP:");
    lcd.print(WiFi.localIP());
    delay(1000);
    
    lcd.clear();
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
    LCD1602();

    //PUT DATA
    putHistoryData();
    currentTime = millis();
  }
}

//void OLED{
//    display.clearDisplay();
//    display.setTextSize(1);
//    display.setTextColor(SSD1306_WHITE);  // Draw white text
//    display.setCursor(0, 0);              // Start at top-left corner
//    display.print("   ELECTRIC METER");
//    display.setTextSize(2);
//    display.setCursor(0, 15);
//    display.print(power);            display.print("W");
//    display.setTextSize(1);                  // Normal 1:1 pixel scale
//    display.setCursor(0, 35);
//    display.print(voltage);          display.print("V / ");
//    display.print(current);          display.print("A");
//    display.setCursor(0, 45);
//    display.print(frequency, 1);     display.print("Hz/");
//    display.print(pf);               display.print("/");
//    display.print(energy);           display.print("kWh");
//
//    display.display();
//}

void LCD1602()
{
  if (!isValidPzem()) {
    lcd.setCursor(0, 0);  lcd.print("  CHUA KET NOI  ");
    lcd.setCursor(0, 1);  lcd.print("      PZEM      ");
  }

  else {
    // DISPLAY
    lcd.setCursor(0, 0);  lcd.print(voltage, 0);   lcd.print("V ");
    lcd.setCursor(5, 0);  lcd.print(current, 2);   lcd.print("A");   padding100(current);
    lcd.setCursor(11, 0); lcd.print(power, 0);     lcd.print("W");   padding1000(power);
    lcd.setCursor(0, 1);  lcd.print(frequency, 0); lcd.print("Hz ");
    lcd.setCursor(5, 1);  lcd.print(pf, 2);        lcd.print(" ");
    lcd.setCursor(10, 1); lcd.print(energy, 2);    lcd.print("kW"); padding1000(energy);
  }
}

void SerialMonitor()
{
  // Check if the data is valid
  if (!isValidPzem()) {
    Serial.print("Error!!");
  } else {

    // Print the values to the Serial console
    Serial.print("Voltage: ");      Serial.print(voltage);      Serial.println("V");
    Serial.print("Current: ");      Serial.print(current);      Serial.println("A");
    Serial.print("Power: ");        Serial.print(power);        Serial.println("W");
    Serial.print("Energy: ");       Serial.print(energy, 3);     Serial.println("kWh");
    Serial.print("Frequency: ");    Serial.print(frequency, 1); Serial.println("Hz");
    Serial.print("PF: ");           Serial.println(pf);
  }
  Serial.println();
}  // end SerialMonitor

void padding1000(int padVar) {
  if (padVar < 10) {
    lcd.print("   ");
  }
  else if (padVar < 100) {
    lcd.print("  ");
  }
  else if (padVar < 1000) {
    lcd.print(" ");
  }
}
void padding100(int padVar) {
  if (padVar < 10) {
    lcd.print("  ");
  }
  else if (padVar < 100) {
    lcd.print(" ");
  }
}
void padding10(int padVar) {
  if (padVar < 10) {
    lcd.print(" ");
  }
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
        Serial.println(state);
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
