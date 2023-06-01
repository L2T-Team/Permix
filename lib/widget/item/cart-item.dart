import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/model/cart-product.dart';
import 'package:permix/widget/item/list-item.dart';

import '../../provider/cart-provider.dart';
import '../../util/constant.dart';

class CartItem extends ConsumerStatefulWidget {
  const CartItem({
    Key? key,
    required this.cartProduct,
  }) : super(key: key);

  final CartProduct cartProduct;

  @override
  ConsumerState<CartItem> createState() => _CartItemState();
}

class _CartItemState extends ConsumerState<CartItem> {
  @override
  Widget build(BuildContext context) {
    return ListItem(
      height: 110,
      leading: Row(
        children: [
          Checkbox(
            value: widget.cartProduct.isSelected,
            onChanged: (val) {
              setState(() {
                ref
                    .read(cartProvider.notifier)
                    .toggleSelect(widget.cartProduct.productId, val!);
              });
            },
          ),
          Image.asset(
            widget.cartProduct.imgUrl,
            height: 70,
            width: 50,
          ),
        ],
      ),
      trailing: Container(
        // width: double.infinity,
        width: 100,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              // alignment: Alignment.topCenter,
              icon: Icon(Icons.remove),
              color: PRIMARY_COLOR,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: PRIMARY_COLOR,
                ),
              ),
              height: 25,
              width: 30,
              alignment: Alignment.center,
              child: Text(
                widget.cartProduct.amount.toString(),
                textAlign: TextAlign.center,
                style:
                    Theme.of(context).textTheme.bodySmall!.copyWith(height: 1),
              ),
            ),
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              icon: Icon(Icons.add),
              color: PRIMARY_COLOR,
            )
          ],
        ),
      ),
      title: widget.cartProduct.name,
      subTitle:
          '${(widget.cartProduct.indiePrice * widget.cartProduct.amount).toStringAsFixed(0)}k',
    );
  }
}
