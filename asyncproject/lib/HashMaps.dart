import 'dart:collection';

main()
{
  HashMap map1 = new HashMap<int,String>();
  LinkedHashMap map2 = new LinkedHashMap<int,String>();
  SplayTreeMap map3 = new SplayTreeMap<int,String>();

  //add update the value of a key
  map1[1] = 'A';

  //MapEntry if entry does not exist in the map use putIfAbsent method
  map1.putIfAbsent(1,()=> 'A');
  //entry key 1 already exists so ignores A2
  map1.putIfAbsent(1,()=> 'A2');
  //adds entry key 2 value b
  map1.putIfAbsent(2,()=> 'C');

  print('map1:$map1');

  map1.update(1, (e)=>'B');
  map1.update(1, (e) => '${e}A');

//get size
map1.length;

//check whether map  contains key
map1.containsKey(1);

//contains a value?
map1.containsValue('A');

//remove a key
map1.remove(2);


//remove entries whose key modulo 2 equals 0 or whose value is C

map1.removeWhere((key, value)=>key%2==0||value=='C');

map1.clear();

//loop though each entry
map1.forEach((key,value)
{
  print('key: $key, value: $value');
});


//to map value and key
var mappedHashMap = map1.map((key,value)
      {
        return new MapEntry(key, '$value mapped');
      });
print('mappedHashMap: $mappedHashMap');


}