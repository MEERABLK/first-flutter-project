void main()
{
  final s = CountStreams(7);
  s.listen((data)
      {
        print('data yield: $data');
      });

}

//for streamble objects
Stream<int>CountStreams(int max)async*
{
  for(int i =1; i<max;i++)
    {
      await Future.delayed(Duration(seconds: 2));
      //create new value yield will throw listenable object
      //so we enable the auto options for object
      yield i;

    }
}