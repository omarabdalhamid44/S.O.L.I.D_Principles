import '../models/credit_card_model.dart';

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