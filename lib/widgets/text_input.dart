import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String label;
  final String hint;
  final Function validator;
  final Function onSave;
  final bool password;
  final TextInputType keyboardType;

  TextInput(
      this.label,
      this.hint,
      {
        this.validator,
        this.onSave,
        this.password = false,
        this.keyboardType = TextInputType.text,
      }
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: this.validator,
      onSaved: this.onSave,
      obscureText: password,
      keyboardType: keyboardType,
      style: TextStyle(
        color: Colors.deepOrange,
        fontSize: 18
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.deepOrange,
          fontSize: 18
        ),
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(22),
        ),
        errorStyle: TextStyle(
          fontSize: 18
        )
      ),
    );
  }

}
