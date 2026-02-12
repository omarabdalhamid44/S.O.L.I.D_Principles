class EmailValidator{
  bool isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }
}