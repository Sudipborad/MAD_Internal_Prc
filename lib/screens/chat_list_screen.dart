import 'package:flutter/material.dart';
import 'package:tradehub_marketplace/main.dart'; // For AppColors
import 'package:tradehub_marketplace/models/chat_model.dart';
import 'package:tradehub_marketplace/screens/chat_detail_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  // Mock data for demo
  final List<ChatThread> _threads = [
    ChatThread(
      id: 'thread_1',
      otherUserId: 'user_2',
      otherUserName: 'Alex Johnson',
      lastMessage: 'Is the vintage camera still available?',
      lastMessageTime: DateTime.now().subtract(const Duration(minutes: 5)),
      unreadCount: 2,
    ),
    ChatThread(
      id: 'thread_2',
      otherUserId: 'user_3',
      otherUserName: 'Sarah Smith',
      lastMessage: 'Thanks! I will pick it up tomorrow.',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 2)),
      unreadCount: 0,
    ),
    ChatThread(
      id: 'thread_3',
      otherUserId: 'user_4',
      otherUserName: 'Mike Davies',
      lastMessage: 'Can you do $50 for the headphones?',
      lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
      unreadCount: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: AppColors.cardDark,
        elevation: 0,
      ),
      body: _threads.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              itemCount: _threads.length,
              itemBuilder: (context, index) {
                final thread = _threads[index];
                return _buildThreadItem(thread);
              },
            ),
    );
  }

  Widget _buildThreadItem(ChatThread thread) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailScreen(thread: thread),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.borderDark, width: 1),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.borderDark,
              child: Text(
                thread.otherUserName[0].toUpperCase(),
                style: const TextStyle(
                  color: AppColors.textLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        thread.otherUserName,
                        style: const TextStyle(
                          color: AppColors.textLight,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        _formatTime(thread.lastMessageTime),
                        style: TextStyle(
                          color: thread.unreadCount > 0
                              ? AppColors.accentOrange
                              : AppColors.textMuted,
                          fontSize: 12,
                          fontWeight: thread.unreadCount > 0
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          thread.lastMessage,
                          style: TextStyle(
                            color: thread.unreadCount > 0
                                ? AppColors.textLight
                                : AppColors.textMuted,
                            fontWeight: thread.unreadCount > 0
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (thread.unreadCount > 0)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: AppColors.accentOrange,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            thread.unreadCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat_bubble_outline, size: 80, color: AppColors.textMuted.withOpacity(0.5)),
          const SizedBox(height: 16),
          const Text(
            'No messages yet',
            style: TextStyle(
              color: AppColors.textLight,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'When you contact a seller or a buyer contacts you,\nmessages will appear here.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    if (now.difference(time).inDays == 0) {
      if (now.day != time.day) return 'Yesterday';
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    } else if (now.difference(time).inDays == 1) {
      return 'Yesterday';
    } else {
      return '${time.day}/${time.month}/${time.year}';
    }
  }
}
