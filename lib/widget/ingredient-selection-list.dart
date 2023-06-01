import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/model/product.dart';

import '../provider/customize-provider.dart';
import '../util/constant.dart';

class IngredientSelectionList extends ConsumerStatefulWidget {
  const IngredientSelectionList({
    Key? key,
    required this.ingredientType,
    required this.ingredients,
  }) : super(key: key);

  final IngredientType ingredientType;
  final List<Ingredient> ingredients;

  @override
  ConsumerState<IngredientSelectionList> createState() =>
      _IngredientSelectionListState();
}

class _IngredientSelectionListState
    extends ConsumerState<IngredientSelectionList> {
  var _currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose your ${Ingredient.toLowerString(widget.ingredientType)} ingredient',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: size.height / 5,
          child: ListView.builder(
            itemCount: widget.ingredients.length,
            itemExtent: size.width / 2.5,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  ref
                      .read(customizeProvider.notifier)
                      .changeNote(widget.ingredients[index]);
                  setState(() {
                    _currentSelected = index;
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: index == _currentSelected
                            ? PRIMARY_COLOR
                            : Colors.black,
                        width: 1.5),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.ingredients[index].ingreImgUrl,
                        fit: BoxFit.fitWidth,
                        height: double.infinity,
                        width: double.infinity,
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
                          widget.ingredients[index].toString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
