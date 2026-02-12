import '../models/user_model.dart';

class UserLogger{
  void logUserCreation(UserModel userModel) {
    print('LOG: User ${userModel.name} created at ${DateTime.now()}');
  }
}