import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validator/form_validator.dart';
import 'package:permix/provider/auth-provider.dart';
import 'package:permix/screen/menu-screen.dart';
import 'package:permix/screen/product-screen.dart';
import 'package:permix/util/custom-page-route-builder.dart';

import 'common/custom-text-form-field.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  ConsumerState<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _isLoading = false;

  Future _onSignUpTap() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      await ref.read(authProvider.notifier).signUp(
            _enteredEmail,
            _enteredPassword,
            _enteredName,
          );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var error = ref.watch(authProvider)!.error;
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: "Account Name",
                  validator:
                      ValidationBuilder().minLength(5).maxLength(50).build(),
                  enteredValue: _enteredName,
                  onSaved: (val) => _enteredName = val!,
                ),
                CustomTextFormField(
                  labelText: "Email",
                  validator: ValidationBuilder().email().maxLength(50).build(),
                  enteredValue: _enteredEmail,
                  onSaved: (val) => _enteredEmail = val!,
                ),
                CustomTextFormField(
                  labelText: "Password",
                  enteredValue: _enteredPassword,
                  validator:
                      ValidationBuilder().minLength(5).maxLength(20).build(),
                  onSaved: (val) => _enteredPassword = val!,
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
                /*CustomTextFormField(
            labelText: "Confirm Password",
            enteredValue: _enteredRePassword,
            onSaved: (val) => _enteredRePassword = val!,
            isPassword: true,
          ),*/
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: ElevatedButton(
                    onPressed: () async {
                      await _onSignUpTap();
                      if (ref.watch(authProvider)!.user.id != '') {
                        Navigator.of(context).pushReplacement(
                            CustomPageRouteBuilder.getPageRouteBuilder(
                                MenuScreen()));
                      }
                      // Navigator.of(context).push(
                      //   PageRouteBuilder(
                      //     pageBuilder: (_, __, ___) => ProductScreen(),
                      //     transitionDuration: Duration(seconds: 1),
                      //     transitionsBuilder: (_, a, __, c) =>
                      //         FadeTransition(opacity: a, child: c),
                      //   ),
                      // );
                    },
                    child: const Text('Create Account'),
                  ),
                ),
              ],
            ),
          );
  }
}
