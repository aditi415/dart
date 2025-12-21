void main() {
  int temperature = 25;
  
  // Basic if-else
  if (temperature > 30) {
    print('It\'s hot outside');
  } else if (temperature > 20) {
    print('Nice weather');
  } else {
    print('It\'s cold');
  }
  
  // Conditional expression
  String weather = temperature > 25 ? 'Hot' : 'Cool';
  
  // Null-aware operator
  String? userName;
  String displayName = userName ?? 'Guest'; // If null, use 'Guest'
  
  // Cascade notation (..)
  List<int> numbers = [1, 2, 3]
    ..add(4)
    ..add(5)
    ..remove(1);
  print(numbers); // [2, 3, 4, 5]
}
