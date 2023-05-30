import 'package:flutter/material.dart';
import 'package:permix/widget/common/app-bar.dart';
import 'package:permix/widget/common/labeled-slider.dart';

import '../util/constant.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  final _longevitySliderVal = 0.5;
  final _priceSliderVal = 0.4;
  final _sillageSliderVal = 0.3;

  List<TextSpan> _buildNoteTextSpan(
      BuildContext context, String note, String description) {
    return [
      TextSpan(
        text: '$note: ',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      TextSpan(text: '$description'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: getAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          color: Theme.of(context).colorScheme.background,
          padding: const EdgeInsets.only(
              top: 20,
              left: DEFAULT_HORIZONTAL_PADDING,
              right: DEFAULT_HORIZONTAL_PADDING),
          child: Column(
            children: [
              Text(
                'PERFUME',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Image.asset(
                    '$IMAGE_PATH/products/2.png',
                    fit: BoxFit.contain,
                    width: size.width / 3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  '2.999k',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              SizedBox(height: 10),
              Text('Forest Night'),
              SizedBox(height: 15),
              Divider(
                thickness: 1,
                height: 6,
                color: Theme.of(context).colorScheme.secondary,
              ),
              SizedBox(height: 15),
              Text.rich(
                style: Theme.of(context).textTheme.bodySmall,
                TextSpan(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                        ' Maecenas cursus tortor sit amet volutpat euismod.'
                        ' Phasellus molestie cursus finibus.'
                        ' Sed imperdiet porttitor lobortis.\n',
                    children: [
                      ..._buildNoteTextSpan(context, 'Top notes',
                          'Mint, Grapefruit, Bergamot, Anise\n'),
                      ..._buildNoteTextSpan(context, 'Middle notes',
                          'Mint, Green note, Cassis, Rose\n'),
                      ..._buildNoteTextSpan(
                          context, 'Base notes', 'White musk'),
                    ]),
              ),
              SizedBox(height: 20),
              LabeledSlider(
                  label: 'Longevity', currentValue: _longevitySliderVal),
              LabeledSlider(label: 'Price', currentValue: _priceSliderVal),
              LabeledSlider(label: 'Sillage', currentValue: _sillageSliderVal),
              Expanded(
                child: Align(
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Back')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
