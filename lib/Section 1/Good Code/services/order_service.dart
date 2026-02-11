import '../models/order_model.dart';
import '../validation/valdiation_format.dart';
import '../validation/validation_order.dart';
import 'database_service_order.dart';

class OrderService {
  final Order order;
  final ValidationOrder validationOrder;
  final ValidationFormat validationFormat;
  final DatabaseServiceOrders databaseService;

  OrderService({
    required this.order,
    required this.validationOrder,
    required this.validationFormat,
    required this.databaseService
  });

  bool createOrder() {
    bool isValid =
        validationOrder.validCustomerData(order) &&
        validationFormat.isValidEmail(order);
    calculateTotal();
    return isValid;
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in order.items) {
      if (isProductInStock(item)) {
        total += item['price'] * item['quantity'];
        databaseService.updateInventoryInDatabase(item['id'],item['stock'] - item['quantity']);
      }
    }
    return total;
  }

  bool isProductInStock(Map<String, dynamic> item) {
    if (item['stock'] < item['quantity']) {
      print('Error: Insufficient stock for ${item['name']}');
      return false;
    }
    return true;
  }


}
