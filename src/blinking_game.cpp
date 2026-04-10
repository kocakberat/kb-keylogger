#include <Arduino.h>
#include <Adafruit_NeoPixel.h>

#define RGB_PIN 21
#define NUMPIXELS 1

Adafruit_NeoPixel pixels(NUMPIXELS, RGB_PIN, NEO_GRB + NEO_KHZ800);

// Pre-defined colors
#define COLOR_RED   pixels.Color(0, 255, 0)
#define COLOR_GREEN pixels.Color(255, 0, 0)
#define COLOR_OFF   pixels.Color(0, 0, 0)

void setup() {
  Serial.begin(115200);
  pixels.begin();
  pixels.setBrightness(30);
  pixels.clear();
  pixels.show();

  Serial.println("System Ready! Enter '1' for Green, '2' for Red, or '0' to turn off:");
}

void loop() {
  // Check if there is data waiting in the Serial buffer
  if (Serial.available() > 0) {
    // Read the incoming character
    char incomingByte = Serial.read();

    // Evaluate the input
    switch (incomingByte) {
      case '1':
        Serial.println("Setting color to GREEN");
        Serial.print("Given command: ");
        Serial.println(incomingByte);
        pixels.setPixelColor(0, COLOR_GREEN);
        break;

      case '2':
        Serial.println("Setting color to RED");
        Serial.print("Given command: ");
        Serial.println(incomingByte);
        pixels.setPixelColor(0, COLOR_RED);
        break;

      case '0':
        Serial.println("Turning LED OFF");
        pixels.setPixelColor(0, COLOR_OFF);
        break;

      case '\n': // Ignore newline characters
      case '\r':
        break;

      default:
        Serial.print("Unknown command: ");
        Serial.println(incomingByte);
        break;
    }

    // Update the physical LED
    pixels.show();
  }
}