import 'package:flutter/material.dart';
import 'package:permix/model/enum.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/widget/common/app-bar.dart';
import 'package:permix/widget/common/characteristic-selection-list.dart';
import 'package:permix/widget/common/ingredient-selection-list.dart';

class CustomizeScreen extends StatelessWidget {
  const CustomizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          color: Theme.of(context).colorScheme.background,
          padding: EdgeInsets.symmetric(
              vertical: 20, horizontal: DEFAULT_HORIZONTAL_PADDING),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'CUSTOMIZE',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              IngredientSelectionList(),
              IngredientSelectionList(),
              IngredientSelectionList(),
              CharacteristicSelectionList(
                label: 'Choose the concentration',
                values: Concentration.values.map((e) => e.name).toList(),
              ),
              CharacteristicSelectionList(
                label: 'Choose the capacity',
                values: CapacityValues.values
                    .map((e) => Capacity(e).toString())
                    .toList(),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Back'),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Confirm'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
