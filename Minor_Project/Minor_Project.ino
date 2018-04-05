#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>
#include <ESP8266HTTPClient.h>
#include <DNSServer.h>
#include <WiFiManager.h>
#include <GxEPD.h>
#include <GxGDEW027C44/GxGDEW027C44.cpp>    // 2.7" b/w/r
// FreeFonts from Adafruit_GFX
#include <Fonts/FreeMonoBold9pt7b.h>
#include <Fonts/FreeMono9pt7b.h>
#include <Fonts/FreeSerifBoldItalic9pt7b.h>
#include <GxIO/GxIO_SPI/GxIO_SPI.cpp>
#include <GxIO/GxIO.cpp>
#if defined(ESP8266)
GxIO_Class io(SPI, SS, 0, 2); 
GxEPD_Class display(io);
#endif     
String nam,username,age,email,phone,address;
const char* ssid = "AndroidAP";
const char* password = "examplemoinak";
void setup() {
 WiFi.begin(ssid, password);
  Serial.begin(115200);
  display.init();
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  
   display.setRotation(1);
  display.fillScreen(GxEPD_WHITE);
  display.setCursor(0, 0);  display.println();
  const GFXfont* f = &FreeMonoBold9pt7b;
  display.setFont(f);
  display.setTextColor(GxEPD_BLACK);
  display.println("Enter Student ID at Serial Port");
  
  display.update();
  while(!Serial.available()){
    ESP.wdtFeed();
  }
  if(Serial.available())
  {
    username=Serial.readString();
  }
  while(!updata(username))
  {
    delay(10000);
  }
  display.fillScreen(GxEPD_WHITE);
  display.setCursor(0, 0);  display.println();
  showFont("name",nam);
  ESP.wdtFeed();
  display.update();
  ESP.wdtFeed();
pinMode(5,INPUT);
}

void showFont(String argument,String data)
{
  
  const GFXfont* f = &FreeMonoBold9pt7b;
  display.setFont(f);
  display.print(argument);
  display.print(": ");
 f = &FreeSerifBoldItalic9pt7b;
  display.setFont(f);
  display.println(data);
}
int flag=0;



void loop() {
/*
  while(!Serial.available())
  {
    ESP.wdtFeed();
  }
 char c=Serial.read();*/
 int w=digitalRead(5);
if(w==HIGH)
 { if(flag==0){
  flag=1;
  ESP.wdtFeed();
    display.fillScreen(GxEPD_WHITE);
  display.setCursor(0, 0);  display.println();
  ESP.wdtFeed();
  updatenote(username);
  ESP.wdtFeed();
  display.update();
  ESP.wdtFeed();
 }
 else 
 {
  flag=0;
   display.fillScreen(GxEPD_WHITE);
  display.setCursor(0, 0);  display.println();
 showFont("name",nam);
  display.update();
 }}
}




int updata(String usname)
{
if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;  //Object of class HTTPClient
    String url="http://minormoinak.000webhostapp.com/reg.php?studentid=" + usname;
    http.begin(url);
    int httpCode = http.GET();
    //Check the returning code 
    Serial.println(httpCode);                                                                 
    if (httpCode > 0) {
      // Get the request response payload
      String payload = http.getString();
    
      Serial.println(payload);
    if(payload.length()>0){
      int i=0;
    
    /*"name":"dsfinq","username":"fjeifwj","age":"42","email":"ewjfp@dfs.ovm","phone":"r4rkwerpjew`","address":"efewfwfpw jmg"*/
      int k=payload.indexOf("name\":",i);
      if(k==-1)
        return 0;
       nam = payload.substring(k+7,payload.indexOf('"',k+7));
     /* i=k;
       k=payload.indexOf("username\":",i);
       if(k==-1)
        return 0;
      username = payload.substring(k+11,payload.indexOf('"',k+11));
      i=k;
     k=payload.indexOf("age\":",i);
       if(k==-1)
        return 0;
      age = payload.substring(k+6,payload.indexOf('"',k+6));
      i=k; 
     k=payload.indexOf("email\":",i);
       if(k==-1)
        return 0;
       email = payload.substring(k+8,payload.indexOf('"',k+8));
      i=k;
      k=payload.indexOf("phone\":",i);
       if(k==-1)
        return 0;
       phone = payload.substring(k+8,payload.indexOf('"',k+8));
      i=k;
      k=payload.indexOf("address\":",i);
       if(k==-1)
        return 0;
      address = payload.substring(k+10,payload.indexOf('"',k+10));
      i=k;
*/
      return 1;
    }
  return 0;
    http.end();   //Close connection
  }
  return 0;
}
return 0;
}




void updatenote(String usname)
{
if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;  //Object of class HTTPClient
     String url="http://minormoinak.000webhostapp.com/read.php?studentid=" + usname;
    http.begin(url);
    int httpCode = http.GET();
    //Check the returning code 
    Serial.println(httpCode);                                                                 
    if (httpCode > 0) {
      // Get the request response payload
      String payload = http.getString();
    ESP.wdtFeed();
      Serial.println(payload);
      ESP.wdtFeed();
  for(int i=0;i<payload.length();i++)
  {
    
      int k=payload.indexOf("slot\":",i);
      i=k;
      int m=payload.indexOf("notification\":",i);
      if(k!=-1 && m!=-1){
      
      String slot = payload.substring(k+7,payload.indexOf('"',k+7));
      showFont("Slot",slot);
      
      String notif = payload.substring(m+15,payload.indexOf('"',m+15));
      showFont("Notification",notif);
      ESP.wdtFeed();
      }
      else
      break;
    }
  
    http.end();   //Close connection
  }
}
}





