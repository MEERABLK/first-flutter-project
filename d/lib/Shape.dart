abstract class Shape {
  void area();
}

class Square extends Shape {
  double side;

  Square(this.side); // constructor

  @override
  void area() {
    var answer = side * side;
    print("Area of Square = $answer");
  }
}

class Circle extends Shape {
  double radius;

  Circle(this.radius); // constructor

  @override
  void area() {
    var pi = 3.14;
    var answer = pi * radius * radius;
    print("Area of Circle = $answer");
  }
}

void main() {
  Square s = Square(5);   // square with side 5
  Circle g = Circle(3);   // circle with radius 3

  s.area(); // prints: Area of Square = 25.0
  g.area(); // prints: Area of Circle = 28.26
}
