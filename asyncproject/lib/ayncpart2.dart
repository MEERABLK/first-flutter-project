void main() async{
  print('start');

  try
      {
        final user = await fetch();
        print('received user : $user');

      }
      catch(error)
  {
    print('Error:  $error');
  }
  print('end');
}
Future<String>fetch()async {
  await Future.delayed(Duration(seconds: 3));
  return 'J Doe';
}