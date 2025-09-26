// set of named constant values

enum Operations
{
  plus,minus,multiply,divide
}
void main() {
  const a = 1;
  const b = 2;
  //const op = Operations.minus;
  //switch (op) {

  for (var op in Operations.values) {
    switch (op) {
      case Operations.plus:
        print('$a + $b = ${a + b}');
        break;
      case Operations.minus:
        print('$a - $b = ${a - b}');
        break;
      case Operations.multiply:
        print('$a * $b = ${a * b}');
        break;
      case Operations.divide:
        print('$a / $b = ${a / b}');
        break;
    }
  }
}