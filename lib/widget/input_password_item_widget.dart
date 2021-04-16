import 'package:flutter/material.dart';

class InputPasswordWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final TextInputType textInputType;

  const InputPasswordWidget({Key key, this.controller, this.hintText, this.icon, this.textInputType}) : super(key: key);

  @override
  _InputPasswordWidgetState createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  bool obsText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: widget.controller,
        obscureText: obsText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: widget.hintText,
          prefixIcon: widget.icon,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obsText = !obsText;
              });
            },
            child: obsText == true ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          ),
        ),
      ),
    );
  }
}
