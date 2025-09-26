class Human
{
  void run()
  {
    print("human is running");
  }
}
class Man extends Human{
  void run()
  {

    super.run();
    print("boy is running");
  }

}
void main()
{
  Man m = new Man();
  m.run();
}