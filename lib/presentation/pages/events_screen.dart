import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  String selectedFilter = 'All';
  final List<String> filters = ['All', 'Parties', 'Meetups', 'Online'];

  final List<Map<String, dynamic>> dummyEvents = [
    {
      'title': 'Singles Cocktail Night',
      'category': 'Parties',
      'date': 'Sat, 24 Oct • 8:00 PM',
      'location': 'Olive Bar & Kitchen',
      'image': 'https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?auto=format&fit=crop&w=800&q=80',
      'joined': 24,
    },
    {
      'title': 'Pottery & Wine Workshop',
      'category': 'Meetups',
      'date': 'Sun, 25 Oct • 4:00 PM',
      'location': 'The Clay Company',
      'image': 'https://images.unsplash.com/photo-1610756786016-0182dc7c126d?auto=format&fit=crop&w=800&q=80',
      'joined': 12,
    },
    {
      'title': 'Virtual Speed Dating',
      'category': 'Online',
      'date': 'Wed, 28 Oct • 9:00 PM',
      'location': 'Online Event',
      'image': 'https://images.unsplash.com/photo-1511632765486-a01980e01a18?auto=format&fit=crop&w=800&q=80',
      'joined': 150,
    },
    {
      'title': 'Sunday Brunch Mixer',
      'category': 'Meetups',
      'date': 'Sun, 1 Nov • 11:00 AM',
      'location': 'Bastian, Bandra',
      'image': 'https://images.unsplash.com/photo-1528605248644-14dd04022da1?auto=format&fit=crop&w=800&q=80',
      'joined': 45,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE9),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildFilters(),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 100),
                  itemCount: dummyEvents.length,
                  itemBuilder: (context, index) {
                    final event = dummyEvents[index];
                    // Apply filter
                    if (selectedFilter != 'All' && event['category'] != selectedFilter) {
                      return const SizedBox.shrink();
                    }
                    return _buildEventCard(event);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              children: [
                const TextSpan(text: 'Discover '),
                TextSpan(
                  text: 'Events',
                  style: TextStyle(color: Colors.pink.shade400),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.search, color: Colors.black87, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      showsHorizontalScrollIndicator: false,
      child: Row(
        children: filters.map((filter) {
          final isSelected = filter == selectedFilter;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = filter;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.pink.shade500 : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Colors.pink.shade500 : Colors.grey.shade300,
                  width: 1,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ]
                    : [],
              ),
              child: Text(
                filter,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEventCard(Map<String, dynamic> event) {
    return Container(
      height: 240,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: NetworkImage(event['image']),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.9),
                  ],
                  stops: const [0.0, 0.4, 0.7, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
                backdropFilter: const ColorFilter.mode(Colors.black12, BlendMode.srcOver), // Simple visual effect
              ),
              child: Text(
                event['category'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event['date'],
                  style: TextStyle(
                    color: Colors.pink.shade300,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  event['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.white70, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      event['location'],
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildAvatars(event['joined']),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Join',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
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
    );
  }

  Widget _buildAvatars(int count) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          height: 30,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: _buildAvatarCircle('https://randomuser.me/api/portraits/women/44.jpg'),
              ),
              Positioned(
                left: 20,
                child: _buildAvatarCircle('https://randomuser.me/api/portraits/men/32.jpg'),
              ),
              Positioned(
                left: 40,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade400,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black87, width: 2),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '+',
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '$count Joined',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildAvatarCircle(String url) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black87, width: 2),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
