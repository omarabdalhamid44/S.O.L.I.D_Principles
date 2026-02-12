import '../models/user_model.dart';

class UserRepository{
  void save(UserModel userModel) {
    print('Saving user ${userModel.name} to database...');
  }
}