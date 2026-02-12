import '../models/user_model.dart';
import '../notifaction/email_notfiy.dart';
import '../reopesitry/user_repo.dart';
import '../validator/email_validator.dart';
import 'hash_password.dart';
import 'logger_user.dart';

class CreationUser {
  EmailValidator emailValidator;
  HashPassword hashPassword;
  UserRepository userRepository;
  EmailNotification emailNotification;
  UserLogger userLogger;

  CreationUser({
    required this.emailValidator,
    required this.hashPassword,
    required this.userRepository,
    required this.emailNotification,
    required this.userLogger,
  });

  void createUser(UserModel userModel) {
    if (emailValidator.isValidEmail(userModel.email)) {
      hashPassword.hashPassword(userModel.password);
      userRepository.save(userModel);
      emailNotification.sendWelcomeEmail(userModel);
      userLogger.logUserCreation(userModel);
    }

  }
}
