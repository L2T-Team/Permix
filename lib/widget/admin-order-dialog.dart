import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/model/enum.dart';
import 'package:permix/provider/order-provider.dart';
import 'package:permix/util/helper.dart';
import 'package:permix/widget/common/info-row.dart';
import 'package:permix/widget/common/my-back-button.dart';

import '../model/order.dart';
import '../util/constant.dart';

class AdminOrderDialog extends ConsumerStatefulWidget {
  AdminOrderDialog(this.order, {Key? key}) : super(key: key);

  final Order order;
  late String _currentState;

  @override
  ConsumerState<AdminOrderDialog> createState() => _AdminOrderDialogState();
}

class _AdminOrderDialogState extends ConsumerState<AdminOrderDialog> {
  var _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._currentState = widget.order.orderStatus.toString();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      child: Container(
        width: size.width - 20,
        height: size.height / 1.5,
        color: Theme.of(context).colorScheme.background,
        padding: EdgeInsets.all(20),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Text(
                    'From',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.order.userEmail,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.order.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  InfoRow(Icons.calendar_month,
                      getFormatterDateTime(widget.order.dateTime)),
                  SizedBox(height: 10),
                  InfoRow(Icons.price_check,
                      '${getThousandSeparatedString(widget.order.totalPrice)}k'),
                  Row(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Icon(Icons.backup_table),
                      ),
                      DropdownButton(
                        dropdownColor: SECONDARY_COLOR,
                        style: Theme.of(context).textTheme.bodyMedium,
                        value: widget._currentState,
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
                            widget._currentState = val!;
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
                          const Flexible(
                            child: MyBackButton(
                              title: 'Close',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: ElevatedButton(
                              onPressed: () {
                                widget.order.orderStatus =
                                    OrderStatus.toOrderStatus(
                                        widget._currentState);
                                setState(() {
                                  _isLoading = true;
                                });
                                ref
                                    .watch(orderProvider.notifier)
                                    .updateOrderStatus(
                                        widget.order.id, widget.order)
                                    .then((value) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Navigator.of(context).pop();
                                });
                              },
                              child: const Text('Save'),
                            ),
                          ),
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
