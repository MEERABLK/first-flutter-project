import 'dart:async';
import 'dart:io';

/*
Write a function applyFunction that takes two parameters: a list of integers
and a function. The function should modify each element of the list based on
 the provided function.
 */
void applyFunction(List<int> numbers, int Function(int) modifier) {
  for (int i = 0; i < numbers.length; i++)
  {
    numbers[i] = modifier(numbers[i]);
  }
}
/*
Implement a function transformlist that accepts a list of strings and returns
a new list where each string is modified using an anonymous function.
The anonymous function should capitalize every other letter in the string.
 */
List<String> transformlist(List<String> strings) {
  return strings.map((str) {
    StringBuffer result = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i % 2 == 1) { // Capitalize every other letter (starting from index 1).
        result.write(str[i].toUpperCase());
      } else {
        result.write(str[i]);
      }
    }
    return result.toString();
  }).toList();
}


/*
Create a list of numbers and write an arrow function that filters out all even
 numbers, squares the odd numbers, and returns the result.
 */
void task3() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8];
  List<int> result = numbers
      .where((n) => n % 2 != 0) // Filter out evens (keep odds).
      .map((n) => n * n) // Square odds.
      .toList(); // Arrow functions used inline.
  print('Task 3 result: $result'); // Output: [1, 9, 25, 49]
}


/*
Write a function greetUser that takes two optional positional arguments:
firstName and LastName. The function should return a formatted greeting.
 If no arguments are provided, return "Hello, Guest".
 */

String greetUser ([String? firstName, String? lastName]) {
  if (firstName == null && lastName == null) return 'Hello, Guest';
  String fullName = (firstName ?? '') + (lastName != null ? ' $lastName' : '');
  return 'Hello, $fullName';
}


/*
Implement a function createEmail that accepts named arguments: username,
domain, and extension. Make the extension argument optional with a default
value of "com".
 */
String createEmail({required String username, required String domain, String extension = 'com'}) {
  return '$username@$domain.$extension';
}

/*
Create a class Rectangle that has named constructors for square
(which creates a square with equal length and width) and normal
 (which creates a regular rectangle). Write a function that demonstrates
 the use of both constructors.
 */
class Rectangle {
  double length;
  double width;

  // Named constructor for square.
  Rectangle.square(double side) : length = side, width = side;

  // Named constructor for normal rectangle.
  Rectangle.normal(this.length, this.width);

  @override
  String toString() => 'Rectangle(${length}x${width})';
}

void demoRectangles() {
  var square = Rectangle.square(5.0);
  var rect = Rectangle.normal(4.0, 6.0);
  print('Task 6: $square, $rect'); // Output: Rectangle(5.0x5.0), Rectangle(4.0x6.0)
}


/*
Write a function streamExample that generates a stream of integers from 1 to 100
. The function should filter only prime numbers(premier) from the stream and print them.
 */Stream<int> streamExample() async* {
  for (int i = 1; i <= 100; i++) {
    yield i;
  }
}

