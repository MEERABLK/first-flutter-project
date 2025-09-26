class Student
{
  var stdName;
  var stdAge;
  var stdRoll_num;

  //private instance
String _collegeName = "vanier";

//arrow function one expression minimize the code
  String get collegeName => _collegeName;

  set collegeName(String value)
  {
    _collegeName = value;
  } //declare default value unlike java must initialize
  //String name;


showstdInfo()
{
  print("Student name is: ${stdName}");

  print("Student age is: ${stdAge}");

  print("Student roll number is: ${stdRoll_num}");

}
}
//creating optional parameter
test_param(n1,[n2])
{
  print(n1);
  print(n2);
}

//optional by name
test_param2(n1,{s1,s2})
{
  print(n1);
  print(s1);
}

int pow(int x,[int y=2])
{
  int r = 1;
  for (int i = 0; i<y; i ++)
    {
      r*=x;
    }
  return r;
}

void main()
{

  var std = Student();
  std.stdName = "John";
  std.stdAge = 24;
  std.stdRoll_num = 101;

  std.showstdInfo();

  test_param(123);

print("----------------");
  test_param2(123);
  test_param2(123,s1:'hello');
  test_param2(123,s2:'hello',s1:'world');

  // 123
  //null
  //123
  //hello
  //123
  //world

  print(pow(2,2));
  print(pow(2,4));//2 power of 4 is 16
  print(pow(3));//no value of y takes default 2 3 power of 2 is 9

// var add(int x,int y)=>x+y;
  //print(add(90,78));

double tempFarenheit = 350.00;
double celsiuis = (tempFarenheit - 32)/1.8;

//format number into string toStringAsFixed with digits in end
  print('${tempFarenheit.toStringAsFixed(1)}F = ${celsiuis.toStringAsFixed(1)}C');


}
