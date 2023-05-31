import 'package:flutter/material.dart';

import '../../util/constant.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.leading,
    required this.trailing,
    required this.title,
    required this.subTitle,
    required this.height,
  }) : super(key: key);

  final Widget leading;
  final Widget trailing;
  final String title;
  final String subTitle;
  final double height;
  // final VoidCallback onTapHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              leading,
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(subTitle)
                    ],
                  ),
                ),
              ),
              trailing
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Divider(
              thickness: 1,
              height: 6,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
