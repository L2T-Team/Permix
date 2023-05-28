import 'package:flutter/material.dart';

class LabeledSlider extends StatelessWidget {
  const LabeledSlider({
    Key? key,
    required this.label,
    required this.currentValue,
  }) : super(key: key);
  final String label;
  final double currentValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width: 90, child: Text(label, style: Theme.of(context).textTheme.bodyMedium,)),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 1,
                activeTrackColor: Theme.of(context).colorScheme.secondary,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 1.0),
              ),
              child: Slider(
                value: currentValue,
                onChanged: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
