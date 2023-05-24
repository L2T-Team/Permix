import 'package:flutter/material.dart';
import 'package:permix/util/constant.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, this.index}) : super(key: key);
  final index;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text('Male'),
          Image.asset('assets/images/products/1.png'),
          Text('Forest Night'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              '2.999k',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ],
      ),
    );
  }
}
