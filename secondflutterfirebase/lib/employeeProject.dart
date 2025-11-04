import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAtkkN3oyd7DuheakvTZAtUbf1g-qSlIQ4",
      appId: "1:311172227361:android:99fefc2e00d963003b1e60",
      messagingSenderId: "311172227361",
      projectId: "employeeproject2-77c05",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFS(),
    );
  }
}

class MyFS extends StatefulWidget {
  const MyFS({super.key});

  @override
  State<MyFS> createState() => _MyFSState();
}

class _MyFSState extends State<MyFS> {
  final CollectionReference users =
  FirebaseFirestore.instance.collection('Users');

  String name = '';
  String id = '';
  String phone = '';
  String email = '';

  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  Future<void> addUser() async {
    if (name.isNotEmpty && phone.isNotEmpty && id.isNotEmpty && email.isNotEmpty) {
      await users.add({
        'name': name,
        'email': email,
        'id': id,
        'phone': phone,
      });

      clearForm();
      setState(() {
        name = '';
        id = '';
        phone = '';
        email = '';
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Fill all fields")));
    }
  }

  Future<void> updateUser(String docId, String newName) async {
    if (newName.isNotEmpty) {
      try {
        await users.doc(docId).update({'name': newName});
      } catch (error) {
        print('Failed to update: $error');
      }
    } else {
      print('Enter a valid name');
    }
  }

  Future<void> deleteUser(String docId) async {
    await users.doc(docId).delete();
  }

  void clearForm() {
    _idController.clear();
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore CRUD'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              onChanged: (value) => name = value,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _idController,
              onChanged: (value) => id = value,
              decoration: const InputDecoration(labelText: 'SSN'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              onChanged: (value) => email = value,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _phoneController,
              onChanged: (value) => phone = value,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: addUser,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)
                ),
              ),
              child: const Text('Add Employee to Firestore',style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: users.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text('Loading...');

                  return ListView(
                    children: snapshot.data!.docs.map((doc) {
                      return ListTile(
                        leading: CircleAvatar(child: Text('${doc['id']}'),),
                        title: Text(doc['name']),
                        subtitle: Text('SSN: ${doc['id']}\nEmail: ${doc['email']}\nPhone: ${doc['phone']}'),
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
                                      title: const Text("Edit User"),
                                      content: TextField(
                                        onChanged: (value) => newName = value,
                                        decoration: const InputDecoration(
                                            hintText: 'Enter new name'),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            updateUser(doc.id, newName);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Update'),
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text("Edit"),
                            ),
                            TextButton(
                              onPressed: () => deleteUser(doc.id),
                              child: const Text('Delete'),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
