import 'dart:io';
import 'dart:math';

/**
    4. Write a Dart program that uses a map to store the names and salary of a group
    of people. Then, print the names of people whose salary are in between 50000
    to 75000.

 */
void main() {
  // Take input from user
  Map<String, int> groupOfPeople = {
    "Alex": 52000,
    "John": 90000,
    "Melissa": 65000,
    "Anna": 20000,
  };

  //entries returns key value pairs
  print('The people with salaries between 50k and 75k are:');
  for(var entry in groupOfPeople.entries) {
    if (entry.value > 50000 && entry.value < 75000) {
      //return key(names)
      print(entry.key);
    }
  }

}
