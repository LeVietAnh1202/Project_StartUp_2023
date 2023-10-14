
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <ArduinoJson.h>

const char* ssid = "LAHU";
const char* password = "12345678";

//Your Domain name with URL path or IP address with path
const char* serverName = "http://jsonplaceholder.typicode.com/posts";
char jsonOutput[128];

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
  if ((millis() - lastTime) > timerDelay) {
    //Check WiFi connection status
    if(WiFi.status()== WL_CONNECTED){
      WiFiClient client;
      HTTPClient http;
    
      // Your Domain name with URL path or IP address with path
      http.begin(client, serverName);
      
      // If you need an HTTP request with a content type: application/json, use the following:
      http.addHeader("Content-Type", "application/json");

      const size_t CAPACITY = JSON_OBJECT_SIZE(1);
      StaticJsonDocument<CAPACITY> doc;

      JsonObject ob = doc.to<JsonObject>();
      ob["title"] = "Lahu";

      serializeJson(doc, jsonOutput);
      
      int httpResponseCode = http.POST(String(jsonOutput));
     
      if (httpResponseCode > 0) {

        String payload = http.getString();
        Serial.println("\nStatusCode: " + String(httpResponseCode));
        Serial.println(payload);

        http.end();
      
      } else {
        Serial.printf("[HTTP] POST... failed, error: %s\n", http.errorToString(httpResponseCode).c_str());
      }
 
    }
    else {
      Serial.println("WiFi Disconnected");
    }
    lastTime = millis();
  }
}
