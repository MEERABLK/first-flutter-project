import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize api key like google map key like giving lat long of paris in rl has a api key
  await Firebase.initializeApp(
    //everything come from the JSON file
    //curent key is api key app number is appid
    //mobilesdk_app_id is messagingSenderId
    //projectId is projectId
      options: FirebaseOptions(apiKey:"AIzaSyDUw0lGcd6vnbR0mPpTZWoRUDi48Qng76s",
          appId: "1093030335881",
          messagingSenderId: "1:1093030335881:android:7f8761ecaaaee874a9bd58",
          projectId: "dashboard-b41bd"));
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFS(),
    );
  }
}

class MyFS extends StatefulWidget {
  MyFS({super.key});

  @override
  State<MyFS> createState() => _MyFSState();
}

class _MyFSState extends State<MyFS> {
  // we are creating a db folder that is being referred as Users
  // which is created as Instance (Root Collection/folder)
  // CollectionReference contains all reference points from firebase
  //the entire store data could be accessed through the instance names USERS
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  //what we want to add to the db
  String name = '';
  String password = '';

  //function to add the data to the cloud
  Future<void> adduser() async {
    if (name.isNotEmpty && password.isNotEmpty) {
      //access by the name of the key
      //so that fetching would be feasible by using Map
      await users.add({'name': name, 'password': password});
      //change to the null value to write the second data
      setState(() {
        name = '';
        password = '';
      });
    }
  }

  // function to update
  //this id is the document id from the cloud used to refer a particular obj
  //to change the particular instance go for the async
  Future<void> updateUser(String id, String newName) async {
    if (newName.isNotEmpty) {

      try
      {
        await users.doc(id).update({'name': newName});
      } catch (error) {
        print('Failed to update');
      }
    } else {
      print('Enter a valid name');
    }
  }

  // function to delete the user
  Future<void> deleteUser(String id) async {
    await users.doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FS CRUD'),
      ),
      body: Column(
        children: [
          TextField(
            //store in the variable the value
            onChanged: (value) => name = value,
            decoration: InputDecoration(hintText: 'Type your name'),
          ),

          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (value) => password = value,
            decoration: InputDecoration(hintText: 'Type your password'),
            obscureText: true,
          ),
          SizedBox(
            height: 10,
          ),
          //
          ElevatedButton(onPressed: adduser, child: Text('Add user to FS')),
          SizedBox(height: 10,),
          Expanded(
            //change data simultaneously
            //query snapshot(chunk of data) is the way to manipulate the db with a
            //junk of data as a result
              child: StreamBuilder<QuerySnapshot> (
                stream: users.snapshots(),
                builder: (context, snapshot)
                {
                  //id there is no data to say something happening
                  if(!snapshot.hasData) return Text('Loading....');
                  return ListView(
                      children: snapshot.data!.docs.map ((doc) {
                        return ListTile(
                          title: Text(doc['name']),
                          subtitle: Text('Password: ${doc['password']}',),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          String newName = '';
                                          return AlertDialog(
                                            title: Text("Edit User"),
                                            content: TextField(
                                              onChanged: (value) => newName = value,
                                              decoration: InputDecoration(hintText: 'Enter new Name'),

                                            ),
                                            actions: [
                                              ElevatedButton(onPressed: () {
                                                updateUser(doc.id, newName);
                                                Navigator.pop(context);
                                              }, child: Text('Update'))
                                            ],
                                          );
                                        });
                                  },
                                  child: Text("Edit")),
                              TextButton(
                                  onPressed: () => deleteUser(doc.id),
                                  child: Text('Delete'))
                            ],
                          ),
                        );
                      }).toList()
                  );
                },
              ))
        ],
      ),
    );
  }
}
