class Order{
      String customerName = '';
  String customerEmail = '';
  List<Map<String, dynamic>> items = [];
  double totalAmount = 0.0;

  Order({required this.customerName , required this.customerEmail , required this.items , required this.totalAmount});
}