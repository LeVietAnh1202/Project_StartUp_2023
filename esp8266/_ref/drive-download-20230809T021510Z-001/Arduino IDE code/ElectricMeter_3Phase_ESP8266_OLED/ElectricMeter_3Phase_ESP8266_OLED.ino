/*
  Vision Old:
  Vision New:

 *** CÔNG TƠ ĐIỆN TỬ WIFI 3 PHA + OLED 0.96 inch ***
 *** ELECTRIC METER 3 PHASE + OLED 0.96 inch ***
  Youtube  : https://www.youtube.com/c/403ERRORVN
  Fanpage  : https://www.facebook.com/403ERRORVN
  Blog     : https://thichchetaotv.blogspot.com/

  Date     : 02/07/2023
  Update   :

  History:
                +


  Library:
  Blynk           : https://github.com/blynkkk/blynk-library
  PZEM004T        : https://github.com/mandulaj/PZEM-004T-v30
  WiFiManager     : https://github.com/tzapu/WiFiManager
  Adafruit_SSD1306: https://github.com/adafruit/Adafruit_SSD1306
  Adafruit_GFX.h  : https://github.com/adafruit/Adafruit-GFX-Library

*/

#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>     // https://github.com/adafruit/Adafruit-GFX-Library
#include <Adafruit_SSD1306.h> //https://github.com/adafruit/Adafruit_SSD1306
#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266.h> // https://github.com/blynkkk/blynk-library
#include <TimeLib.h>            // https://github.com/PaulStoffregen/Time
#include <WidgetRTC.h>
#include <DNSServer.h>
#include <ESP8266WebServer.h>
#include <WiFiManager.h> // https://github.com/tzapu/WiFiManager
#include <EEPROM.h>
#include <PZEM004Tv30.h> // https://github.com/mandulaj/PZEM-004T-v30
#include <SoftwareSerial.h>

#define Device_Name "Electric Meter 3 Phase"
#define LED_Status D7  // LED Status
#define configWifi D0  // GPIO16 - D0 Config WiFi
#define PZEM_RX_PIN D6 // GPIO2  - D4 ESP8266
#define PZEM_TX_PIN D5 // GPIO0  - D3 ESP8266

#define SCREEN_WIDTH 128    // OLED display width, in pixels
#define SCREEN_HEIGHT 64    // OLED display height, in pixels
#define OLED_RESET -1       // Reset pin # (or -1 if sharing Arduino reset pin)
#define SCREEN_ADDRESS 0x3C ///< See datasheet for Address; 0x3D for 128x64, 0x3C for 128x32
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

//========== SETTING WiFi ==========//
#define BLYNK_TEMPLATE_ID "TMPLmZq9q-Ml"
#define BLYNK_TEMPLATE_NAME "Cong To Dien Tu"
#define BLYNK_AUTH_TOKEN "gNNOmV5w_V0Wcp90vAnCGjBalOH6FG0v"
// Comment this out to disable prints and save space
#define BLYNK_PRINT Serial
char auth[] = BLYNK_AUTH_TOKEN;

BlynkTimer timer;
WidgetRTC rtc;
// PZEM
#define NUM_PZEMS 3
PZEM004Tv30 pzems[NUM_PZEMS];
SoftwareSerial pzemSWSerial(PZEM_RX_PIN, PZEM_TX_PIN);

WiFiManager wifiManager;

float
    L1_voltage = 0,
    L1_current = 0,
    L1_power = 0,
    L1_energy = 0,
    L1_frequency = 0,
    L1_pf = 0,
    L2_voltage = 0,
    L2_current = 0,
    L2_power = 0,
    L2_energy = 0,
    L2_frequency = 0,
    L2_pf = 0,
    L3_voltage = 0,
    L3_current = 0,
    L3_power = 0,
    L3_energy = 0,
    L3_frequency = 0,
    L3_pf = 0,
    Energy_today,
    Energy_Yesterday,
    Energy_This_month,
    Energy_Last_month,
    energy_log_day,
    energy_log_month;

int
    conv1 = 0, // SYSTEM PARAMETER
    conv2 = 0,
    d_hour = 0,
    d_day = 0;

String
    currentTime,
    currentDate;
unsigned long time1 = 0;

