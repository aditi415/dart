// String to Number
String textNumber = '123';
int parsedInt = int.parse(textNumber);
double parsedDouble = double.parse('3.14');

// Number to String
int number = 456;
String numberText = number.toString();
String formatted = 123.456.toStringAsFixed(2); // "123.46"

// Dynamic casting
var value = '100';
int converted = value as int; // Runtime error if not int
int? safeConvert = int.tryParse('abc'); // Returns null on failure
