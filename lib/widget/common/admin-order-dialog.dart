import 'package:flutter/material.dart';
import 'package:permix/model/enum.dart';
import 'package:permix/widget/common/info-row.dart';

import '../../util/constant.dart';

class AdminOrderDialog extends StatefulWidget {
  const AdminOrderDialog({Key? key}) : super(key: key);

  @override
  State<AdminOrderDialog> createState() => _AdminOrderDialogState();
}

class _AdminOrderDialogState extends State<AdminOrderDialog> {
  var _currentState = OrderStatus(OrderStatusValues.failed).toString();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      child: Container(
        width: size.width - 40,
        height: size.height / 1.5,
        color: Theme.of(context).colorScheme.background,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'From',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 10),
            Text(
              'perfumelover',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'perfumelover@permix.com',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'ORDER_11231123',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 25),
            ),
            SizedBox(height: 10),
            InfoRow(Icons.calendar_month, '01/05/2023 12:30PM'),
            InfoRow(Icons.price_check, '5.000k'),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.backup_table),
                SizedBox(
                  width: 10,
                ),
                DropdownButton(
                  dropdownColor: SECONDARY_COLOR,
                  style: Theme.of(context).textTheme.bodyMedium,
                  value: _currentState,
                  items: OrderStatusValues.values.map(
                    (e) {
                      var val = OrderStatus(e).toString();
                      return DropdownMenuItem(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(() {
                      _currentState = val!;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Flexible(
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Close'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                        child:
                            ElevatedButton(onPressed: () {}, child: Text('Save'))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
