import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/model/product.dart';
import 'package:permix/provider/cart-provider.dart';
import 'package:permix/widget/common/app-bar.dart';
import 'package:permix/widget/common/labeled-slider.dart';

import '../util/constant.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  List<TextSpan> _buildNoteTextSpan(
      BuildContext context, String note, String description) {
    return [
      TextSpan(
        text: '$note: ',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      TextSpan(text: '$description'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: getAppBar(context),
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        // height: desiredHeight,
        color: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.only(
            top: 20,
            left: DEFAULT_HORIZONTAL_PADDING,
            right: DEFAULT_HORIZONTAL_PADDING),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              product is CustomizeProduct
                  ? 'Customized Perfume'
                  : 'Permix\'s Collection',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Image.asset(
                product.imgUrl,
                fit: BoxFit.contain,
                width: size.width / 3,
                height: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                '${product.price.toStringAsFixed(0)}k',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(height: 10),
            Text(product.name),
            SizedBox(height: 15),
            Divider(
              thickness: 1,
              height: 6,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 15),
            Text.rich(
              style: Theme.of(context).textTheme.bodySmall,
              TextSpan(text: '${product.description}\n', children: [
                ..._buildNoteTextSpan(context, 'Top notes',
                    '${product.ingredientTop.toString()}\n'),
                ..._buildNoteTextSpan(context, 'Middle notes',
                    '${product.ingredientMiddle.toString()}\n'),
                ..._buildNoteTextSpan(
                    context, 'Base notes', product.ingredientBase.toString()),
              ]),
            ),
            SizedBox(height: 20),
            LabeledSlider(
                label: 'Longevity', currentValue: product.longevityRatio),
            LabeledSlider(label: 'Price', currentValue: product.priceRatio),
            LabeledSlider(label: 'Sillage', currentValue: product.sillageRatio),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
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
                  Consumer(
                    builder: (context, ref, _) {
                      return ElevatedButton(
                        onPressed: () {
                          var isAdded = ref
                              .read(cartProvider.notifier)
                              .addToCart(product);
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(isAdded
                                  ? 'Added ${product.name} to Cart!'
                                  : '${product.name} is in Cart already!'),
                            ),
                          );
                        },
                        child: Text('Add to Cart'),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
