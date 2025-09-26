import 'dart:io';
import 'dart:math';

/**
 * 3. Write a Dart program that uses a lambda expression to find and display
    simple calculator of two numbers entered by the user.
 */
void main() {
  // Take input from user
  stdout.write("Enter first number: ");
  int num1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Second number: ");
  int num2 = int.parse(stdin.readLineSync()!);

  var multiply = (int a, int b)=>a*b;
  var add = (int a, int b)=>a+b;
  var minus = (int a, int b)=>a-b;
  var divide = (int a, int b)=>a/b;


print('==Calculator==');
  print("Addition:  ${add(num1,num2)}");
  print("Substraction:  ${minus(num1,num2)}");
  print("Multiplication:  ${multiply(num1,num2)}");
  print("Division:  ${divide(num1,num2)}");
}
