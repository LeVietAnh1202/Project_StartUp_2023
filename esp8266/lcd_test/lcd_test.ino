#include <Wire.h>
//========== LCD1602 ==========//
#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27, 16, 2); // địa chỉ màn hình, thường là 0X27 hoặc 0X3F

void setup() {
  // put your setup code here, to run once:
//    Wire.begin(D1,D2);               //Thiết lập chân kết nối I2C (SDA,SCL);
    lcd.init();                      //Khởi tạo LCD
    lcd.clear();                     //Xóa màn hình
    lcd.backlight();
}

void hienthi_lcd(){
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print("Energy:");
      
}

void loop() {
  // put your main code here, to run repeatedly:
hienthi_lcd();
    delay(2000);
}
