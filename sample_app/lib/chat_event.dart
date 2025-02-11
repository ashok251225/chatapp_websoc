import '../models/chat_message.dart';

abstract class ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final ChatMessage message;

  SendMessageEvent({required this.message});
}

class MessageReceivedEvent extends ChatEvent {
  final ChatMessage message;

  MessageReceivedEvent({required this.message});
}
