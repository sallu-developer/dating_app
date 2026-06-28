import 'package:flutter/material.dart';

class MessagesListScreen extends StatelessWidget {
  const MessagesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7F4),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 100),
                children: [
                  _buildSearchBar(),
                  const SizedBox(height: 20),
                  _buildNewMatchesHeader(),
                  const SizedBox(height: 16),
                  _buildNewMatchesList(),
                  const SizedBox(height: 24),
                  _buildFilterPills(),
                  const SizedBox(height: 16),
                  _buildChatList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Messages',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))
              ],
            ),
            child: const Icon(Icons.settings_outlined, size: 20, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
          ]
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search matches or messages',
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.zero,
            prefixIconConstraints: const BoxConstraints(minWidth: 28, minHeight: 24),
            prefixIcon: Icon(Icons.search, color: Colors.grey.shade400, size: 20),
          ),
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ),
    );
  }

  Widget _buildNewMatchesHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'NEW MATCHES',
            style: TextStyle(color: Color(0xFFDF4A70), fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
          Text(
            'See all →',
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildNewMatchesList() {
    final matches = [
      {'name': 'Sarah', 'img': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&q=80', 'badge': 'NEW', 'badgeColor': const Color(0xFFDF4A70)},
      {'name': 'Ariya', 'img': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=150&q=80', 'icon': '🎁', 'badgeColor': Colors.amber},
      {'name': 'Liam', 'img': 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=150&q=80', 'badge': '', 'badgeColor': Colors.transparent},
      {'name': 'Chloe', 'img': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&q=80', 'icon': '💌', 'badgeColor': Colors.pink.shade300},
      {'name': 'Dev', 'img': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=150&q=80', 'badge': '', 'badgeColor': Colors.transparent},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final match = matches[index];
          final bool hasBadge = match['badge'] != '';
          final bool hasIcon = match['icon'] != null;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFDF4A70), width: 2),
                      ),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(match['img'] as String),
                      ),
                    ),
                    if (hasBadge || hasIcon)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: hasIcon ? 4 : 6, vertical: hasIcon ? 4 : 2),
                          decoration: BoxDecoration(
                            color: match['badgeColor'] as Color,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: hasIcon
                              ? Text(match['icon'] as String, style: const TextStyle(fontSize: 8))
                              : Text(match['badge'] as String, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                        ),
                      )
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  match['name'] as String,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.black87),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterPills() {
    final filters = ['All', 'Unread', 'Online', 'Nearby', 'Date Invites'];
    return SizedBox(
      height: 36,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFDF4A70) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: isSelected ? null : Border.all(color: Colors.grey.shade300),
            ),
            child: Text(
              filters[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 13,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildChatList() {
    final chats = [
      {
        'name': 'Aanya',
        'age': '25',
        'img': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&q=80',
        'match': '92% Match',
        'time': '2m',
        'message': "Can't wait to see you tonight at the...",
        'unread': 2,
        'progressValue': 1.0,
        'progressColor': Colors.green,
        'progressText': 'Gift unlocked!',
        'progressIcon': '🎁',
        'isTyping': false,
        'isOnline': true,
      },
      {
        'name': 'Jordan',
        'age': '27',
        'img': 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=150&q=80',
        'match': '88% Match',
        'time': 'Now',
        'message': "Typing...",
        'unread': 0,
        'progressValue': 0.7,
        'progressColor': const Color(0xFFDF4A70),
        'progressText': '18/25 for Premium Rose',
        'progressIcon': '🌹',
        'isTyping': true,
        'isOnline': true,
      },
      {
        'name': 'Marcus',
        'age': '29',
        'img': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=150&q=80',
        'match': '75% Match',
        'time': '1h',
        'message': "That sounds like an amazing hobby! Ho...",
        'unread': 0,
        'progressValue': 0.2,
        'progressColor': Colors.red.shade400,
        'progressText': '5/25 • Deadline 14h',
        'progressIcon': '⏰',
        'isTyping': false,
        'isOnline': false,
      },
      {
        'name': 'Elena',
        'age': '23',
        'img': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=150&q=80',
        'match': '95% Match',
        'time': '3h',
        'message': "You: Hey! I'm heading over now.",
        'unread': 0,
        'progressValue': 0.9,
        'progressColor': const Color(0xFFDF4A70),
        'progressText': '22/25 for Silver Ring',
        'progressIcon': '💍',
        'isTyping': false,
        'isOnline': true,
      },
      {
        'name': 'Rohan',
        'age': '26',
        'img': 'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?auto=format&fit=crop&w=150&q=80',
        'match': '81% Match',
        'time': 'Yesterday',
        'message': "Have a great day at work!",
        'unread': 0,
        'progressValue': 0.4,
        'progressColor': Colors.amber,
        'progressText': '10/25 for Coffee Date',
        'progressIcon': '☕',
        'isTyping': false,
        'isOnline': false,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: chats.map((chat) => _buildChatTile(chat)).toList(),
      ),
    );
  }

  Widget _buildChatTile(Map<String, dynamic> chat) {
    final bool isTyping = chat['isTyping'] as bool;
    final int unread = chat['unread'] as int;
    final bool isOnline = chat['isOnline'] as bool;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(chat['img'] as String),
              ),
              if (isOnline)
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.5),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${chat['name']}, ${chat['age']}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.pink.shade50,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            chat['match'] as String,
                            style: const TextStyle(color: Color(0xFFDF4A70), fontSize: 9, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      chat['time'] as String,
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        chat['message'] as String,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isTyping ? const Color(0xFFDF4A70) : (unread > 0 ? Colors.black87 : Colors.grey.shade500),
                          fontWeight: (isTyping || unread > 0) ? FontWeight.bold : FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    if (unread > 0)
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Color(0xFFDF4A70),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          unread.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      )
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: chat['progressValue'] as double,
                          child: Container(
                            decoration: BoxDecoration(
                              color: chat['progressColor'] as Color,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${chat['progressText']} ${chat['progressIcon']}',
                      style: TextStyle(
                        color: chat['progressColor'] as Color,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
