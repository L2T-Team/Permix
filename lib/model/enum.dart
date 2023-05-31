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

class OrderStatus {
  final OrderStatusValues statusVal;

  OrderStatus(this.statusVal);

  @override
  String toString() {
    switch (statusVal) {
      case OrderStatusValues.paid:
        return "Paid";
      case OrderStatusValues.verifying:
        return "Verifying";
      case OrderStatusValues.failed:
        return "Failed";
      case OrderStatusValues.processing:
        return "Processing";
      case OrderStatusValues.delivering:
        return 'Delivering';
      case OrderStatusValues.delivered:
        return "Delivered";
    }
  }
}

enum OrderStatusValues {
  paid,
  verifying,
  failed,
  processing,
  delivering,
  delivered,
}