const unsigned char Logo[] PROGMEM = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x03, 0xc0, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3e, 0x03, 0xc0, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x07, 0xe0, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x07, 0xe0, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x07, 0xe0, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x07, 0xe0, 0xfc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0xff, 0xff, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x1f, 0xff, 0xff, 0xff, 0xff, 0xf8, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 0xff, 0xfc, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 0xff, 0xfc, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 0xff, 0xde, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 0xff, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 0xff, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x80, 0x00, 0x00, 0x01, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x07, 0xff, 0x80, 0x00, 0x00, 0x01, 0xff, 0xe0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0x80, 0x00, 0x00, 0x01, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0x80, 0x00, 0x00, 0x01, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0x80, 0x00, 0x00, 0x01, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0x80, 0x00, 0x00, 0x01, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x03, 0xff, 0x80, 0x00, 0x00, 0x01, 0xff, 0xc0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x80, 0x00, 0x00, 0x01, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x80, 0x3f, 0x1f, 0xf9, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x80, 0x7f, 0x1f, 0xf9, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x80, 0xff, 0x3f, 0xf1, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x81, 0xff, 0x3f, 0xf1, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x03, 0xff, 0x83, 0xfe, 0x3e, 0x01, 0xff, 0xe0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0x87, 0xfe, 0x3f, 0xe1, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0x8f, 0xbe, 0x3f, 0xe1, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0x9f, 0xff, 0x7f, 0xc1, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0x9f, 0xff, 0x7f, 0xc1, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x03, 0xff, 0x9f, 0xff, 0x7c, 0x01, 0xff, 0xe0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x9f, 0xff, 0x7f, 0xe1, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x80, 0x7c, 0x7f, 0xc1, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x80, 0x7c, 0xff, 0xc1, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x80, 0xf8, 0xff, 0xc1, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x80, 0x00, 0x00, 0x01, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x03, 0xff, 0x80, 0x00, 0x00, 0x01, 0xff, 0x80, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0x80, 0x00, 0x00, 0x01, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0x80, 0x00, 0x00, 0x01, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0x80, 0x00, 0x00, 0x01, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0x80, 0x00, 0x00, 0x01, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x07, 0xff, 0x80, 0x00, 0x00, 0x01, 0xff, 0xe0, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x80, 0x00, 0x00, 0x01, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 0xff, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 0xff, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 0xff, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 0xff, 0xfc, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0xff, 0xff, 0xff, 0xff, 0xfc, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x1f, 0xff, 0xff, 0xff, 0xff, 0xf8, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x0f, 0xff, 0xff, 0xff, 0xff, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x07, 0xe0, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x07, 0xe0, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x07, 0xe0, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x07, 0xe0, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3e, 0x03, 0xe0, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1e, 0x03, 0xc0, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

int ledState = LOW;               // ledState used to set the LED
unsigned long previousMillis = 0; // will store last time LED was updated
const long interval = 1000;       // interval at which to blink (milliseconds)

void BlinkLED()
{
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis >= interval)
  {
    // save the last time you blinked the LED
    previousMillis = currentMillis;
    // if the LED is off turn it on and vice-versa:
    if (ledState == LOW)
    {
      ledState = HIGH;
    }
    else
    {
      ledState = LOW;
    }
    // set the LED with the ledState of the variable:
    digitalWrite(LED_Status, ledState);
  }
}
void clockDisplay()
{
  currentTime = String(hour()) + ":" + minute() + ":" + second();
  currentDate = String(day()) + "/" + month() + "/" + year();
}

BLYNK_CONNECTED()
{
  // Synchronize time on connection
  rtc.begin();
}

BLYNK_WRITE(V0)
{ // Button Widget chọn V0
  if (param.asInt() == 1)
  {
    pzems[0].resetEnergy();
  }
}
BLYNK_WRITE(V1)
{ // Button Widget chọn V1
  if (param.asInt() == 1)
  {
    pzems[1].resetEnergy();
  }
}
BLYNK_WRITE(V2)
{ // Button Widget chọn V1
  if (param.asInt() == 1)
  {
    pzems[2].resetEnergy();
  }
}
void ReadData()
{
  L1_voltage = pzems[0].voltage();
  L1_current = pzems[0].current();
  L1_power = pzems[0].power();
  L1_frequency = pzems[0].frequency();
  L1_pf = pzems[0].pf();
  L1_energy = pzems[0].energy();

  L2_voltage = pzems[1].voltage();
  L2_current = pzems[1].current();
  L2_power = pzems[1].power();
  L2_frequency = pzems[1].frequency();
  L2_pf = pzems[1].pf();
  L2_energy = pzems[1].energy();

  L3_voltage = pzems[2].voltage();
  L3_current = pzems[2].current();
  L3_power = pzems[2].power();
  L3_frequency = pzems[2].frequency();
  L3_pf = pzems[2].pf();
  L3_energy = pzems[2].energy();
}
void sendBlynk()
{
  Blynk.virtualWrite(V3, L1_voltage);
  Blynk.virtualWrite(V4, L1_current);
  Blynk.virtualWrite(V5, L1_power); // Watt
  Blynk.virtualWrite(V6, L1_energy);
  Blynk.virtualWrite(V7, L1_frequency);
  Blynk.virtualWrite(V8, L1_pf);

  Blynk.virtualWrite(V9, L2_voltage);
  Blynk.virtualWrite(V10, L2_current);
  Blynk.virtualWrite(V11, L2_power); // Watt
  Blynk.virtualWrite(V12, L2_energy);
  Blynk.virtualWrite(V13, L2_frequency);
  Blynk.virtualWrite(V14, L2_pf);

  Blynk.virtualWrite(V15, L3_voltage);
  Blynk.virtualWrite(V16, L3_current);
  Blynk.virtualWrite(V17, L3_power); // Watt
  Blynk.virtualWrite(V18, L3_energy);
  Blynk.virtualWrite(V19, L3_frequency);
  Blynk.virtualWrite(V20, L3_pf);

  Blynk.virtualWrite(V21, "L1");
  Blynk.virtualWrite(V22, "L2");
  Blynk.virtualWrite(V23, "L3");

} // end sendBlynk

