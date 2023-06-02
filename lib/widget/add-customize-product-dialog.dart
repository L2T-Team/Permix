import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/model/product.dart';
import 'package:permix/provider/customize-provider.dart';
import 'package:permix/screen/product-screen.dart';
import 'package:permix/util/routes.dart';

import '../provider/cart-provider.dart';
import '../util/custom-page-route-builder.dart';

class AddCustomizeProductDialog extends ConsumerStatefulWidget {
  AddCustomizeProductDialog({
    Key? key,
  }) : super(key: key);

  late CustomizeProduct cusProduct;

  @override
  ConsumerState<AddCustomizeProductDialog> createState() =>
      _AddCustomizeProductDialogState();
}

class _AddCustomizeProductDialogState
    extends ConsumerState<AddCustomizeProductDialog> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    widget.cusProduct = ref.watch(customizeProvider);

    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : AlertDialog(
            title: Text(
              'Add your customized ${widget.cusProduct.name}?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            content: Text(
              'Top note: ${widget.cusProduct.ingredientTop.toString()}\n'
              'Middle note: ${widget.cusProduct.ingredientMiddle.toString()}\n'
              'Base note: ${widget.cusProduct.ingredientBase.toString()}\n'
              'with ${widget.cusProduct.concentration.name} Concentration and '
              '${widget.cusProduct.capacity.toString()}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            actions: [
              // The "Yes" button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Flexible(
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              _isLoading = true;
                            });
                            ref
                                .watch(customizeProvider.notifier)
                                .addToFirestore()
                                .then((value) {
                              var isAdded = ref
                                  .read(cartProvider.notifier)
                                  .addToCart(ref.watch(customizeProvider));

                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(isAdded
                                      ? 'Added ${widget.cusProduct.name} to Cart!'
                                      : '${widget.cusProduct.name} is in Cart already!'),
                                ),
                              );

                              setState(() {
                                _isLoading = false;
                              });
                            });

                            // Close the dialog
                            Navigator.of(context).pushAndRemoveUntil(
                                CustomPageRouteBuilder.getPageRouteBuilder(
                                  ProductScreen(),
                                ),
                                (route) => false);
                          },
                          child: const Text('Yes')),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('No')),
                    )
                  ],
                ),
              ),
            ],
          );
  }
}
