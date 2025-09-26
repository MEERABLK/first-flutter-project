/**
 * 2. Create a class SuperBank withaconstructor. Then, create a subclass RBC that
    extends SuperBank. Now include default constructor, named constructor,
    parametrized constructor for both classes and write objects to access all the 6
    constructors. Include super keywork wherever necessary.

 */
class SuperBank {
// default constructor
  int _checkingAccountNumber=0;
  int _savingAccountNumber=0;

SuperBank()
  {
    print("superclass default constructor");
  }
  SuperBank.named()
  {
    print('superclass named constructor');
  }

  SuperBank.parameterized(int savingAccount,int checkingAccount)
  {
    this._checkingAccountNumber = checkingAccount;
    this._savingAccountNumber = savingAccount;
    print('superclass parameterized constructor');
  }

  int get getCheckingAccountNumber
  {
    return _checkingAccountNumber;
  }

  void set setCheckingAccountNumber(int checkingAccountNumber)
  {
    this._checkingAccountNumber = checkingAccountNumber;
  }


  int get getSavingAccountNumber
  {
    return _savingAccountNumber;
  }

  void set setSavingAccountNumber(int savingAccountNumber)
  {
    this._savingAccountNumber = savingAccountNumber;

  }
}

class RBC extends SuperBank
{
  RBC() : super() {
    print(" subclass default constructor");
  }
  RBC.named() : super.named() {
 print("subclass named constructor");
 }
  RBC.parameterized(int saving, int checking) : super.parameterized(saving, checking) {
    print("subclass parameterized constructor");
    print("  subclass received saving: $saving and checking: $checking");
  }
}

void main()
{
  print('\nDefault constructors:');
  RBC obj1 = RBC(); // Calls default constructor

  print("\nNamed Constructors:");
  RBC obj2 = RBC.named(); // Calls named constructor

  print("\nParameterized constructors:");
  RBC obj3 = RBC.parameterized(5000, 10000); // Calls parameterized constructor

 // SuperBank parameterized
}

