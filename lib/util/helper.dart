import 'package:intl/intl.dart';
import 'dart:math';

String getThousandSeparatedString(double num) {
  var formatter = NumberFormat('#,##,000');
  return formatter.format(num.toInt()).replaceAll(',', '.');
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
