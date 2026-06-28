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
}
