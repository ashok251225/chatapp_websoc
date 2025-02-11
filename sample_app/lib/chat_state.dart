// lib/chat/bloc/chat_state.dart
import '../models/chat_message.dart';

class ChatState {
  final List<ChatMessage> messages;

  ChatState({this.messages = const []});

  ChatState copyWith({List<ChatMessage>? messages}) {
    return ChatState(
      messages: messages ?? this.messages,
    );
  }
}
