import 'package:flutter/material.dart';

import '../util/constant.dart';

class IngredientSelectionList extends StatefulWidget {
  const IngredientSelectionList({Key? key}) : super(key: key);

  @override
  State<IngredientSelectionList> createState() =>
      _IngredientSelectionListState();
}

class _IngredientSelectionListState extends State<IngredientSelectionList> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose your top notes ingredients',
          style: Theme
              .of(context)
              .textTheme
              .bodySmall,
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: size.height / 5,
          child: ListView.builder(
            itemCount: 5,
            itemExtent: size.width / 2.5,
            itemBuilder: (_, index) {
              return new Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1.5),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      '$IMAGE_PATH/sample-ingredient.jpg',
                      fit: BoxFit.fill,
                      height: double.infinity,
                    ),
                    Container(
                      height: double.infinity,
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.black12,
                            Colors.black,
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                      child: Text(
                        'Grapefruit/Bergamot/Anise',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall,
                      ),
                    )
                  ],
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(height: 15,)
      ],
    );
  }
}
