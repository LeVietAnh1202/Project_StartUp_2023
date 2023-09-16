/*
 *** THAY ĐỔI ĐỊA CHỈ PZEM 004T ***
  Youtube  : https://www.youtube.com/c/403ERRORVN
  Fanpage  : https://www.facebook.com/403ERRORVN
  Blog     : https://thichchetaotv.blogspot.com/

  Date     : 14/04/2022
  Update   : 

  Library:
  Blynk    : https://github.com/blynkkk/blynk-library
  PZEM004T : https://github.com/mandulaj/PZEM-004T-v30
*/


#include <PZEM004Tv30.h>
#include <SoftwareSerial.h>

#define PZEM_RX_PIN D6  // ESP8266 RX
#define PZEM_TX_PIN D5  // ESP8266 TX

SoftwareSerial pzemSWSerial(PZEM_RX_PIN, PZEM_TX_PIN);
PZEM004Tv30 pzem(pzemSWSerial);

// * Set your address over here..
// * The address can be between 0x01 and 0xF7
#if !defined(SET_ADDRESS)
#define SET_ADDRESS 0x12
#endif

// Set to true in order to increment the address every iteration
#define INCREMENT false


void setup() {
  Serial.begin(115200);
}

void loop() {
    static uint8_t addr = SET_ADDRESS;

    // Print out current custom address
    Serial.print("Previous address:   0x");
    Serial.println(pzem.readAddress(), HEX);

    // Set the custom address
    Serial.print("Setting address to: 0x");
    Serial.println(addr, HEX);
    if(!pzem.setAddress(addr))
    {
      // Setting custom address failed. Probably no PZEM connected
      Serial.println("Error setting address.");
    } else {
      // Print out the new custom address
      Serial.print("Current address:    0x");
      Serial.println(pzem.readAddress(), HEX);
      Serial.println();
    }

    // Increment the address every loop if desired
    if(INCREMENT){
      addr++;
      if(addr >= PZEM_DEFAULT_ADDR)
        addr = 0x01;
    }

    delay(5000);
}
