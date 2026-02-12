/// To Fix That
/// 1- create class model for user  /
/// 2- create class validator for email
/// 3- create class hash password
/// 4- create class user repo for database service
/// 5- create class email Notification for sending emails
/// 6- create class LoggerUser for user log
/// 7- create class operation user for CRUD users

class UserManager {
  /// <------   create user model
  String name = '';
  String email = '';
/// ------->
  /// <--------- Done by create class for validator email
  bool isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }
/// ----------->
  String hashPassword(String password) {
    return '${password}_hashed';
  }

  /// <----------- Done by create class repository for user
  void saveToDatabase() {
    print('Saving user $name to database...');
  }
/// --------->
  ///
  /// <----------- Done by create class for email notification
  void sendWelcomeEmail() {
    print('Sending welcome email to $email...');
  }
/// ---------->
  ///
  /// <----------- Done by create class for logger user
  void logUserCreation() {
    print('LOG: User $name created at ${DateTime.now()}');
  }
/// ------------->
  void createUser(String name, String email, String password) {
    this.name = name;
    this.email = email;

    if (!isValidEmail(email)) return;

    hashPassword(password);
    saveToDatabase();
    sendWelcomeEmail();
    logUserCreation();
  }
}

void main() {
  final manager = UserManager();
  manager.createUser('John', 'john@example.com', 'password123');
}