bool isPrime(int n) {
  if (n < 2) return false;
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void task1() {
  streamExample()
      .where((n) => isPrime(n))
      .listen((prime) => print('Prime: $prime'));
}

/*
Create a function fetchUserData that simulates a network call
(use Future.delayed) to fetch user data and returns a Future with user
information (a map). Then write a function to call fetchUserData and print
the result.
 */
Future<Map<String, String>> fetchUserData() {
  return Future.delayed(Duration(seconds: 1), () => {
    'name': 'Alice',
    'email': 'alice@example.com'
  });
}

Future<void> task2() async {
  var data = await fetchUserData();
  print('User data: $data');
}


/*
Implement a function compute that accepts two integers and a
function. The function parameter should be able to perform any operation
(addition, subtraction, multiplication, etc.). Use an anonymous function to
 pass these operations.
 */
int compute(int a, int b, int Function(int, int) op) {
  return op(a, b);
}

void task() {
  print('Add: ${compute(5, 3, (x, y) => x + y)}'); // 8
  print('Subtract: ${compute(5, 3, (x, y) => x - y)}'); // 2
  print('Multiply: ${compute(5, 3, (x, y) => x * y)}'); // 15
}


/*
Refactor a function that reads a list of file paths asynchronously and returns
 the size of each file using arrow functions in combination with Future and
 Stream.
 */
Stream<int> getFileSizes(List<String> paths) {
  return Stream.fromFutures(
      paths.map((path) => Future.delayed(Duration(milliseconds: 50), () => path.length * 10))
  );
}

Future<void> task4() async {
  var paths = ['file1.txt', 'file2.txt'];
  await for (int size in getFileSizes(paths)) {
    print('File size: $size');
  }
}

/*
Create a stream that emits a sequence of integers and uses an
 anonymous function to apply a transformation that squares each integer
  only if it is even.
 */
void task5() {
  Stream.periodic(Duration(milliseconds: 50), (i) => i + 1).take(10)
      .map((n) => n % 2 == 0 ? n * n : n)
      .listen((result) => print('Transformed: $result'));
}


/*
Create a class Person that takes both positional and named arguments
(e.g., first name, last name, age, etc.). Write a function that creates
different instances of Person using different combinations of these arguments.
 */
class Person {
  final String firstName;
  final String? lastName;
  final int? age;

  Person(this.firstName, {this.lastName, this.age});

  @override
  String toString() => '$firstName ${lastName ?? ''} (age: ${age ?? 'N/A'})';
}

void task6() {
  var p1 = Person('Alice');
  var p2 = Person('Bob', lastName: 'Smith', age: 30);
  print('Person 1: $p1');
  print('Person 2: $p2');
}
void main() async {
  // 1. Demonstrate applyFunction
  print('--- Demonstrate applyFunction ---');
  List<int> numbers = [1, 2, 3, 4, 5];
  print('Original list: $numbers');
  applyFunction(numbers, (n) => n * 2);
  print('Modified list after applyFunction (times 2): $numbers\n');

  // 2. Demonstrate transformlist
  print('--- Demonstrate transformlist ---');
  List<String> words = ['hello', 'world', 'dart'];
  print('Original list: $words');
  List<String> transformed = transformlist(words);
  print('Transformed list (capitalize every other letter): $transformed\n');

  // 3. Demonstrate task3 (filter odds, square them)
  print('--- Demonstrate task3 ---');
  task3();
  print('');

  // 4. Demonstrate greetUser
  print('--- Demonstrate greetUser ---');
  print(greetUser()); // No args
  print(greetUser('John')); // First name only
  print(greetUser('Jane', 'Doe')); // Both names
  print('');

  // 5. Demonstrate createEmail
  print('--- Demonstrate createEmail ---');
  print(createEmail(username: 'user123', domain: 'example'));
  print(createEmail(username: 'user456', domain: 'example', extension: 'org'));
  print('');

  // 6. Demonstrate demoRectangles (named constructors)
  print('--- Demonstrate demoRectangles ---');
  demoRectangles();
  print('');

  // 7. Demonstrate task1 (stream of primes)
  print('--- Demonstrate task1 (prime numbers stream) ---');
  task1();
  await Future.delayed(Duration(seconds: 2));  // Wait for stream to finish printing
  print('');

  // 8. Demonstrate task2 (fetch user data async)
  print('--- Demonstrate task2 (fetchUserData) ---');
  await task2();
  print('');

  // 9. Demonstrate task (compute with anonymous functions)
  print('--- Demonstrate task (compute) ---');
  task();
  print('');

  // 10. Demonstrate task4 (async file sizes)
  print('--- Demonstrate task4 (getFileSizes) ---');
  await task4();
  print('');

  // 11. Demonstrate task5 (stream transform squares even numbers)
  print('--- Demonstrate task5 (stream transform) ---');
  task5();
  await Future.delayed(Duration(seconds: 1));  // Wait for stream to finish printing
  print('');

  // 12. Demonstrate task6 (Person class)
  print('--- Demonstrate task6 (Person instances) ---');
  task6();
}
