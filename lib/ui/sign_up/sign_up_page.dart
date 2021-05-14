
import 'package:bai_tap/ui/sign_in/sign_in_page.dart';
import 'package:bai_tap/ui/widgets/input_email_item_widget.dart';
import 'package:bai_tap/ui/widgets/input_password_item_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef StringValue = void Function(String);

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool signUpObscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  void onSubmit() {
    if (_isValidate()) {
      Get.to(
        SignInPage(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }

  bool _isValidate() {
    if (emailController.text.isEmpty || emailController.text.length < 6) {
      Fluttertoast.showToast(msg: "Please input email correctly !");
      return false;
    }
    if (passwordController.text.isEmpty || passwordController.text.length < 6) {
      Fluttertoast.showToast(msg: "Please input password correctly !");
      return false;
    }
    if (confirmController.text != passwordController.text) {
      Fluttertoast.showToast(msg: "Please input confirm password correctly !");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(
        FocusNode(),
      ),
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
                Text(
                  "Register Account",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green, height: 1.5),
                ),
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF4caf50)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      InputPasswordWidget(
                        controller: confirmController,
                        hintText: "Confirm",
                        icon: Icon(Icons.check_circle_rounded),
                        textInputType: TextInputType.visiblePassword,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    onPressed: () {
                      onSubmit();
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Colors.green,
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset("assets/images/facebook_icon.png"),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset("assets/images/google_icon.png"),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset("assets/images/twitter_icon.png"),
                      ),
                    ],
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
          )),
        ),
      ),
    );
  }
}
