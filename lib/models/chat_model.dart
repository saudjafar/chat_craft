import 'package:flutter/material.dart';

@immutable
class ChatModel {
  final String id;
  final String message;
  final bool isMe;
  final bool isAnimated;

  const ChatModel({
    required this.id,
    required this.message,
    required this.isMe,
    required this.isAnimated,
  });
}
