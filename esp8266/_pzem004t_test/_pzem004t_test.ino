////========== PZEM004T ==========//
//#include <PZEM004Tv30.h>
//PZEM004Tv30 pzem(D3, D4);
//
////========== PROTOCOL ==========//
//#include <SPI.h>
//#include <Wire.h>
//
////========== OLED ==========//
////#include <Adafruit_GFX.h>
////#include <Adafruit_SSD1306.h>
//
////#define SCREEN_WIDTH 128  // OLED display width, in pixels
////#define SCREEN_HEIGHT 64  // OLED display height, in pixels
////
////#define OLED_RESET -1         // Reset pin # (or -1 if sharing Arduino reset pin)
////#define SCREEN_ADDRESS 0x3D  ///< See datasheet for Address; 0x3D for 128x64, 0x3C for 128x32
////Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);
//
//
////========== WIFI ==========//
//#include <ESP8266WiFi.h>
//#include <DNSServer.h>
//#include <ESP8266WebServer.h>
//#include <WiFiManager.h>
//WiFiManager wifiManager;
//#define Device_Name "CONG TO DIEN 1 Pha"
//#define configWifi D0
//
////========== FIREBASE ==========//
//#include <FirebaseESP8266.h>
//#define FIREBASE_HOST "https://startup2023-e6d76-default-rtdb.firebaseio.com/"
//#define FIREBASE_AUTH "7MZn8r1bYzOMXaIun13GQpRAO1wFKCTpL7B2xswz"
//FirebaseData fbdo;
//FirebaseAuth auth;
//FirebaseConfig config;
//
////========== EEPROM ==========//
//#include <EEPROM.h>
//
////========== LCD1602 ==========//
//#include <LiquidCrystal_I2C.h>
//LiquidCrystal_I2C lcd(0x27, 16, 2); // địa chỉ màn hình, thường là 0X27 hoặc 0X3F
//
////========== ELECTRIC PARAMETER ==========//
//float
//voltage  ,
//current  ,
//power    ,
//pf       ,
//frequency,
//energy;
//
//void setup() {
//    Serial.begin(115200);
//    Wire.begin(D2,D1);               //Thiết lập chân kết nối I2C (SDA,SCL);
//    lcd.init();                      //Khởi tạo LCD
//    lcd.clear();                     //Xóa màn hình
//    lcd.backlight();
//    pinMode(configWifi, INPUT);
//    Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
//
//    wifiManager.setConfigPortalTimeout(60); // 1 minute
//
//    if (!wifiManager.autoConnect(Device_Name)) {
//      Serial.println("failed to connect and hit timeout");
//      lcd.clear();
//      lcd.setCursor(0,0);
//      lcd.print("Dang Ket Noi....");
//      delay(3000);
//      //reset and try again, or maybe put it to deep sleep
//      ESP.restart();
//      delay(5000);
//    }
//  
//    lcd.clear();
//    lcd.setCursor(0,0);
//    lcd.print("Wifi connecting to ");
//    lcd.print(WiFi.SSID().c_str());
//  
//    lcd.print("\nConnecting");
//    while ( WiFi.status() != WL_CONNECTED ) {
//      delay(500);
//      lcd.print(".");
//    }
//  
//    lcd.clear();
//    lcd.setCursor(0,0);
//  
//    lcd.println("Wifi Connected!");
//    lcd.print("IP:");
//    lcd.print(WiFi.localIP());
//    delay(1000);
//    
//    lcd.clear();
//}
//
//void loop() {
//
//  // BUTTON EVENT
//  if (digitalRead(configWifi) == HIGH) {
//      delay(30);
//      if (digitalRead(configWifi) == HIGH) {
//        delay(3000);
//        if (digitalRead(configWifi) == HIGH) {
//          wifiManager.resetSettings();
//          delay(1000);
//          ESP.restart();
//        }
//      }
//    }
//
//    // CALCULATE ELECTRIC PARAMETER
//    voltage = pzem.voltage();
//    current = pzem.current();
//    power = pzem.power();
//    energy = pzem.energy();
//    frequency = pzem.frequency();
//    pf = pzem.pf();
//
//    // DISPLAY PARAMETER
//    SerialMonitor();
//    LCD1602();
//
//    //PUT DATA
//    putData();
//
//    //DELAY CYCLE
//    delay(2000);
//}
//
////void OLED{
////    display.clearDisplay();
////    display.setTextSize(1);
////    display.setTextColor(SSD1306_WHITE);  // Draw white text
////    display.setCursor(0, 0);              // Start at top-left corner
////    display.print("   ELECTRIC METER");
////    display.setTextSize(2);
////    display.setCursor(0, 15);
////    display.print(power);            display.print("W");
////    display.setTextSize(1);                  // Normal 1:1 pixel scale
////    display.setCursor(0, 35);
////    display.print(voltage);          display.print("V / ");
////    display.print(current);          display.print("A");
////    display.setCursor(0, 45);
////    display.print(frequency, 1);     display.print("Hz/");
////    display.print(pf);               display.print("/");
////    display.print(energy);           display.print("kWh");
////
////    display.display();
////}
//
//void LCD1602()
//{
//  if (isnan(voltage)) {
//    lcd.setCursor(0, 0);  lcd.print("  CHUA KET NOI  ");
//    lcd.setCursor(0, 1);  lcd.print("      PZEM      ");
//  }
//
//  else {
//    // DISPLAY
//    lcd.setCursor(0, 0);  lcd.print(voltage, 0);   lcd.print("V ");
//    lcd.setCursor(5, 0);  lcd.print(current, 1);   lcd.print("A");   padding100(current);
//    lcd.setCursor(11, 0); lcd.print(power, 0);     lcd.print("W");   padding1000(power);
//    lcd.setCursor(0, 1);  lcd.print(frequency, 0); lcd.print("Hz ");
//    lcd.setCursor(5, 1);  lcd.print(pf, 2);        lcd.print(" ");
//    lcd.setCursor(10, 1); lcd.print(energy, 2);    lcd.print("kW"); padding1000(energy);
//  }
//}
//
//void SerialMonitor()
//{
//  // Check if the data is valid
//  if (isnan(voltage)) {
//    Serial.println("Error reading voltage");
//  } else if (isnan(current)) {
//    Serial.println("Error reading current");
//  } else if (isnan(power)) {
//    Serial.println("Error reading power");
//  } else if (isnan(energy)) {
//    Serial.println("Error reading energy");
//  } else if (isnan(frequency)) {
//    Serial.println("Error reading frequency");
//  } else if (isnan(pf)) {
//    Serial.println("Error reading power factor");
//  } else {
//
//    // Print the values to the Serial console
//    Serial.print("Voltage: ");      Serial.print(voltage);      Serial.println("V");
//    Serial.print("Current: ");      Serial.print(current);      Serial.println("A");
//    Serial.print("Power: ");        Serial.print(power);        Serial.println("W");
//    Serial.print("Energy: ");       Serial.print(energy, 3);     Serial.println("kWh");
//    Serial.print("Frequency: ");    Serial.print(frequency, 1); Serial.println("Hz");
//    Serial.print("PF: ");           Serial.println(pf);
//  }
//  Serial.println();
//}  // end SerialMonitor
//
//void padding1000(int padVar) {
//  if (padVar < 10) {
//    lcd.print("   ");
//  }
//  else if (padVar < 100) {
//    lcd.print("  ");
//  }
//  else if (padVar < 1000) {
//    lcd.print(" ");
//  }
//}
//void padding100(int padVar) {
//  if (padVar < 10) {
//    lcd.print("  ");
//  }
//  else if (padVar < 100) {
//    lcd.print(" ");
//  }
//}
//void padding10(int padVar) {
//  if (padVar < 10) {
//    lcd.print(" ");
//  }
//}
//
//void putData(){
//  if (!isnan(voltage)){
//    // PUT DATA
//    Firebase.setFloat(fbdo,"/ESP8266/voltage", voltage);
//    Firebase.setFloat(fbdo,"/ESP8266/current", current);
//    Firebase.setFloat(fbdo,"/ESP8266/power", power);
//    Firebase.setFloat(fbdo,"/ESP8266/frequency", frequency);
//    Firebase.setFloat(fbdo,"/ESP8266/pf", pf);
//    Firebase.setFloat(fbdo,"/ESP8266/energy", energy);
//  }
//}

