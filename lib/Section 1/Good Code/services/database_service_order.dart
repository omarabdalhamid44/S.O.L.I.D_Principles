import '../models/order_model.dart';
import 'order_service.dart';

class DatabaseServiceOrders{

  void updateInventoryInDatabase(Order order) {
    /// Impl
    for(var item in order.items){
      print("Item ID ${item['id']} - Quantity ${item['stock'] - item['quantity'] }");
    }
  }

  void saveOrderToDatabase(Order order) {
    /// Impl

  }


}