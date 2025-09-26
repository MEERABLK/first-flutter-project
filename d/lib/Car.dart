//INHERITANCE
class Car
{
  var speed = 100;

}
class Bike extends Car {
  var speed = 200;

  void display() {
    print("the speed of car ${super.speed}");
  }
}

void main()
{
  Bike b = new Bike();
  b.display();
}
