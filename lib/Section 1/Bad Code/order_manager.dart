

/// Data Validations
/// Calculate Total Price
/// Inventory Management
/// Database Operation
/// Payment Processing
/// Email Notification
/// Analytics Tracking
/// Warehouse Communication

class OrderManager {

  /// <------ Done to create Order Model
  String customerName = '';
  String customerEmail = '';
  List<Map<String, dynamic>> items = [];
  double totalAmount = 0.0;
/// ---------->


  bool createOrder(Map<String, dynamic> orderData) {

/// <------------------------ Done to create class validation order data
    if (orderData['customerName'] == null ||
        orderData['customerName'].isEmpty) {
      print('Error: Customer name is required');
      return false;
    }
///---------------------->

/// <----------------------- Done to create class validation format
    if (!orderData['customerEmail'].contains('@')) {
      print('Error: Invalid email format');
      return false;
    }
/// ----------------------------->


/// <------------- Done that by class order service & class database for service order
    double total = 0.0;
    for (var item in orderData['items']) {
      total += item['price'] * item['quantity'];

      if (item['quantity'] > 10) {
        total *= 0.9;
      }

      if (item['stock'] < item['quantity']) {
        print('Error: Insufficient stock for ${item['name']}');
        return false;
      }

      updateInventoryInDatabase(item['id'], item['stock'] - item['quantity']);
    }
/// ----------->
    if (orderData['paymentMethod'] == 'credit_card') {
      bool paymentSuccess = chargeCreditCard(
        orderData['cardNumber'],
        orderData['expiryDate'],
        orderData['cvv'],
        total,
      );
      if (!paymentSuccess) {
        print('Payment failed');
        return false;
      }
    } else if (orderData['paymentMethod'] == 'paypal') {
      bool paymentSuccess = chargePaypal(orderData['paypalEmail'], total);
      if (!paymentSuccess) {
        print('PayPal payment failed');
        return false;
      }
    }

    saveOrderToDatabase(orderData);


    sendEmail(
      orderData['customerEmail'],
      'Order Confirmation',
      'Your order #${DateTime.now().millisecondsSinceEpoch} has been confirmed',
    );

    /// Analytics Tracking
    updateAnalytics('order_completed', total);

    notifyWarehouse(orderData);

    return true;
  }

  bool chargeCreditCard(
    String cardNumber,
    String expiry,
    String cvv,
    double amount,
  ) {
    return true;
  }

  bool chargePaypal(String email, double amount) {
    return true;
  }

  /// Call Database
  void updateInventoryInDatabase(String itemId, int newStock) {
    /// Impl
  }

  void saveOrderToDatabase(Map<String, dynamic> orderData) {
    /// Impl

  }

  void sendEmail(String to, String subject, String body) {
    /// Impl
  }

  void updateAnalytics(String event, double value) {
    /// Impl
  }

  void notifyWarehouse(Map<String, dynamic> orderData) {
    /// Impl
  }
}
