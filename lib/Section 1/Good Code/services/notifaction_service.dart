abstract class NotificationService{

  void send(String To , String subject , String body);
}

class EmailNotification implements NotificationService{
  @override
  void send(String To, String subject, String body) {
    // TODO: implement send
    print("Email sending to ${To} | "
        "\n subject : $subject"
        "\n Body : $body");
  }

}