import 'package:flutter/material.dart';

import '../../util/constant.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.isPassword = false,
  }) : super(key: key);

  final labelText;
  final isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextFormField(
        // The validator receives the text that the user has entered.
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: SECONDARY_COLOR)),
          labelStyle: TextStyle(color: PRIMARY_COLOR),
          suffixIcon:
              isPassword ? Icon(Icons.remove_red_eye_outlined) : SizedBox(),
          suffixIconColor: PRIMARY_COLOR,
        ),
        style: Theme.of(context).textTheme.bodyMedium,
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