void OLED096()
{
  if ((unsigned long)(millis() - time1) > 4000)
  {
    if (isnan(L1_voltage))
    {
      display.clearDisplay();
      display.setTextSize(2);
      // display.setTextColor(SSD1306_WHITE);  // Draw white text
      display.setCursor(8, 0); // Start at top-left corner
      display.print("    L1   ");
      display.setCursor(0, 20);
      display.print("    NOT   ");
      display.setCursor(0, 40);
      display.print(" CONNECTED");
      display.display();
    }
    else
    {
      display.clearDisplay();
      display.setTextSize(2);
      display.setTextColor(SSD1306_WHITE); // Draw white text
      display.setCursor(8, 0);             // Start at top-left corner
      display.print("    L1   ");
      display.setTextSize(2);
      display.setCursor(0, 17);
      display.print(L1_power);
      display.print("W");
      display.setTextSize(1); // Normal 1:1 pixel scale
      display.setCursor(0, 35);
      display.print(L1_voltage);
      display.print("V / ");
      display.print(L1_current);
      display.print("A");
      display.setCursor(0, 45);
      display.print(L1_frequency, 1);
      display.print("Hz/");
      display.print(L1_pf);
      display.print("/");
      display.print(L1_energy);
      display.print("kWh");

      display.setCursor(0, 55);
      display.print(currentTime);
      display.print(" | ");
      display.print(currentDate);
      display.display();
    }
  }
  if ((unsigned long)(millis() - time1) > 8000)
  {
    if (isnan(L2_voltage))
    {
      display.clearDisplay();
      display.setTextSize(2);
      display.setCursor(8, 0); // Start at top-left corner
      display.print("    L2   ");
      display.setCursor(0, 20);
      display.print("    NOT   ");
      display.setCursor(0, 40);
      display.print(" CONNECTED");
      display.display();
    }
    else
    {
      display.clearDisplay();
      display.setTextSize(2);
      display.setCursor(8, 0); // Start at top-left corner
      display.print("    L2   ");
      display.setTextSize(2);
      display.setCursor(0, 17);
      display.print(L2_power);
      display.print("W");
      display.setTextSize(1); // Normal 1:1 pixel scale
      display.setCursor(0, 35);
      display.print(L2_voltage);
      display.print("V / ");
      display.print(L2_current);
      display.print("A");
      display.setCursor(0, 45);
      display.print(L2_frequency, 1);
      display.print("Hz/");
      display.print(L2_pf);
      display.print("/");
      display.print(L2_energy);
      display.print("kWh");

      display.setCursor(0, 55);
      display.print(currentTime);
      display.print(" | ");
      display.print(currentDate);
      display.display();
    }
  }
  if ((unsigned long)(millis() - time1) > 12000)
  {
    if (isnan(L3_voltage))
    {
      display.clearDisplay();
      display.setTextSize(2);
      display.setCursor(8, 0); // Start at top-left corner
      display.print("    L3   ");
      display.setCursor(0, 20);
      display.print("    NOT   ");
      display.setCursor(0, 40);
      display.print(" CONNECTED");
      display.display();
    }
    else
    {
      display.clearDisplay();
      display.setTextSize(2);
      display.setCursor(8, 0); // Start at top-left corner
      display.print("    L3   ");
      display.setTextSize(2);
      display.setCursor(0, 17);
      display.print(L3_power);
      display.print("W");
      display.setTextSize(1); // Normal 1:1 pixel scale
      display.setCursor(0, 35);
      display.print(L3_voltage);
      display.print("V / ");
      display.print(L3_current);
      display.print("A");
      display.setCursor(0, 45);
      display.print(L3_frequency, 1);
      display.print("Hz/");
      display.print(L3_pf);
      display.print("/");
      display.print(L3_energy);
      display.print("kWh");

      display.setCursor(0, 55);
      display.print(currentTime);
      display.print(" | ");
      display.print(currentDate);
      display.display();
    }
    time1 = millis();
  }
}
// end hienthiLCD

