import "dart:io";

//final variables
final name = "Ricky";
final String msg = "how are you";

//main method that runs
void main()
{
  //declare variables without explicitly specifying their type using var
  var name ="Peter";
  var roll_no = 24;
  var n1 =10;
  var n2 = 5;

  //print statements and arithmetic operations like C#
  print("hello");
  print("n1+n2 = ${n1+n2}");
  print("n1-n2 = ${n1-n2}");
  print("n1*n2 = ${n1*n2}");
  print("n1/n2 = ${n1/n2}");


  print("My name is  ${name}. My roll number is ${roll_no}.");

  //printed emojis with unicode characters
  var heart_symbol = "\u2665";
  var laugh_symbol = '\u{1f600}';

  //print the variables
  print(heart_symbol) ;
  print(laugh_symbol) ;

  //reverse integer numbers
  // 1) create a variable that stores the number 123
  int number=123;

  int currentNumber=0;
  int reverseNumber =0;

  //while the number is above 0
  while(number>0)
  {
    //store the remainder value to currentNumber
    //first the output will be 3 because the remainder of 123 divided by 10 is
    //3 in second iteration the number is 12 modulo 10 remiander then becomes 2
    //in third iteration number is 1 modulo 10 is 0.1 which evaluates to 1 when
    // multiplied by 10 remainder is 1
    currentNumber = number %10;//321
    //then the reversenumber variable stores the value 3 of currentNumber
    //because 0 times 10= 0 plus 3 equal 3
    //in second iteration where number is 12 reverseNumber has value of 3
    // we multiply is by 10 it gives 30 plus 2 because of currentNumber
    //in third iteration reverseNumber becomes 320 plus 1 which equals 321
    reverseNumber = reverseNumber*10+currentNumber;

    //to divide, use truncating division operator
    //123 divided by 10 equal 12 as integer
    //12 divided by 10 equals 1 as integer
    //in third iteration 1 divided by 10 evaluates to 0 because of truncation
    //there is no 4th loop
    number = number ~/ 10;
    //print 3 first then loop again with 12 as number
    //prints 32 in second iteration
    //final reverse is equal to 321
    print(reverseNumber);
  }

  //check the data types of variables
  var count = 10;
  var name2 = "Sena";

  //evaluates to true returning a boolean
  print(count is int);

  //returns true
  print(name2 is String);

  //create a List as int type
  List<int> Lnums = [2,6,6,7,8];

  //find min and max

  //1) create variable max and min to be compared and printed they both start
  //with the first value from array
  int max=Lnums.first;
  int min =Lnums.first;

  //to accumulate
  int sum =0;

  //loop to loop through the array for comparing as long as the length of array
  for(int i =0;i<Lnums.length;i++)
  {
    //sum variable adds each value and does after each iteration( 2+6+6+7+8=29)
    sum = sum + Lnums[i];

    //if the element in array is above the first number
    if (Lnums[i] > max)
    {
      //max stores it otherwise it does not
      max = Lnums[i];
    }

    //if element is less than first number
    if (Lnums[i] < min)
    {
      //min stores it
      min = Lnums[i];
    }
  }
  print(sum);
  print(max);
  print(min);


  print("\n");

//create pyramid patterns
  // 1
  // 1 1
  // 1 1 1
  // 1 1 1 1
  // 1 1 1 1 1

  //to read column(j) and row(i) wise
  //as long as row is less than 4 increment
  for(int i =0; i<=4; i++)
  {
    //as long as column is inferior to row
    for(int j =0;j<=i; j++)
    {
      //output 1
      stdout.write("1 ");
    }
    //add space
    print("");
  }



  // 1
  // 2   3
  // 4   5   6
  // 7   8   9   10
  print("\n");

  int display =1;

  //as long as row is inferior to 3
  for(int i =0; i<=3; i++)
  {
    //as long as column is inferior to row
    for(int j =0;j<=i; j++)
    {
      //increment the  variable display by 1 to output in column
      stdout.write(" ${display++}  ");

    }
    print(" ");
  }



  // 1
  // 1  2  3
  // 1  2  3  4
  // 1  2  3  4  5
  print("\n");
  int output=1;
  for(int i =1; i<=5; i++)
  {

    //as long as column is inferior to row
    for(int j =1;j<=i; j++)
    {
      stdout.write(" ${j}  ");

    }
    print(" ");
  }

  // 1
  // 2   2
  // 3   3   3
  // 4   4   4   4
  // 5   5   5   5   5
  print("\n");

  for(int i =1; i<=5; i++)
  {

    //as long as column is inferior to row
    for(int j =1;j<=i; j++)
    {
      stdout.write(" ${i}  ");

    }
    print(" ");
  }

}
