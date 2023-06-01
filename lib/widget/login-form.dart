import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validator/form_validator.dart';
import 'package:permix/provider/auth-provider.dart';
import 'package:permix/widget/common/custom-text-form-field.dart';

import '../screen/product-screen.dart';
import '../util/custom-page-route-builder.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String _enteredEmail = '';
  String _enteredPassword = '';
  late String error;
  var _isLoading = false;

  void _onSaveEmail(String? email) {
    _enteredEmail = email!;
  }

  void _onSavePassword(String? password) {
    _enteredPassword = password!;
  }

  Future _onLoginTap() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      await ref
          .read(authProvider.notifier)
          .login(_enteredEmail, _enteredPassword);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    error = ref.watch(authProvider)!.error;

    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Log in with email & password',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                CustomTextFormField(
                  labelText: "Email",
                  validator: ValidationBuilder().email().maxLength(50).build(),
                  onSaved: _onSaveEmail,
                  enteredValue: _enteredEmail,
                ),
                CustomTextFormField(
                  labelText: "Password",
                  validator:
                      ValidationBuilder().minLength(5).maxLength(20).build(),
                  enteredValue: _enteredPassword,
                  onSaved: _onSavePassword,
                  isPassword: true,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: Text(
                      error,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: ElevatedButton(
                    onPressed: () async {
                      await _onLoginTap();
                      if (ref.watch(authProvider)!.user.id != '') {
                        Navigator.of(context).push(
                            CustomPageRouteBuilder.getPageRouteBuilder(
                                  ProductScreen()));
                      }
                    },
                    child: const Text('Log in'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
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
