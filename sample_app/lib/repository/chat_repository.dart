import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../models/chat_message.dart';

class ChatRepository {
  late IO.Socket socket;
  Function(ChatMessage)? onMessageReceived;

  void connect(String userId,
      {String serverUrl = "https://6d73-114-79-157-34.ngrok-free.app"}) {
    socket = IO.io(serverUrl, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    socket.connect();

    socket.onConnect((_) {
      print("Connected with socket id: ${socket.id}");
      socket.emit('join', userId);
    });

    socket.on('receive_message', (data) {
      print("Received message: $data");
      if (onMessageReceived != null) {
        final chatMessage =
            ChatMessage.fromJson(Map<String, dynamic>.from(data));
        onMessageReceived!(chatMessage);
      }
    });

    socket.onDisconnect((_) {
      print("Disconnected");
    });
  }

  void sendMessage(ChatMessage message) {
    socket.emit('send_message', message.toJson());
  }

  void dispose() {
    socket.dispose();
  }
}
