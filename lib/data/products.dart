import 'package:permix/model/product.dart';
import 'package:permix/util/constant.dart';

var initialProducts = [
  Product(
    id: 'init_1',
    name: 'Forest Night',
    imgUrl: '$IMAGE_PATH/products/1.png',
    price: 500,
    ingredientBase: IngredientBase(baseIngredientType: BaseIngredientType.musk),
    ingredientMiddle:
        IngredientMiddle(middleIngredientType: MiddleIngredientType.green),
    ingredientTop: IngredientTop(topIngredientType: TopIngredientType.bergamot),
    productType: ProductTypeValue.male,
  ),
  Product(
    id: 'init_2',
    name: 'Whisper in the Rain',
    imgUrl: '$IMAGE_PATH/products/2.png',
    price: 200,
    ingredientBase: IngredientBase(baseIngredientType: BaseIngredientType.musk),
    ingredientMiddle:
        IngredientMiddle(middleIngredientType: MiddleIngredientType.green),
    ingredientTop: IngredientTop(topIngredientType: TopIngredientType.bergamot),
    productType: ProductTypeValue.unisex,
  ),
  Product(
    id: 'init_3',
    name: 'Secret Whisper',
    imgUrl: '$IMAGE_PATH/products/3.png',
    price: 900,
    ingredientBase: IngredientBase(baseIngredientType: BaseIngredientType.musk),
    ingredientMiddle:
        IngredientMiddle(middleIngredientType: MiddleIngredientType.green),
    ingredientTop: IngredientTop(topIngredientType: TopIngredientType.bergamot),
    productType: ProductTypeValue.female,
  ),
  Product(
    id: 'init_4',
    name: 'Firecamp memories',
    imgUrl: '$IMAGE_PATH/products/4.png',
    price: 700,
    ingredientBase: IngredientBase(baseIngredientType: BaseIngredientType.musk),
    ingredientMiddle:
        IngredientMiddle(middleIngredientType: MiddleIngredientType.green),
    ingredientTop: IngredientTop(topIngredientType: TopIngredientType.bergamot),
    productType: ProductTypeValue.unisex,
  ),
];
