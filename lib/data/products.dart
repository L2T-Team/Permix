import 'package:permix/model/product.dart';
import 'package:permix/util/constant.dart';

var initialProducts = [
  Product(
    id: '1wjOfh1wcZYjhsSqBCvh',
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
    id: '7TaWkuXOCs5oPX8sYwsi',
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
    id: 'GNNa0FaLzGQDCCAUW9Zu',
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
    id: 'HPToLWePMio0huUOiIDv',
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
