import 'package:flutter/material.dart';
import 'package:permix/model/product.dart';
import 'package:permix/screen/product-detail-screen.dart';
import 'package:permix/util/constant.dart';

import '../util/custom-page-route-builder.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.index,
    required this.product,
  }) : super(key: key);
  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          CustomPageRouteBuilder.getPageRouteBuilder(
            ProductDetailScreen(
              product: product,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: SECONDARY_COLOR),
              right: index % 2 == 0
                  ? BorderSide(color: SECONDARY_COLOR)
                  : BorderSide.none,
            ),
            color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(ProductType(product.productType).toString()),
            Flexible(flex: 2, child: Image.asset(product.imgUrl)),
            Text(product.name),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  '${product.price.toStringAsFixed(0)}k',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
