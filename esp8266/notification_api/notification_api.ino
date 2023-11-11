/*
  Rui Santos
  Complete project details at Complete project details at https://RandomNerdTutorials.com/esp8266-nodemcu-http-get-post-arduino/

  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files.
  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
  
  Code compatible with ESP8266 Boards Version 3.0.0 or above 
  (see in Tools > Boards > Boards Manager > ESP8266)
*/

#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>

const char* ssid = "dohoa";
const char* password = "hoithaychien";

//Your Domain name with URL path or IP address with path
//const char* serverName = "https://nodejs-push-notification.onrender.com/api/send-notification";
//const char* serverName = "https://backendnodejs-03nf.onrender.com/api/employees/get-all";
//const String serverName = "https://api.publicapis.org/entries";
//const String serverName = "https://216.24.57.253/api/employees/get-all";
//const String serverName = "https://backendnodejs-03nf.onrender.com/api/employees/get-all";
//const String serverName = "https://backendnodejs-03nf.onrender.com/api/employees/create";
//const String serverName = "http://localhost:3001/api/employees/get-all";
const String serverName = "https://nodejs-push-notification.onrender.com/api/send-notification";


// the following variables are unsigned longs because the time, measured in
// milliseconds, will quickly become a bigger number than can be stored in an int.
unsigned long lastTime = 0;
// Timer set to 10 minutes (600000)
//unsigned long timerDelay = 600000;
// Set timer to 5 seconds (5000)
unsigned long timerDelay = 5000;

void setup() {
  Serial.begin(115200);

  WiFi.begin(ssid, password);
  Serial.println("Connecting");
  while(WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to WiFi network with IP Address: ");
  Serial.println(WiFi.localIP());
 
  Serial.println("Timer set to 5 seconds (timerDelay variable), it will take 5 seconds before publishing the first reading.");
}

void loop() {
  //Send an HTTP POST request every 10 minutes
//  if ((millis() - lastTime) > timerDelay) {
  if (digitalRead(D4) == 0) {
    while (digitalRead(D4) == 0);
    //Check WiFi connection status
    if(WiFi.status()== WL_CONNECTED){
      WiFiClientSecure client;
//      client.setFingerprint("SHA256:CUlRyv4TZ0vmHwmhsJkII/pz2cO4IgvR+ykqnRsOQFs");
//      WiFiClient client;
      HTTPClient https;


      client.setInsecure();
      
      // Your Domain name with URL path or IP address with path
      https.begin(client, serverName.c_str());
  
      // If you need Node-RED/server authentication, insert user and password below
      //http.setAuthorization("REPLACE_WITH_SERVER_USERNAME", "REPLACE_WITH_SERVER_PASSWORD");
  
      // Specify content-type header
//      http.addHeader("Content-Type", "application/x-www-form-urlencoded");
      // Data to send with HTTP POST
//      String httpRequestData = "api_key=tPmAT5Ab3j7F9&sensor=BME280&value1=24.25&value2=49.54&value3=1005.14";           
//      // Send HTTP POST request
//      int httpResponseCode = http.POST(httpRequestData);
      
      

      // If you need an HTTP request with a content type: text/plain
      //http.addHeader("Content-Type", "text/plain");
//      int httpResponseCode = http.POST("Hello, World!");

      // If you need an HTTP request with a content type: application/json, use the following:
        https.addHeader("Content-Type", "application/json");
//        int httpResponseCode = https.POST("{\"name\": \"Nguyễn Văn Linh\",\"age\": 22,\"position\": \"Trưởng phòng kinh doanh\"}");

int httpResponseCode = https.POST("{\"fcm_token\": \"dbzR0ayBT2Guzp3u3sginN:APA91bHYe_4BXRfbB9mRT9GJNLupr6M-X23i1AhvHhgg93bMSg6UzwpijIKQ063Op5JrEO3LMIOgaGg4Lkd367GuLLSNNTTUl5btWum8q8CH_AxPBkVbxZcHMbytqIBqU93xWyhGC_0x\"}");
//          int httpResponseCode = https.POST("{\"fcm_token\": \"cEETQ2o-SxSYhN0qZsZumK:APA91bEbWHzii8PwOHuKHIFY1-PkptFdBQ_NckOCTYAw3upkd9ufzNY9TJ5TrpMd15395paRTroYDLChvslVMJTDiz0-1-WUjhY7N7wuFd0Mvzxv7ygHks7sRWtxy8InpROYdmKHZBSV\"}");

      // Get API
//      int httpResponseCode = https.GET();
//      
        String payload = "{}"; 
//      
        if (httpResponseCode>0) {
          Serial.print("HTTP Response code: ");
          Serial.println(httpResponseCode);
          payload = https.getString();
          Serial.println(payload);
        }
        else {
          Serial.print("Error code: ");
          Serial.println(httpResponseCode);
        }
        
      // Free resources
      https.end();
    }
    else {
      Serial.println("WiFi Disconnected");
    }
    lastTime = millis();
  }
//  }
}
