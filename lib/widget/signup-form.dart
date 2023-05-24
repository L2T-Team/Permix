import 'package:flutter/material.dart';
import 'package:permix/screen/product-screen.dart';

import 'common/custom-text-form-field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const CustomTextFormField(
            labelText: "Account Name",
          ),
          const CustomTextFormField(
            labelText: "Gmail",
          ),
          const CustomTextFormField(
            labelText: "Password",
            isPassword: true,
          ),
          const CustomTextFormField(
            labelText: "Confirm Password",
            isPassword: true,
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => ProductScreen(),
                    transitionDuration: Duration(seconds: 1),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                );
              },
              child: const Text('Create Account'),
            ),
          ),
        ],
      ),
    );
  }
}
