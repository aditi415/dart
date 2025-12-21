void main() {
  // Numbers
  int wholeNumber = 42;
  double decimalNumber = 3.14;
  num anyNumber = 10;  // Can be int or double
  anyNumber = 10.5;
  
  // Strings
  String singleLine = 'Hello Dart';
  String multiLine = '''
    This is
    a multi-line
    string
  ''';
  
  // String interpolation
  String greeting = 'Hello, $name!';  // Simple variable
  String message = 'Next year, you will be ${age + 1}';  // Expression
  
  // Booleans
  bool isRaining = false;
  bool isSunny = true;
  bool isWeekend = (DateTime.now().weekday >= 6);
  
  // Type checking
  print(name.runtimeType);  // String
  print(age is int);        // true
  print(price is! String);  // true
}