void SerialMonitor()
{
  // Check if the data is valid
  if (isnan(L1_voltage))
  {
    Serial.println("============================ ERROR READING L1 ============================");
  }
  else
  {
    Serial.print("V1: ");
    Serial.print(L1_voltage, 2);
    Serial.print("V | ");
    Serial.print("A1: ");
    Serial.print(L1_current, 2);
    Serial.print("A | ");
    Serial.print("P1: ");
    Serial.print(L1_power, 2);
    Serial.print("W | ");
    Serial.print("E1: ");
    Serial.print(L1_energy, 2);
    Serial.print("kWh | ");
    Serial.print("F1: ");
    Serial.print(L1_frequency, 2);
    Serial.print("Hz | ");
    Serial.print("PF1: ");
    Serial.println(L1_pf, 2);
  }
  if (isnan(L2_voltage))
  {
    Serial.println("============================ ERROR READING L2 ============================");
  }
  else
  {
    Serial.print("V2: ");
    Serial.print(L2_voltage, 2);
    Serial.print("V | ");
    Serial.print("A2: ");
    Serial.print(L2_current, 2);
    Serial.print("A | ");
    Serial.print("P2: ");
    Serial.print(L2_power, 2);
    Serial.print("W | ");
    Serial.print("E2: ");
    Serial.print(L2_energy, 2);
    Serial.print("kWh | ");
    Serial.print("F2: ");
    Serial.print(L2_frequency, 2);
    Serial.print("Hz | ");
    Serial.print("PF2: ");
    Serial.println(L2_pf, 2);
  }
  if (isnan(L3_voltage))
  {
    Serial.println("============================ ERROR READING L3 ============================");
  }
  else
  {
    Serial.print("V3: ");
    Serial.print(L3_voltage, 2);
    Serial.print("V | ");
    Serial.print("A3: ");
    Serial.print(L3_current, 2);
    Serial.print("A | ");
    Serial.print("P3: ");
    Serial.print(L3_power, 2);
    Serial.print("W | ");
    Serial.print("E3: ");
    Serial.print(L3_energy, 2);
    Serial.print("kWh | ");
    Serial.print("F3: ");
    Serial.print(L3_frequency, 2);
    Serial.print("Hz | ");
    Serial.print("PF3: ");
    Serial.println(L3_pf, 2);
  }

  Serial.println();
} // end SerialMonitor

// void energy_calculate()
// {
//   // int T_hour = hour();
//   // int D_day  = day();
//   Energy_today = energy - energy_log_day;
//   if (hour() != 0)
//   {
//     d_hour = 1;
//   }

//   if ((hour() == 0) && (d_hour == 1))
//   { // sang ngày mới
//     Energy_Yesterday = Energy_today;
//     Energy_today = 0;
//     energy_log_day = energy;
//     d_hour = 0;
//   }

//   Energy_This_month = energy - energy_log_month;
//   if (day() != 1)
//   {
//     d_day = 1;
//   }

//   if ((day() == 1) && (d_day == 1))
//   {
//     Energy_Last_month = Energy_This_month;
//     Energy_This_month = 0;
//     energy_log_month = energy;
//     d_day = 0;
//   }

//   Serial.print("Hour: ");
//   Serial.print(hour());
//   Serial.print(" | d_hour: ");
//   Serial.println(d_hour);
// }

void loadSettings()
{
  Energy_today = EEPROM.read(0) + (EEPROM.read(1) * .01);
  Energy_Yesterday = EEPROM.read(2) + (EEPROM.read(3) * .01);
  Energy_This_month = EEPROM.read(4) + (EEPROM.read(5) * .01);
  Energy_Last_month = EEPROM.read(6) + (EEPROM.read(7) * .01);
}

