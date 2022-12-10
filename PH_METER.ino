#define BLYNK_TEMPLATE_ID           "TMPLmr1sJ9KT"
#define BLYNK_DEVICE_NAME           "UAS Pirdas"
#define BLYNK_AUTH_TOKEN            "v01BsO05Vn2W524ONK9apeHWN_8vDTIT"

#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266.h>

char auth[] = BLYNK_AUTH_TOKEN;

// Your WiFi credentials.
// Set password to "" for open networks.
char ssid[] = "ssid";
char pass[] = "password";

BlynkTimer timer;

void sendSensor()
{
  float PH4 = 3.25;
  float PH7 = 2.79;
  float ph_sensor = analogRead(A0);
  double Vout = 3.3 / 1024.0 * ph_sensor;

  double ph_step = (PH4 - PH7) / 3;
  double Po = 7.00 + ((PH7 - Vout) / ph_step);

  String stats = "None";
  if(Po < 6.80){
    stats= "Asam";
  }else if(Po >= 6.80 && Po <= 7.50){
    stats   = "Normal";
  }else if(Po > 7.50){
    stats = "Basa";
  }
  
  // You can send any value at any time.
  // Please don't send more that 10 values per second.
  Blynk.virtualWrite(V0, Vout);
  Blynk.virtualWrite(V2, Po);
  Blynk.virtualWrite(V1, stats);
}

void setup()
{
  // Debug console
  Serial.begin(115200);

  Blynk.begin(auth, ssid, pass);
  // You can also specify server:
  //Blynk.begin(auth, ssid, pass, "blynk.cloud", 80);
  //Blynk.begin(auth, ssid, pass, IPAddress(192,168,1,100), 8080);

  // Setup a function to be called every second
  timer.setInterval(1000L, sendSensor);
}

void loop()
{
  Blynk.run();
  timer.run();
}
