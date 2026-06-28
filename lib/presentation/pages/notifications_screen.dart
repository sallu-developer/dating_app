import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String selectedTab = 'All';
  final List<String> tabs = ['All', 'Likes & roses', 'Matches', 'Gifts', 'Dates'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE9), // Creamy background matching the app
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 16),
            _buildTabs(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const Text(
                    'TODAY',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Dev - Rose
                  _buildNotificationCard(
                    context: context,
                    avatarUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=150&q=80',
                    badgeType: 'rose',
                    title: 'Dev, 27',
                    actionText: 'sent you a Rose',
                    message: '"Your trekking photos sold me — lets swap trail stories."',
                    time: '12 min ago',
                    buttonText: 'View profile',
                    isUnread: true,
                  ),
                  
                  // Arjun - Compliment
                  _buildNotificationCard(
                    context: context,
                    avatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=150&q=80',
                    badgeType: 'chat',
                    title: 'Arjun, 28',
                    actionText: 'complimented your About',
                    message: '"Equally driven and equally curious — that line got me."',
                    time: '3 h ago',
                    isUnread: false,
                  ),

                  // Aanya - Match
                  _buildNotificationCard(
                    context: context,
                    avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&q=80',
                    badgeType: 'match',
                    title: 'Aanya, 25',
                    actionText: "It's a match with",
                    isMatchTitle: true,
                    message: 'You both liked each other. Say hello before the spark fades.',
                    time: '40 min ago',
                    buttonText: 'Send a message',
                    isUnread: true,
                  ),

                  // Elena - Message
                  _buildNotificationCard(
                    context: context,
                    avatarUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&w=150&q=80',
                    badgeType: 'message',
                    title: 'Elena, 23',
                    actionText: 'sent you a message',
                    message: '"Haha okay that café pick was elite. When are you free?"',
                    time: '1 h ago',
                    isUnread: true,
                  ),

                  // Kabir - Date Request
                  _buildNotificationCard(
                    context: context,
                    avatarUrl: null, // Will use calendar icon
                    badgeType: 'none',
                    title: 'Kabir',
                    actionText: 'approved your date request',
                    message: 'Coffee at Blue Tokai • Today, 7:00 PM • Koregaon Park',
                    time: '2 h ago',
                    buttonText: 'Open chat',
                    isUnread: true,
                  ),
                  
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black87),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    '9 new updates',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            'Mark all read',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.pink.shade400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final tab = tabs[index];
          final isSelected = tab == selectedTab;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTab = tab;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF2C2424) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: isSelected ? Colors.transparent : Colors.grey.shade300),
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Text(
                    tab,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  if (tab == 'All' && isSelected) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '56',
                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNotificationCard({
    required BuildContext context,
    required String? avatarUrl,
    required String badgeType,
    required String title,
    required String actionText,
    required String message,
    required String time,
    String? buttonText,
    bool isUnread = false,
    bool isMatchTitle = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar and Badge
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              children: [
                if (avatarUrl != null)
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(avatarUrl!),
                  )
                else
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.calendar_month, color: Colors.orange.shade300),
                  ),
                if (badgeType != 'none')
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: _getBadgeColor(badgeType),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                      child: _getBadgeWidget(badgeType),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Unread Dot
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: isMatchTitle
                          ? RichText(
                              text: TextSpan(
                                style: const TextStyle(fontSize: 14, color: Colors.black87),
                                children: [
                                  TextSpan(text: '$actionText '),
                                  TextSpan(text: title, style: const TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            )
                          : RichText(
                              text: TextSpan(
                                style: const TextStyle(fontSize: 14, color: Colors.black87),
                                children: [
                                  TextSpan(text: '$title ', style: const TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: actionText),
                                ],
                              ),
                            ),
                    ),
                    if (isUnread)
                      Container(
                        margin: const EdgeInsets.only(top: 4, left: 8),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.pink.shade400,
                          shape: BoxShape.circle,
                        ),
                      )
                  ],
                ),
                const SizedBox(height: 6),
                
                // Message
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Time
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                
                // Action Button
                if (buttonText != null) ...[
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDF4A70),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }

  Color _getBadgeColor(String type) {
    switch (type) {
      case 'rose':
        return Colors.pink.shade400;
      case 'chat':
        return Colors.amber.shade600;
      case 'match':
        return Colors.green.shade500;
      case 'message':
        return Colors.pink.shade700;
      default:
        return Colors.grey;
    }
  }

  Widget _getBadgeWidget(String type) {
    switch (type) {
      case 'rose':
        return const Text('🌹', style: TextStyle(fontSize: 10));
      case 'chat':
        return const Icon(Icons.chat_bubble, size: 10, color: Colors.white);
      case 'match':
        return const Icon(Icons.check, size: 10, color: Colors.white);
      case 'message':
        return const Icon(Icons.chat, size: 10, color: Colors.white);
      default:
        return const Icon(Icons.circle, size: 10, color: Colors.white);
    }
  }
  }

