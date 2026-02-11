import '../models/credit_card_model.dart';
import '../models/order_model.dart';
import '../validation/valdiation_format.dart';
import '../validation/validation_order.dart';
import 'database_service_order.dart';
import 'notifaction_service.dart';
import 'payment_service.dart';

class OrderService {
  final Order order;
  final ValidationOrder validationOrder;
  final ValidationFormat validationFormat;
  final DatabaseServiceOrders databaseService;
  final PaymentService paymentService;
  final NotificationService notificationService;

  OrderService({
    required this.order,
    required this.validationOrder,
    required this.validationFormat,
    required this.databaseService,
    required this.paymentService,
    required this.notificationService,
  });

  bool createOrder() {
    bool isValid =
        validationOrder.validCustomerData(order) &&
        validationFormat.isValidEmail(order);
    calculateTotal();

    if (paymentService.processPayment())
    databaseService.updateInventoryInDatabase(order);
      notificationService.send(
        order.customerEmail,
        'Order Confirmation',
        'Your order #${DateTime.now().millisecondsSinceEpoch} has been confirmed',
      );

    return isValid;
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in order.items) {
      if (isProductInStock(item)) total += item['price'] * item['quantity'];
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
