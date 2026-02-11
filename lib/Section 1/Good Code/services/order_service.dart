import '../models/credit_card_model.dart';
import '../models/order_model.dart';
import '../validation/valdiation_format.dart';
import '../validation/validation_order.dart';
import 'database_service_order.dart';
import 'payment_service.dart';

class OrderService {
  final Order order;
  final ValidationOrder validationOrder;
  final ValidationFormat validationFormat;
  final DatabaseServiceOrders databaseService;
  final PaymentService paymentService;

  OrderService({
    required this.order,
    required this.validationOrder,
    required this.validationFormat,
    required this.databaseService,
    required this.paymentService
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
      paymentService.processPayment();

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
