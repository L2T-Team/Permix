class CartProduct {
  final String productId;
  final String name;
  final double indiePrice;
  final String imgUrl;

  bool isSelected;
  int amount;

  CartProduct({
    required this.productId,
    required this.name,
    required this.indiePrice,
    required this.imgUrl,
    this.isSelected = false,
    this.amount = 1,
  });
}
