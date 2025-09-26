class Parent
{
  Parent() {
    print("this is the super class constructor");
  }
  }

class Child extends Parent{
  Child():super()
  {
    print("this is the child class constructor");
  }
}
void main()
{
  //cascading
  Child c = new Child();
}