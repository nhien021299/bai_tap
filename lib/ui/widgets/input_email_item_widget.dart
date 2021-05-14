import 'package:flutter/material.dart';

class InputEmailWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final TextInputType textInputType;

  const InputEmailWidget({Key key, this.controller, this.hintText, this.icon, this.textInputType}) : super(key: key);

  @override
  _InputEmailWidgetState createState() => _InputEmailWidgetState();
}

class _InputEmailWidgetState extends State<InputEmailWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: widget.hintText,
          prefixIcon: widget.icon,
        ),
      ),
    );
  }
}
