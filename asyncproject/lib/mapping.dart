void main()
{
  List<int>list =[10,20,30,40,50];
  list.forEach((n)=>print(n));

  print('----------map---------');


var doubledList = list.map((n)=>n*2);
print(doubledList);

  print('---------conditions in list----------');
bool sad = false;
var cart = ['milk','ghee', if(sad)'Beer'];
print(cart);


  print('---------where----------');
  List<int>numbers =[10,20,30,40,50,89,98];
  List<int>even = numbers.where((number)=>number.isEven).toList();
  print(even);

  print('---------spread operator----------');

  List list1 =['Mango','Apple'];
  List list2 =['Orange','Avocado','Grape'];
  List list3 =['Lemon'];

  var combinedList = [...list1,...list2,...list3];

}
