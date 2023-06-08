import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/screen/order-detail-screen.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/util/custom-page-route-builder.dart';
import 'package:permix/widget/common/my-back-button.dart';
import 'package:permix/widget/item/admin-item.dart';

import '../model/order.dart';
import '../provider/order-provider.dart';
import '../widget/admin-order-dialog.dart';
import '../widget/common/app-bar.dart';

class AdminScreen extends ConsumerStatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends ConsumerState<AdminScreen> {
  var _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isLoading = true;
    });
    try {
      ref.read(orderProvider.notifier).getAllOrders().then(
        (value) {
          setState(() {
            _isLoading = false;
          });
        },
      );
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Order> orders = ref.watch(orderProvider);

    return Scaffold(
      appBar: getAppBar(context, isAdmin: true),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: DEFAULT_HORIZONTAL_PADDING,
        ),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'ALL ORDERS',
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
                              Navigator.of(context).push(
                                CustomPageRouteBuilder.getPageRouteBuilder(
                                  OrderDetailScreen(orders[index]),
                                ),
                              );
                            },
                            child: AdminItem(orders[index]),
                          ),
                        );
                      },
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            const MyBackButton(),
          ],
        ),
      ),
    );
  }
}
