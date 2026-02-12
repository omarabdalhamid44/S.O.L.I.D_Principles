import '../models/order_model.dart';

class ValidationFormat {
  bool isValidEmail(Order order) {
    if (!order.customerEmail.contains('@')) {
      print('Error: Invalid email format');
      return false;
    }
    return true;
  }
}
