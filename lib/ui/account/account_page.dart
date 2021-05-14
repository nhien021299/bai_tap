import 'package:bai_tap/ui/widgets/input_email_item_widget.dart';
import 'package:bai_tap/ui/widgets/input_password_item_widget.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool signUpObscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(
                "Account info",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green, height: 1.5),
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

                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.green,
                  child: Text(
                    "Continue",
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
            ],
          ),
        ),
      ),
    );
  }
}
