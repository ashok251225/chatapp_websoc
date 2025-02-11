// lib/chat/bloc/chat_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/models/chat_message.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    on<SendMessageEvent>((event, emit) {
      final updatedMessages = List<ChatMessage>.from(state.messages)
        ..add(event.message);
      emit(state.copyWith(messages: updatedMessages));
    });

    on<MessageReceivedEvent>((event, emit) {
      final updatedMessages = List<ChatMessage>.from(state.messages)
        ..add(event.message);
      emit(state.copyWith(messages: updatedMessages));
    });
  }
}
