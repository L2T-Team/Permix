import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/model/cart-product.dart';
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

  Future<String> addToFirestore() async {
    late CustomizeProduct newProd;
    var id = DateTime.now().toString();

    await FirebaseFirestore.instance.collection('customize_products').add(
      <String, dynamic>{
        'id': id,
        'name': state.name,
        'imgUrl': state.imgUrl,
        'price': state.price,
        'description': state.description,
        'longevityRatio': state.longevityRatio,
        'priceRatio': state.priceRatio,
        'sillageRatio': state.sillageRatio,
        'ingredientTop': state.ingredientTop.toString(),
        'ingredientMiddle': state.ingredientMiddle.toString(),
        'ingredientBase': state.ingredientBase.toString(),
        'capacity': state.capacity.toString(),
        'concentration': state.concentration.name,
      },
    ).then((docRef) {
      newProd = CustomizeProduct.cloneAssignId(state, id);
    }).catchError((error) {
      print('error');
    });

    state = newProd;

    return 'newProd.id';
  }

  void resetIfCreated() {
    if (state.id != '') {
      state = CustomizeProduct.empty();
    }
  }
}

final customizeProvider =
    StateNotifierProvider<CustomizeNotifier, CustomizeProduct>(
  (ref) => CustomizeNotifier(
    CustomizeProduct.empty(),
  ),
);