#include <PZEM004Tv30.h>

PZEM004Tv30 pzem(D4, D3);

void setup() {

  Serial.begin(115200);

}

void loop() {

    float voltage = pzem.voltage();

    if(voltage != NAN){

        Serial.print("Voltage: "); Serial.print(voltage); Serial.println("V");

    } else {

        Serial.println("Error reading voltage");

    }

    float current = pzem.current();

    if(current != NAN){

        Serial.print("Current: "); Serial.print(current); Serial.println("A");

    } else {

        Serial.println("Error reading current");

    }

    float power = pzem.power();

    if(current != NAN){

        Serial.print("Power: "); Serial.print(power); Serial.println("W");

    } else {

        Serial.println("Error reading power");

    }

    float energy = pzem.energy();

    if(current != NAN){

        Serial.print("Energy: "); Serial.print(energy,3); Serial.println("kWh");

    } else {

        Serial.println("Error reading energy");

    }

    float frequency = pzem.frequency();

    if(current != NAN){

        Serial.print("Frequency: "); Serial.print(frequency, 1); Serial.println("Hz");

    } else {

        Serial.println("Error reading frequency");

    }

    float pf = pzem.pf();

    if(current != NAN){

        Serial.print("PF: "); Serial.println(pf);

    } else {

        Serial.println("Error reading power factor");

    }

    Serial.println();

    delay(2000);

}