void saveSettings()
{
  conv1 = Energy_today * 100;
  conv2 = conv1 % 100;
  EEPROM.write(0, Energy_today);
  EEPROM.write(1, conv2);

  conv1 = Energy_Yesterday * 100;
  conv2 = conv1 % 100;
  EEPROM.write(2, Energy_Yesterday);
  EEPROM.write(3, conv2);

  conv1 = Energy_This_month * 100;
  conv2 = conv1 % 100;
  EEPROM.write(4, Energy_This_month);
  EEPROM.write(5, conv2);

  conv1 = Energy_Last_month * 100;
  conv2 = conv1 % 100;
  EEPROM.write(6, Energy_Last_month);
  EEPROM.write(7, conv2);
  EEPROM.commit(); // Saves setting changes to flash memory
}
void saveAutoloadSettings()
{
  //  EEPROM.write(11,flashMemLoad);       //STORE: Enable autoload
  // EEPROM.commit();                     //Saves setting changes to flash memory
}

int buttonState = 0;               // Trạng thái của nút SW1
int previousButtonState = 1;       // Trạng thái trước đó của nút SW1
unsigned long buttonPressTime = 0; // Thời điểm nút SW1 được nhấn
void ButtonScan()
{
  buttonState = digitalRead(configWifi); // Đọc trạng thái của nút SW1

  // Kiểm tra nếu nút SW1 được nhấn
  if (buttonState != previousButtonState)
  {
    if (buttonState == LOW)
    {
      buttonPressTime = millis(); // Lưu thời điểm nút SW1 được nhấn
    }
    else
    {
      unsigned long buttonHoldTime = millis() - buttonPressTime; // Tính thời gian nút SW1 được nhấn giữ

      // Kiểm tra nếu thời gian giữ nút SW1 là 5 giây (5000ms)
      if (buttonHoldTime >= 3000)
      {
        // thực hiện lệnh nhấn giữ 5s tại đây
        WiFiManager wifiManager;
        display.clearDisplay();
        display.setTextSize(2);
        display.setTextColor(WHITE);
        display.setCursor(0, 0);
        display.println(" WIFI NEW ");
        display.display();

        Serial.println("Erasing Config, restarting");
        wifiManager.resetSettings();
        wifiManager.autoConnect(Device_Name);
        display.clearDisplay();
        display.setCursor(0, 0);
        display.println(" COMPLETE ");
        display.display();
        delay(1000);
        // ESP.restart();
      }
    }
  }
  previousButtonState = buttonState; // Lưu trạng thái trước đó của nút SW1
}

void setup()
{
  Serial.begin(115200);
  pinMode(configWifi, INPUT);
  pinMode(LED_Status, OUTPUT);
  EEPROM.begin(512);
  loadSettings();

  if (!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS))
  {
    Serial.println(F("SSD1306 allocation failed"));
    for (;;)
      ; // Don't proceed, loop forever
  }

  wifiManager.setConfigPortalTimeout(60); // 1 minute
  if (!wifiManager.autoConnect(Device_Name))
  {
    Serial.println("failed to connect and hit timeout");
    display.clearDisplay();
    display.setTextSize(1);
    display.setTextColor(WHITE);
    display.setCursor(0, 0);
    display.println("Dang Ket Noi....");
    display.display();
    delay(3000);
    // reset and try again, or maybe put it to deep sleep
    ESP.restart();
    delay(5000);
  }

  display.clearDisplay();
  display.display();

  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0, 0);
  display.println("Wifi connecting to ");
  display.println(WiFi.SSID().c_str());

  Blynk.begin(auth, WiFi.SSID().c_str(), WiFi.psk().c_str());

  display.println("\nConnecting");
  display.display();

  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    display.print(".");
    display.display();
  }

  display.clearDisplay();
  display.display();
  display.setCursor(0, 0);

  display.println("Wifi Connected!");
  display.print("IP:");
  display.println(WiFi.localIP());
  display.display();
  delay(1000);

  display.clearDisplay();
  display.display();

  display.drawBitmap(0, 0, Logo, 128, 64, WHITE);
  display.display();
  delay(3000);
  display.clearDisplay();

  display.display();

  setSyncInterval(10 * 60); // Sync interval in seconds (10 minutes)
  // Display digital clock every 1 seconds
  timer.setInterval(1000L, clockDisplay);

  // For each PZEM, initialize it
  for (int i = 0; i < NUM_PZEMS; i++)
  {
    // Initialize the PZEMs with Software Serial
    pzems[i] = PZEM004Tv30(pzemSWSerial, 0x10 + i);
  }

} // end setup

void loop()
{
  BlinkLED();
  ButtonScan();
  ReadData();
  SerialMonitor();
  OLED096(); // Select if using OLED 0.96 display
  sendBlynk();
  Blynk.run();
  timer.run();

} // end loop
