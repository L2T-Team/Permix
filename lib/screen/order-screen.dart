import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/provider/auth-provider.dart';
import 'package:permix/provider/order-provider.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/widget/common/custom-snack-bar.dart';
import 'package:permix/widget/item/order-item.dart';

import '../model/order.dart';
import '../widget/common/app-bar.dart';
import '../widget/item/cart-item.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  var _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isLoading = true;
    });
    ref
        .read(orderProvider.notifier)
        .getAllOrderByUserId(ref.read(authProvider)!.user.id)
        .then(
      (value) {
        setState(() {
          _isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<Order> orders = ref.watch(orderProvider);

    return Scaffold(
      appBar: getAppBar(context),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        width: size.width,
        padding: const EdgeInsets.symmetric(
            vertical: 20, horizontal: DEFAULT_HORIZONTAL_PADDING),
        child: Column(
          children: [
            Text(
              'MY ORDERS',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${ref.watch(orderProvider.notifier).getLength()} Orders',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                height: 6,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: orders.length,
                      itemBuilder: (_, index) {
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              showFeatureSoonSnackBar(context);
                            },
                            child: OrderItem(orders[index]),
                          ),
                        );
                      },
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Back'))
          ],
        ),
      ),
    );
  }
}
