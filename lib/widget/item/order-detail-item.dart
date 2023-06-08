import 'package:flutter/material.dart';
import 'package:permix/util/helper.dart';

import '../../model/cart-product.dart';
import '../../util/constant.dart';
import 'list-item.dart';

class OrderDetailItem extends StatelessWidget {
  const OrderDetailItem(this.cartProduct, {Key? key}) : super(key: key);

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return ListItem(
      height: 110,
      leading: Row(
        children: [
          Image.asset(
            cartProduct.imgUrl,
            height: 70,
            width: 70,
          ),
        ],
      ),
      trailing: Align(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: PRIMARY_COLOR,
            ),
          ),
          height: 25,
          width: 30,
          alignment: Alignment.center,
          child: Text(
            cartProduct.amount.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(height: 1),
          ),
        ),
      ),
      title: cartProduct.name,
      subTitle: getThousandSeparatedString(cartProduct.indiePrice),
    );
    ;
  }
}
