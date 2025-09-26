abstract class Person
{
  void displayInfo();

}
class Boy extends Person
{
  void displayInfo()
  {
    print("my name is jonathan");
  }
}

class Girl extends Person{
  void displayInfo()
  {
    print("My name is Garcia");
  }
}

void main ()
{
  Boy b = new Boy();
  Girl g = new Girl();
  b.displayInfo();
  g.displayInfo();
}