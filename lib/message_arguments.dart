import 'package:firebase_messaging/firebase_messaging.dart';

class MessageArguments{
  RemoteMessage? message;
  bool? messageData ;

  MessageArguments(this.message, this.messageData);
}