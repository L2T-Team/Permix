import 'package:permix/model/enum.dart';
import 'package:permix/util/constant.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.ingredientBase,
    required this.ingredientMiddle,
    required this.ingredientTop,
    this.price = 0.0,
    this.description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Maecenas cursus tortor sit amet volutpat euismod. '
            'Phasellus molestie cursus finibus.'
            ' Sed imperdiet porttitor lobortis.',
    this.longevityRatio = 0.5,
    this.priceRatio = 0.5,
    this.sillageRatio = 0.5,
    this.productType = ProductTypeValue.unisex,
  });

  final String id;
  final String name;
  double price;
  String imgUrl;
  String description;
  double longevityRatio;
  double priceRatio;
  double sillageRatio;
  ProductTypeValue productType;
  final IngredientTop ingredientTop;
  final IngredientMiddle ingredientMiddle;
  final IngredientBase ingredientBase;
}

class CustomizeProduct extends Product {
  CustomizeProduct({
    super.description =
        'The composition of this perfume is carefully crafted to create '
            'a harmonious balance of top, middle, and base notes that'
            ' work together to create a unique and memorable scent.'
            ' The bright and zesty grapefruit top note provides'
            ' a burst of energy, followed by the fresh '
            'and verdant green notes that give the perfume '
            'its natural and earthy character.',
    required this.capacity,
    required this.concentration,
    required super.id,
    required super.name,
    required super.imgUrl,
    required super.ingredientBase,
    required super.ingredientMiddle,
    required super.ingredientTop,
  }) {
    price = getPrice();
  }

  double getPrice() {
    switch (capacity.capacityVal) {
      case CapacityValues.five:
        return 100;
      case CapacityValues.ten:
        return 200;
      case CapacityValues.twenty:
        return 300;
    }
  }

  final Capacity capacity;
  final Concentration concentration;
}

abstract class Ingredient {
  Ingredient({
    required this.ingredientType,
    this.ingreImgUrl = '',
  });

  late String ingreImgUrl;
  final IngredientType ingredientType;
}

class IngredientBase extends Ingredient {
  IngredientBase({required this.baseIngredientType})
      : super(ingredientType: IngredientType.base) {
    ingreImgUrl = _getIngreImgUrl();
  }

  final BaseIngredientType baseIngredientType;

  String _getIngreImgUrl() {
    switch (baseIngredientType) {
      case BaseIngredientType.musk:
        return '$INGRE_PATH/Musk.jpg';
      case BaseIngredientType.wood:
        return '$INGRE_PATH/Wood.jpg';
      case BaseIngredientType.vanilla:
        return '$INGRE_PATH/Vanilla.jpg';
      case BaseIngredientType.cashmeran:
        return '$INGRE_PATH/Cashmeran.jpg';
    }
  }

  @override
  String toString() {
    switch (baseIngredientType) {
      case BaseIngredientType.musk:
        return 'Musk';
      case BaseIngredientType.wood:
        return 'Wood';
      case BaseIngredientType.vanilla:
        return 'Vanilla';
      case BaseIngredientType.cashmeran:
        return 'Cashmeran';
    }
  }
}

class IngredientMiddle extends Ingredient {
  IngredientMiddle({required this.middleIngredientType})
      : super(ingredientType: IngredientType.middle) {
    ingreImgUrl = _getIngreImgUrl();
  }

  final MiddleIngredientType middleIngredientType;

  String _getIngreImgUrl() {
    var fileNameWithoutExt = '';
    switch (middleIngredientType) {
      case MiddleIngredientType.cedar:
        fileNameWithoutExt = 'Cedar';
        break;
      case MiddleIngredientType.green:
        fileNameWithoutExt = 'Green Note';
        break;
      case MiddleIngredientType.wood:
        fileNameWithoutExt = 'Wood';
        break;
      case MiddleIngredientType.maple:
        fileNameWithoutExt = 'Maple Sap';
        break;
    }

    return '$INGRE_PATH/$fileNameWithoutExt.jpg';
  }

  @override
  String toString() {
    switch (middleIngredientType) {
      case MiddleIngredientType.cedar:
        return 'Cedar';
      case MiddleIngredientType.green:
        return 'Green Note';
      case MiddleIngredientType.wood:
        return 'Wood';
      case MiddleIngredientType.maple:
        return 'Maple Sap';
    }
  }
}

class IngredientTop extends Ingredient {
  IngredientTop({required this.topIngredientType})
      : super(ingredientType: IngredientType.top) {
    ingreImgUrl = _getIngreImgUrl();
  }

  final TopIngredientType topIngredientType;

  String _getIngreImgUrl() {
    var fileName = '';
    switch (topIngredientType) {
      case TopIngredientType.bergamot:
        fileName = 'Bergamot-Lime-Orange';
        break;
      case TopIngredientType.rum:
        fileName = 'Rum-Saffron';
        break;
      case TopIngredientType.jasmine:
        fileName = 'Jasmine-Rose';
        break;
      case TopIngredientType.rosewood:
        fileName = 'Rosewood-Vanilla';
        break;
      case TopIngredientType.mint:
        fileName = 'Mint';
        break;
    }

    return '$INGRE_PATH/$fileName.jpg';
  }

  @override
  String toString() {
    switch (topIngredientType) {
      case TopIngredientType.bergamot:
        return 'Bergamot/Lime/Orange';
      case TopIngredientType.rum:
        return 'Rum/Saffron';
      case TopIngredientType.jasmine:
        return 'Jasmine/Rose';
      case TopIngredientType.rosewood:
        return 'Rosewood/Vanilla';
      case TopIngredientType.mint:
        return 'Mint';
    }
  }
}

enum BaseIngredientType { musk, wood, vanilla, cashmeran }

enum MiddleIngredientType { cedar, green, wood, maple }

enum TopIngredientType { bergamot, rum, jasmine, rosewood, mint }

enum IngredientType { top, middle, base }

class ProductType {
  ProductTypeValue typeValue;

  ProductType(this.typeValue);

  @override
  String toString() {
    switch (typeValue) {
      case ProductTypeValue.male:
        return 'Male';
      case ProductTypeValue.female:
        return 'Female';
      case ProductTypeValue.unisex:
        return 'Unisex';
    }
  }
}

enum ProductTypeValue { male, female, unisex }
