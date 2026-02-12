import 'models/order_model.dart';
import 'models/paypal_model.dart';
import 'services/database_service_order.dart';
import 'services/notifaction_service.dart';
import 'services/order_service.dart';
import 'services/payment_service.dart';
import 'validation/valdiation_format.dart';
import 'validation/validation_order.dart';

void main() {
  Order order = Order(
      customerName: "customerName", customerEmail: "omar@", items: [
    {"id": 1, "ProductName": "test","quantity":4,"stock":10,"price":25}], totalAmount: 100);

  OrderService orderService = OrderService(order: order,
      validationOrder: ValidationOrder(),
      validationFormat: ValidationFormat(),
      databaseService: DatabaseServiceOrders(),
      paymentService: PaypalPayment(PaypalModel("omar@",100)),
      notificationService: EmailNotification());
  orderService.createOrder();
}