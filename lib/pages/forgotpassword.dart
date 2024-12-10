import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/signup.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController mailcontroller = new TextEditingController();
  String email = "";
  final _formkey = GlobalKey<FormState>();
  //reset pw
  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Mật khẩu đã được gửi về Email ",
        style: TextStyle(
          fontSize: 18,
        ),
      )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-foud") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Không tìm thấy tài khoản",
          style: TextStyle(
            fontSize: 18,
          ),
        )));
      }
    }
  }

  // --------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Khôi phục mật khẩu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Nhập Email",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
                child: Form(
                    key: _formkey,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white70,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextFormField(
                              controller: mailcontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Vui long nhap Email";
                                }
                                return null;
                              },
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white70,
                                  size: 30,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  email = mailcontroller.text;
                                });
                                resetPassword();
                              }
                            },
                            child: Container(
                              width: 140,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Gửi Email",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Bạn chưa có tài khoản?",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
                                child: Text(
                                  "Tạo tài khoản",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 184, 166, 6),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
