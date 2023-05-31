import 'package:flutter/material.dart';
import 'package:permix/screen/login-screen.dart';
import 'package:permix/screen/product-screen.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/util/custom-page-route-builder.dart';
import 'package:permix/util/routes.dart';
import 'package:permix/widget/common/custom-text-form-field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Log in with email & password',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const CustomTextFormField(
            labelText: "Email",
          ),
          const CustomTextFormField(
            labelText: "Password",
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
                    CustomPageRouteBuilder.getPageRouteBuilder(
                        const ProductScreen()));
              },
              child: const Text('Log in'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Container(
                      child: Text('Feature is coming soon!'),
                    ),
                  ),
                );
              },
              child: Text('Forgot Password'),
            ),
          )
        ],
      ),
    );
  }
}
