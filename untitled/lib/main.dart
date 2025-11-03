import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey:"AIzaSyC7VVOl9cLr4oTvGcWjaJlt57FUuH6pvso",
        appId: "757275601470",
        messagingSenderId: "1:757275601470:android:c606e945ebc06feed7bf6f",
        projectId: "employeeproject-4c7eb"));
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
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  String name = '';
  String password = '';

  Future<void> adduser() async {
    if (name.isNotEmpty && password.isNotEmpty) {
      await users.add({'name': name, 'password': password});
      setState(() {
        name = '';
        password = '';
      });
    }
  }

  // function to update
  Future<void> updateUser(String id, String newName) async {
    if (newName.isNotEmpty) {
      try {
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
          ElevatedButton(onPressed: adduser, child: Text('Add user to FS')),
          SizedBox(height: 10,),
          Expanded(
              child: StreamBuilder<QuerySnapshot> (
                stream: users.snapshots(),
                builder: (context, snapshot) {
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