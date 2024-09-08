import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_widgets/custombutton.dart';
// import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ui/auth/login/login.dart';
import 'package:flutter_application_1/ui/home.dart';
import 'package:flutter_application_1/utils/toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool showPassword = false;
  bool isloading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  child: Image.asset('assets/images/home.png'),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  controller: email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 28,
                        color: Colors.teal,
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  controller: password,
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          showPassword = !showPassword;
                          setState(() {});
                        },
                        icon: showPassword
                            ? Icon(
                                Icons.visibility_off,
                                size: 29,
                              )
                            : Icon(
                                Icons.visibility,
                                size: 29,
                              ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(
                        Icons.lock_open_outlined,
                        size: 28,
                        color: Colors.teal,
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  height: 30,
                ),
                Custom_button(
                  height: 70.h,
                  width: 200.w,
                  text: 'SignUp',
                  isloading: isloading,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      isloading = true;
                    });
                    print('hello');
                    auth
                        .createUserWithEmailAndPassword(
                            email: email.text.toString().trim(),
                            password: password.text.toString().trim())
                        .then((val) {
                      // Fluttertoast.showToast(
                      //     msg: 'SignUp Successfully',
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.TOP,
                      //     timeInSecForIosWeb: 1,
                      //     backgroundColor: Colors.green,
                      //     textColor: Colors.white,
                      //     fontSize: 16.0);
                      toast().taostPopUp(
                          'SignUp Successfully', Colors.green, Colors.white);
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => Home()));
                      setState(() {
                        isloading = false;
                      });
                      email.clear();
                      password.clear();
                    }).onError((Error, val) {
                      // Fluttertoast.showToast(
                      //     msg: Error.toString(),
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.TOP,
                      //     timeInSecForIosWeb: 1,
                      //     backgroundColor: Colors.red,
                      //     textColor: Colors.white,
                      //     fontSize: 16.0);
                      toast().taostPopUp(Error, Colors.red, Colors.white);
                      setState(() {
                        isloading = false;
                      });
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an Account? ',
                      style: TextStyle(fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Text(
                        'signIn',
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
