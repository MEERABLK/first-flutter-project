import 'dart:io';
import 'dart:math';


 /* 1. Write a Dart program that takes values from a user and calculate area
   circumference of a circle using an anonymous function.
 */
void main() {
  // Take input from user
  stdout.write("Enter radius of the circle: ");
  int radius = int.parse(stdin.readLineSync()!);


  var area = (int r) {
   return pi * r * r;
  };

  // anonymous function for circumference
  var circumference = (int r) {
  return   2 * pi * r;
  };


  print("Area of circle: ${area(radius)}");
  print("Circumference of circle: ${circumference(radius)}");
}
