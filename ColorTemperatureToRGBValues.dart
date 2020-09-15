import 'dart:math';

//  Created by Tamal Sen

/*
    Algorithm taken from Tanner Helland's post: http://www.tannerhelland.com/4435/convert-temperature-rgb-algorithm-code/
    For further reading, try these following links:
    1. https://en.wikipedia.org/wiki/Color_temperature#Correlated_color_temperature
    2. Improving Tanner Helland's algo: http://www.zombieprototypes.com/?p=210
    3. Demo ^ https://emberglitch.com/color-temperature/

*/

// Given a temperature (in Kelvin), estimate an RGB equivalent
class KelvinColorConverter {
  final double temperature;

  KelvinColorConverter({this.temperature});

  double red, green, blue;

  List<int> toRGB() {
    // Temperature must fall between 1000 and 40000 degrees
    double newTemp = temperature < 1000 ? 1000 : (temperature > 40000 ? 40000 : temperature);

    // All calculations require tmpKelvin \ 100, so only do the conversion once
    var percentKelvin = newTemp / 100;

    //Calculate each color in turn
    red = clamp(percentKelvin <= 66
        ? 255
        : (329.698727446 * pow(percentKelvin - 60, -0.1332047592)));
    green = clamp(percentKelvin <= 66
        ? (99.4708025861 * log(percentKelvin) - 161.1195681661)
        : 288.1221695283 * pow(percentKelvin, -0.0755148492));
    blue = clamp(percentKelvin >= 66
        ? 255
        : (percentKelvin <= 19
        ? 0
        : 138.5177312231 * log(percentKelvin - 10) - 305.0447927307));

    return [red.toInt(), green.toInt(), blue.toInt()];
  }
}

double clamp(double value) {
  return value > 255 ? 255 : (value < 0 ? 0 : value);
}
