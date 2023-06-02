enum Concentration { EDC, EDT, EDP }

enum CapacityValues { five, ten, twenty }

class Capacity {
  final CapacityValues capacityVal;

  const Capacity(this.capacityVal);

  static CapacityValues? toCapacityValue(String str) {
    switch (str) {
      case '5ml':
        return CapacityValues.five;
      case '10ml':
        return CapacityValues.ten;
      case '20ml':
        return CapacityValues.twenty;
      default:
        return null;
    }
  }

  @override
  String toString() {
    switch (capacityVal) {
      case CapacityValues.five:
        return '5ml';
      case CapacityValues.twenty:
        return '20ml';
      case CapacityValues.ten:
        return '10ml';
    }
  }
}

class OrderStatus {
  final OrderStatusValues statusVal;

  OrderStatus(this.statusVal);

  static OrderStatus toOrderStatus(String str) {
    switch (str) {
      case 'Paid':
        return OrderStatus(OrderStatusValues.paid);
      case 'Verifying':
        return OrderStatus(OrderStatusValues.verifying);
      case 'Failed':
        return OrderStatus(OrderStatusValues.failed);
      case 'Processing':
        return OrderStatus(OrderStatusValues.processing);
      case 'Delivering':
        return OrderStatus(OrderStatusValues.delivering);
      case 'Delivered':
        return OrderStatus(OrderStatusValues.delivered);
      default:
        return OrderStatus(OrderStatusValues.paid);
    }
  }

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
