import 'package:intl/intl.dart';
import 'dart:math';

String getThousandSeparatedString(double num) {
  var formatter = NumberFormat('#,##,000');
  return '${formatter.format(num.toInt()).replaceAll(',', '.')}.000đ';
}

List<String> parseListString(String idsString) {
  String trimmedInput = idsString.replaceAll('[', '').replaceAll(']', '');

  List<String> result =
      trimmedInput.split(',').map((value) => value.trim()).toList();

  return result;
}

String generateRandomPerfumeName() {
  List<String> adjectives = [
    'Mystic',
    'Enchanting',
    'Radiant',
    'Whispering',
    'Velvet',
    'Silken',
    'Ethereal'
  ];
  List<String> nouns = [
    'Breeze',
    'Aura',
    'Elixir',
    'Essence',
    'Mist',
    'Serenade',
    'Harmony'
  ];
  List<String> descriptors = [
    'Sensual',
    'Exquisite',
    'Captivating',
    'Harmonious',
    'Celestial'
  ];

  Random random = Random();
  String adjective = adjectives[random.nextInt(adjectives.length)];
  String noun = nouns[random.nextInt(nouns.length)];
  String descriptor = descriptors[random.nextInt(descriptors.length)];
  String name = '$descriptor $adjective $noun';

  return name;
}

String getFormatterDateTime(DateTime dateTime) {
  final formatter = DateFormat('HH:mm dd-MM-yyyy');
  return formatter.format(dateTime);
}
