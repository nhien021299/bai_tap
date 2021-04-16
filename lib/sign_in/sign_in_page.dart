import 'package:bai_tap/home/main_page.dart';
import 'package:bai_tap/sign_up/sign_up_page.dart';
import 'package:bai_tap/widget/input_email_item_widget.dart';
import 'package:bai_tap/widget/input_password_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  final String email;
  final String password;

  const SignInPage({Key key, this.email, this.password}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isLogin = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    if (_isValidate()) {
      if (emailController.text == widget.email &&
          passwordController.text == widget.password) {
        Get.offAll(MainPage());
      }
    }
  }

  bool _isValidate() {
    if (emailController.text.isEmpty ||
        emailController.text.length < 3 ||
        emailController.text != widget.email) {
      Fluttertoast.showToast(msg: "Please input email correctly !");
      return false;
    }
    if (passwordController.text.isEmpty || passwordController.text.length < 3) {
      Fluttertoast.showToast(msg: "Please input password correctly !");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    alignment: Alignment.bottomRight,
                    child: Image.asset("assets/images/dish.png"),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Food Now",
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Sign in with your email and password  \nor continue with social media",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InputEmailWidget(
                            controller: emailController,
                            hintText: "Email",
                            icon: Icon(Icons.mail_outline),
                            textInputType: TextInputType.text,
                          ),
                          InputPasswordWidget(
                            controller: passwordController,
                            hintText: "Password",
                            icon: Icon(Icons.lock_outline_rounded),
                            textInputType: TextInputType.visiblePassword,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              onPressed: () {
                                // login();
                                Get.offAll(MainPage());
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.green,
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  padding: EdgeInsets.all(5),
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: Image.asset(
                                      "assets/images/facebook_icon.png"),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  padding: EdgeInsets.all(5),
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: Image.asset(
                                      "assets/images/google_icon.png"),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  padding: EdgeInsets.all(5),
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: Image.asset(
                                      "assets/images/twitter_icon.png"),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              print('OK');
                              Get.to(SignUpPage());
                            },
                            child: Text(
                              "Don't have an account ? Sign Up",
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    alignment: Alignment.bottomLeft,
                    child: Image.asset("assets/images/dish_2.png"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
