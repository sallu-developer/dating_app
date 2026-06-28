import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:dating_app/presentation/blocs/home/home_bloc.dart';
import 'package:dating_app/presentation/blocs/home/home_event.dart';
import 'package:dating_app/presentation/blocs/home/home_state.dart';
import 'package:dating_app/presentation/widgets/custom_app_bar.dart';
import 'package:dating_app/presentation/widgets/custom_bottom_nav.dart';
import 'package:dating_app/presentation/widgets/user_image_section.dart';
import 'package:dating_app/presentation/widgets/user_details_section.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  final bool hideBottomNav;
  
  const HomeScreen({Key? key, this.hideBottomNav = false}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CardSwiperController controller = CardSwiperController();
  int _currentIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE9),
      appBar: const CustomAppBar(),
      drawer: _buildPremiumDrawer(),
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading || state is HomeInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeError) {
                return Center(child: Text(state.message));
              } else if (state is HomeLoaded) {
                final userIndex = _currentIndex < state.users.length ? _currentIndex : 0;
                final currentUser = state.users.isNotEmpty ? state.users[userIndex] : null;

                if (currentUser == null) return const SizedBox();

                return LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: constraints.maxHeight - 95,
                            child: CardSwiper(
                              controller: controller,
                              cardsCount: state.users.length,
                              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                              numberOfCardsDisplayed: 1, 
                              onSwipe: (previousIndex, currentIndex, direction) {
                                if (currentIndex != null) {
                                  setState(() {
                                    _currentIndex = currentIndex;
                                  });
                                }
                                return true;
                              },
                              onEnd: () {
                                context.read<HomeBloc>().add(RefreshUsersEvent());
                                setState(() {
                                  _currentIndex = 0;
                                });
                              },
                              cardBuilder: (context, index) {
                                return UserImageSection(user: state.users[index]);
                              },
                            ),
                          ),
                          
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: UserDetailsSection(
                              key: ValueKey(currentUser.id),
                              user: currentUser,
                            ),
                          ),
                          
                          const SizedBox(height: 100), 
                          
                          if (_currentIndex + 1 < state.users.length)
                            Offstage(
                              offstage: true,
                              child: CachedNetworkImage(imageUrl: state.users[_currentIndex + 1].imageUrl),
                            ),
                        ],
                      ),
                    );
                  }
                );
              }
              return const SizedBox();
            },
          ),
          if (!widget.hideBottomNav)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNav(
                currentIndex: 0,
                onTap: (index) {},
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPremiumDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Drawer Header
          Container(
            padding: const EdgeInsets.only(top: 60, bottom: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink.shade300, Colors.pink.shade500],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: const DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1527980965255-d3b416303d12?auto=format&fit=crop&w=200&q=80'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sallu Ansari',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'View Profile',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 10),
          
          // Premium Banner
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.orange.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.white, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Get Premium', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('See who liked you!', style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Menu Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                _buildDrawerItem(Icons.favorite_border, 'Matches', Colors.pink.shade400),
                _buildDrawerItem(Icons.chat_bubble_outline, 'Messages', Colors.blue.shade400),
                _buildDrawerItem(Icons.settings_outlined, 'Settings', Colors.grey.shade700),
                _buildDrawerItem(Icons.security, 'Privacy & Safety', Colors.green.shade500),
                _buildDrawerItem(Icons.help_outline, 'Help Center', Colors.orange.shade400),
              ],
            ),
          ),
          
          // Logout
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text('Log Out', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
            onTap: () {},
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
      trailing: const Icon(Icons.chevron_right, color: Colors.black26),
      onTap: () {},
    );
  }
}
