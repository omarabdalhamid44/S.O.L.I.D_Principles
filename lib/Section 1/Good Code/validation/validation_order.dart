import '../models/order_model.dart';

class ValidationOrder{
  bool validCustomerData(Order order){
    if (order.customerName == null ||
        order.customerName.isEmpty) {
      print('Error: Customer name is required');
      return false;
    }
    return true;
  }
}