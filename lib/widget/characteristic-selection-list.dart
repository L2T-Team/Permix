import 'package:flutter/material.dart';
import 'package:permix/util/constant.dart';

import '../model/enum.dart';

class CharacteristicSelectionList extends StatefulWidget {
  const CharacteristicSelectionList({
    Key? key,
    required this.label,
    required this.values,
  }) : super(key: key);
  final String label;
  final List<String> values;

  @override
  State<CharacteristicSelectionList> createState() =>
      _CharacteristicSelectionListState();
}

class _CharacteristicSelectionListState
    extends State<CharacteristicSelectionList> {
  late String _currentValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentValue = widget.values[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: widget.values
              .map(
                (val) => Expanded(
                  child: LabeledRadio(
                    label: val,
                    groupValue: _currentValue,
                    value: val,
                    onChanged: (value) {
                      setState(() {
                        _currentValue = value;
                      });
                    },
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    super.key,
    required this.label,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final String groupValue;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Radio<String>(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
            ),
            groupValue: groupValue,
            value: value,
            fillColor:
                MaterialStateColor.resolveWith((states) => SECONDARY_COLOR),
            onChanged: (newValue) {
              onChanged(newValue!);
            },
          ),
          const SizedBox(
            width: 5,
          ),
          Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(height: 1),
            ),
          ),
        ],
      ),
    );
  }
}
