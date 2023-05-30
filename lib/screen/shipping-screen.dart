import 'package:flutter/material.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/widget/common/app-bar.dart';
import 'package:permix/widget/common/custom-text-form-field.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            vertical: 30, horizontal: DEFAULT_HORIZONTAL_PADDING),
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            Text(
              'SHIPPING INFO',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            CustomTextFormField(labelText: 'Gmail'),
            CustomTextFormField(labelText: 'Street Address'),
            Row(
              children: [
                Expanded(child: CustomTextFormField(labelText: 'City')),
                SizedBox(
                  width: 20,
                ),
                Expanded(child: CustomTextFormField(labelText: 'Postcode')),
              ],
            ),
            Row(
              children: [
                Expanded(child: CustomTextFormField(labelText: 'Phone number')),
                SizedBox(
                  width: 20,
                ),
                Expanded(child: SizedBox()),
              ],
            ),
            Expanded(
                child: Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Back'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
