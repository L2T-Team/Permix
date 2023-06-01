import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/model/enum.dart';
import 'package:permix/model/product.dart';

class CustomizeNotifier extends StateNotifier<CustomizeProduct> {
  CustomizeNotifier(CustomizeProduct initialCustomProd)
      : super(initialCustomProd);

  void changeNote(Ingredient actualIngredient) {
    var newProd = CustomizeProduct.clone(state);

    switch (actualIngredient.ingredientType) {
      case IngredientType.top:
        newProd.ingredientTop = (actualIngredient as IngredientTop);
        break;
      case IngredientType.middle:
        newProd.ingredientMiddle = (actualIngredient as IngredientMiddle);
        break;
      case IngredientType.base:
        newProd.ingredientBase = (actualIngredient as IngredientBase);
        break;
    }

    state = newProd;
  }

 /* void changeConcentration(Concentration concentration) {
    if (state.concentration != concentration) {
      var newProd = CustomizeProduct.clone(state);
      newProd.concentration = concentration;

      state = newProd;
    }
  }*/

  void changeCapacity(String capacityString) {
    var capacityValue = Capacity.toCapacityValue(capacityString);

    if (capacityValue != null && state.capacity.capacityVal != capacityValue) {
      var newProd = CustomizeProduct.clone(state);
      newProd.capacity = Capacity(capacityValue);
      newProd.price = newProd.getPrice();
      state = newProd;
    }
  }
}

final customizeProvider =
    StateNotifierProvider<CustomizeNotifier, CustomizeProduct>(
  (ref) => CustomizeNotifier(
    CustomizeProduct.empty(),
  ),
);
