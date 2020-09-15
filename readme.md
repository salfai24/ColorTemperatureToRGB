# Convert Color Temperature to Actual RGB values
![](https://tannerhelland.com/images/Temperature_to_RGB_1000_to_40000.png)
Converts color temperature in Kelvin to a color in RGB color space. The conversion is designed to be fast and usable for image processing. 

Dart implementation of Tanner Helland's algorithm.

## Usage

```
import 'ColorTemperatureToRGBValues.dart'
...
void main() {
    KelvinColorConverter myConverter = KelvinColorConverter(temperature: 2300);
    myConverter.toRGB(); // returns [255, 150, 50]
    ...

}
```
