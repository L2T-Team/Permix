import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/provider/cart-provider.dart';
import 'package:permix/screen/payment-screen.dart';
import 'package:permix/screen/shipping-screen.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/util/helper.dart';
import 'package:permix/widget/common/app-bar.dart';
import 'package:permix/widget/common/my-back-button.dart';
import 'package:permix/widget/item/cart-item.dart';

import '../model/cart-product.dart';
import '../util/custom-page-route-builder.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  double _calcTotalPrice(List<CartProduct> cartProducts) {
    return cartProducts.fold(
      0.0,
      (previousValue, element) =>
          previousValue + element.amount * element.indiePrice,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;
    var cart = ref.watch(cartProvider);
    var cartProducts = cart.entries.map((e) => e.value).toList();
    return Scaffold(
      appBar: getAppBar(context, isCartActive: false),
      body: Container(
        width: size.width,
        height: size.height - kToolbarHeight - padding.top,
        color: Theme.of(context).colorScheme.background,
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: DEFAULT_HORIZONTAL_PADDING),
        child: Column(
          children: [
            Text(
              'MY CART',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 15,
            ),
            if (cartProducts.isEmpty)
              const Expanded(
                child: Center(
                  child: Text('Your Cart is empty, buy more then!'),
                ),
              )
            else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${cart.values.length} Items',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ref.read(cartProvider.notifier).selectAll();
                        });
                      },
                      child: Text('Select All'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Divider(
                  thickness: 1,
                  height: 6,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cart.values.length,
                    itemBuilder: (_, index) {
                      return CartItem(
                        cartProduct: cartProducts[index],
                      );
                    }),
              ),
            ],
            SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage('$IMAGE_PATH/truck-icon.png'),
                  color: PRIMARY_COLOR,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Free Shipping applied over 4.000k!',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Amount'),
                    Text(
                      '${getThousandSeparatedString(_calcTotalPrice(cartProducts))}k',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  height: 6,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: MyBackButton(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    cartProducts.isEmpty
                        ? const SizedBox.shrink()
                        : Flexible(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    CustomPageRouteBuilder.getPageRouteBuilder(
                                        PaymentScreen()));
                              },
                              child: Text('Purchase'),
                            ),
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              CustomPageRouteBuilder.getPageRouteBuilder(
                                  ShippingScreen()));
                        },
                        child: Text('Shipping Info'),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
