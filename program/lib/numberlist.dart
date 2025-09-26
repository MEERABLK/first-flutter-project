import 'dart:io';
import 'dart:math';

/**
 * 5. Create a list of numbers, perform various operations on it, and demonstrate
    some common list methods. Now, create a list of Strings, and try to apply
    same operations that you applied on numbers.
 */
void main() {
  print("\n<<<<<<<<<<<<<<<<<<<<<<<Numbers<<<<<<<<<<<<<<<<<<<<<<<");
  List<int>number = [10,20,56];
  print(number);
//or
 // number.forEach(print);
  print("${number[2]} is at index ${number.indexOf(56)} in number the list" );
  print("First element in number list is: ${number.first}" );
  print("last element in number list is: ${number.last}" );
  print("reversed: ${number.reversed}" );
  number.add(7);
  print("after adding number:" );
  number.forEach((n)=>print(n));
  print("is number list empty: " +number.isEmpty.toString() );

  if(number.isNotEmpty)
    {
      print('element added at index 0');
      number.insert(0, 9);
      print(number);
    }
  if(number.isNotEmpty)
  {
    print("elements added at index 3");
    number.insertAll(3, [90, 8]);
    print(number);
    print('number list size:');
    print(number.length);

  }
  print('removing by range');
  number.removeRange(1,3);
  print(number);

print("\n<<<<<<<<<<<<<<<<<<<<<<<Strings<<<<<<<<<<<<<<<<<<<<<<<");
  List<String>names = ["Raj","John","Rocky"];
  print(names);
  print("${names[1]} is at index ${names.indexOf("John")} in the strings list" );
  print("First element in number list is: ${names.first}" );
  print("last element in number list is: ${names.last}" );
  print("reversed: ${names.reversed}" );
  names.add('Kelly');
  print("after adding name:" );
  names.forEach((n)=>print(n));

  print("is names list empty: " +names.isEmpty.toString() );

  if(names.isNotEmpty)
  {
    print('added name at index 0');
    names.insert(0, 'Helios');
    print(names);
  }
  if(names.isNotEmpty)
  {
    print('added two names at index 2');
    names.insertAll(2, ['Melanie', 'Orpheus']);
    print(names);
    print(names.length);

  }
  print('removing by range');
  names.removeRange(2,4);
  print(names);

}
