import 'package:permix/model/product.dart';

final ingredientTopList = TopIngredientType.values
    .map(
      (e) => IngredientTop(
        topIngredientType: e,
        ingreImgUrl: IngredientTop.getIngreImgUrl(e),
      ),
    )
    .toList();

final ingredientMiddleList = MiddleIngredientType.values
    .map(
      (e) => IngredientMiddle(
        middleIngredientType: e,
        ingreImgUrl: IngredientMiddle.getIngreImgUrl(e),
      ),
    )
    .toList();

final ingredientBaseList = BaseIngredientType.values
    .map(
      (e) => IngredientBase(
        baseIngredientType: e,
        ingreImgUrl: IngredientBase.getIngreImgUrl(e),
      ),
    )
    .toList();
