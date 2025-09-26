
Future<String> fetchUserData(String userId) async
{
  print('fetch user data $userId');
  await Future.delayed(Duration(seconds: 2));
  return 'user data for $userId successfully received';
}
void main() {
  String userId = 'admin';

  fetchUserData(userId).then((data)
{
print('PROCESSING :  $data');
return 'data processed';
}). then((processedResult)
  {
    print('processed result: $processedResult');
  }).catchError((error)
  {
    print('an error');
  {
    print('an error $error');
  }});

}

