import '../models/user_model.dart';

class EmailNotification{
  void sendWelcomeEmail(UserModel userModel) {
    print('Sending welcome email to ${userModel.email}...');
  }
}