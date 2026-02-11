import '../models/credit_card_model.dart';
import '../models/paypal_model.dart';

abstract interface class PaymentService {
  String get typePayment;
  bool processPayment();

}

class CreditCardPayment implements PaymentService{

  final CreditCard creditCard;


  CreditCardPayment(this.creditCard);

  @override
  bool processPayment() {
    // TODO: implement processPayment
    // Imp Payment Gateway
    print("Holder Name : ${creditCard.holderName} | Number of card : ${_privateNumberOfCard(creditCard.numberOfCard)} | ");
    return true;
  }

  /// Function For Secret Number Of Card
  String _privateNumberOfCard (String numberCard)=> "*******${numberCard.substring(12,16)}";


  @override
  // TODO: implement typePayment
  String get typePayment => "Credit Card";

}


class PaypalPayment implements PaymentService{
  PaypalModel paypalModel;


  PaypalPayment(this.paypalModel);

  @override
  bool processPayment() {
    // TODO: implement processPayment
    /// Imp Paypal
    print("Paypal Gateway :: For Email | ${paypalModel.emailCustomer} || Amount : ${paypalModel.amount}");
    return true;
  }

  @override
  // TODO: implement typePayment
  String get typePayment => "PayPal";

}