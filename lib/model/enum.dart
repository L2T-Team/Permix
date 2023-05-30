enum Concentration { EDC, EDT, EDP }

enum CapacityValues { five, ten, twenty }

class Capacity {
  final CapacityValues capacityVal;

  Capacity(this.capacityVal);

  @override
  String toString() {
    switch (capacityVal) {
      case CapacityValues.five:
        return '5ml';
      case CapacityValues.ten:
        return '10ml';
      case CapacityValues.twenty:
        return '20ml';
    }
  }
}