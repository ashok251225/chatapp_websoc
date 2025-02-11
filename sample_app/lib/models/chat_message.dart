class ChatMessage {
  final String senderId;
  final String recipientId;
  final String message;
  final DateTime timestamp;

  ChatMessage({
    required this.senderId,
    required this.recipientId,
    required this.message,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  // Optional: For serialization/deserialization
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      senderId: json['senderId'],
      recipientId: json['recipientId'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'recipientId': recipientId,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
