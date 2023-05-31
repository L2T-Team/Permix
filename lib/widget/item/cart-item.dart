import 'package:flutter/material.dart';
import 'package:permix/widget/item/list-item.dart';

import '../../util/constant.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return ListItem(
      height: 110,
      leading: Row(
        children: [
          Checkbox(value: true, onChanged: (val) {}),
          Image.asset(
            '$IMAGE_PATH/products/1.png',
            height: 70,
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
                '99',
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
      title: 'Secret Whiadfasdfadadsfaasdasdadasddassdfs sdfssper',
      subTitle: '2.999k',
    );
  }
}
