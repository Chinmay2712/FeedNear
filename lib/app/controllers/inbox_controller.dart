import 'package:get/get.dart';
import '../models/message_model.dart';

class InboxController extends GetxController {
  // List of avatar URLs for the horizontal list
  final avatars = [
    'https://via.placeholder.com/50',
    'https://via.placeholder.com/50',
    'https://via.placeholder.com/50',
    'https://via.placeholder.com/50',
    'https://via.placeholder.com/50',
    'https://via.placeholder.com/50',
  ].obs;

  // List of messages for the vertical list
  final messages = [
    Message(
      sender: 'Sarthak Pandey',
      content: "Where's the site can't find 😂",
      time: '8:00 PM',
      avatarUrl: 'https://via.placeholder.com/50',
    ),
    Message(
      sender: 'Sudhanshu Singh',
      content: 'How was the experience? 😁',
      time: '8:00 PM',
      avatarUrl: 'https://via.placeholder.com/50',
    ),
    Message(
      sender: 'Amey Mali',
      content: 'I want to do something kind? 🤔',
      time: '8:00 PM',
      avatarUrl: 'https://via.placeholder.com/50',
    ),
    Message(
      sender: 'Savitri Pandit',
      content: "Where's the site can't find 😂",
      time: '8:00 PM',
      avatarUrl: 'https://via.placeholder.com/50',
    ),
    Message(
      sender: 'Utkarsh Sinha',
      content: "I won't be available, can you do volunte…",
      time: '7:45 PM',
      avatarUrl: 'https://via.placeholder.com/50',
    ),
    Message(
      sender: 'Amey Mali',
      content: 'I want to do something kind? 🤔',
      time: '8:00 PM',
      avatarUrl: 'https://via.placeholder.com/50',
    ),
    Message(
      sender: 'Utkarsh Sinha',
      content: "I won't be available, can you do volunte…",
      time: '7:45 PM',
      avatarUrl: 'https://via.placeholder.com/50',
    ),
    Message(
      sender: 'Savitri Pandit',
      content: "Where's the site can't find 😂",
      time: '8:00 PM',
      avatarUrl: 'https://via.placeholder.com/50',
    ),
  ].obs;
}
