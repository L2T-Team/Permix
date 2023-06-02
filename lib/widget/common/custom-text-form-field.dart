import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import '../../util/constant.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key? key,
    this.labelText,
    this.enteredValue = '',
    this.isPassword = false,
    this.onSaved = _defaultCallback,
    this.validator = _defaultCallback,
  }) : super(key: key);

  final labelText;
  final isPassword;
  String enteredValue;
  final Function(String?)? onSaved;
  final Function(String?)? validator;

  static _defaultCallback(String? field) {
    print('Default callback reach for field $field');
  }

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isShowed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isShowed = widget.isPassword ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextFormField(
        initialValue: widget.enteredValue,
        decoration: InputDecoration(
          labelText: widget.labelText,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: SECONDARY_COLOR)),
          labelStyle: const TextStyle(color: PRIMARY_COLOR),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isShowed = !isShowed;
                    });
                  },
                  icon:
                      Icon(isShowed ? Icons.visibility : Icons.visibility_off),
                )
              : const SizedBox(),
          suffixIconColor: PRIMARY_COLOR,
        ),
        style: Theme.of(context).textTheme.bodyMedium,
        obscureText: !isShowed,
        validator: (val) {
          return widget.validator!(val);
        },
        onSaved: widget.onSaved,
      ),
    );
  }
}
