import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_widgets/custombutton.dart';
import 'package:flutter_application_1/ui/auth/login/login.dart';
import 'package:flutter_application_1/utils/toast.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dataController = TextEditingController();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((val) {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => SignIn()));
                }).onError((Error, val) {
                  toast().taostPopUp(Error, Colors.red, Colors.white);
                });
              },
              icon: Icon(Icons.logout)),
          IconButton(
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.currentUser!.delete().then((val) {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => SignIn()));
                }).onError((Error, val) {
                  toast().taostPopUp(Error, Colors.red, Colors.white);
                });
              },
              icon: Icon(Icons.delete)),
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: dataController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 50,
            ),
            Custom_button(
              isloading: isloading,
              height: 50.0,
              text: 'Add data',
              width: 200.0,
              onPressed: () {
                setState(() {
                  isloading = true;
                });
                DatabaseReference db;
                db = FirebaseDatabase.instance.ref('Todo');
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                db.child(id).set({
                  'id': id,
                  'name': 'Mohammad AbdulSamad',
                  'Todo': dataController.text.toString().trim()
                }).then((val) {
                  dataController.clear();
                  setState(() {
                    isloading = false;
                    toast()
                        .taostPopUp('Data Saved', Colors.green, Colors.white);
                  });
                }).onError((Error, val) {
                  toast().taostPopUp(Error, Colors.red, Colors.white);
                });
              },
            )
          ],
        ),
      )),
    );
  }
}
