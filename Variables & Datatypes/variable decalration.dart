// Explicit type declaration
String name = 'John';
int age = 25;
double height = 5.9;
bool isStudent = true;

// Type inference with 'var'
var city = 'New York'; // Dart infers String
var score = 95;        // Dart infers int
var price = 19.99;     // Dart infers double

// Dynamic type (use sparingly!)
dynamic anything = 'Hello';
anything = 100;        // Can change type
anything = true;       // Can change again

// Final (runtime constant)
final birthYear = 1995;
// birthYear = 2000; // ERROR: Can't change final

// Const (compile-time constant)
const pi = 3.14159;
const gravity = 9.8;
// const currentTime = DateTime.now(); // ERROR: Not compile-time

// Late initialization
late String description;
void initialize() {
  description = 'Initialized later';
}
