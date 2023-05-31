import 'package:flutter/material.dart';

import '../../util/constant.dart';
import 'list-item.dart';

class OrderDetailItem extends StatelessWidget {
  const OrderDetailItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListItem(
      height: 110,
      leading: Row(
        children: [
          Image.asset(
            '$IMAGE_PATH/products/1.png',
            height: 70,
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
            '99',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(height: 1),
          ),
        ),
      ),
      title: 'Secret Whiadfasdfadadsfaasdasdadasd'
          'dassdfs sdfssper',
      subTitle: '2.999k',
    );
    ;
  }
}
