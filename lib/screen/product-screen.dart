import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:permix/widget/product-item.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/widget/common/app-bar.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = '/products';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: getAppBar(context),
      body: Container(
        width: double.infinity,
        height: size.height - kToolbarHeight,
        padding: EdgeInsets.only(
            top: 20,
            left: DEFAULT_HORIZONTAL_PADDING,
            right: DEFAULT_HORIZONTAL_PADDING),
        color: Theme.of(context).colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "OURS PRODUCT",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text('Filter')),
                Row(
                  children: [
                    Text('Price: Low to High'),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/images/setting-icon.png'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    childAspectRatio: 1 / 1.3,
                    mainAxisSpacing: 0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductItem(
                      index: index,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
