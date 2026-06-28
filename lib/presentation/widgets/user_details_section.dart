import 'package:flutter/material.dart';
import 'package:dating_app/domain/entities/user_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/presentation/widgets/compliment_bottom_sheet.dart';

class UserDetailsSection extends StatelessWidget {
  final UserEntity user;

  const UserDetailsSection({Key? key, required this.user}) : super(key: key);

  String formatDob(DateTime date) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildLightTag(user.matchPercentage.toString() + '% Match', Colors.blue),
              _buildLightTag(user.trustPercentage.toString() + '% Trust', Colors.green),
              _buildLightTag(user.replyTime, Colors.orange),
            ],
          ),
          const SizedBox(height: 28),
          
          const Text(
            'ABOUT',
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            user.about,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          
          const Text(
            'THE BASICS',
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              children: [
                _buildBasicRow(Icons.cake_outlined, 'Age', '${user.age} years old', formatDob(user.dob)),
                _buildDivider(),
                _buildBasicRow(Icons.height, 'Height', user.height, null),
                _buildDivider(),
                _buildBasicRow(Icons.location_on_outlined, 'Lives in', user.city, 'Maharashtra'),
                _buildDivider(),
                _buildBasicRow(Icons.favorite_border, 'Love language', user.loveLanguage, user.loveLanguageSub),
                _buildDivider(),
                _buildBasicRow(Icons.account_balance_outlined, 'Religion', user.religion, null),
                _buildDivider(),
                _buildBasicRow(Icons.people_outline, 'Interested in', user.interestedIn, null),
                _buildDivider(),
                _buildBasicRow(Icons.wb_sunny_outlined, 'Zodiac', user.zodiac, user.zodiacSub),
                _buildDivider(),
                _buildBasicRow(Icons.translate, 'Mother tongue', user.motherTongue, null),
                _buildDivider(),
                _buildBasicRow(Icons.phone_in_talk_outlined, 'Communication style', user.communicationStyle, null),
              ],
            ),
          ),
          const SizedBox(height: 32),

          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(user.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black54, Colors.transparent],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: const Icon(Icons.play_arrow, color: Colors.black87, size: 28),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: Text(
                          'Video intro • ${user.videoDuration}',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -15,
                right: 15,
                child: _buildFloatingRoseButton(context, 'Profile details'),
              ),
            ],
          ),
          const SizedBox(height: 32),
          
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.promptQuestion,
                      style: const TextStyle(color: Colors.pinkAccent, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      user.promptAnswer,
                      style: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold, height: 1.3),
                    ),
                    const SizedBox(height: 24),
                    _buildInlineRoseButton(context, 'Prompt'),
                  ],
                ),
              ),
              Positioned(
                top: -15,
                right: 15,
                child: _buildFloatingRoseButton(context, 'Profile details'),
              ),
            ],
          ),
          const SizedBox(height: 32),

          const Text(
            'CAREER & AMBITION',
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBasicRow(Icons.school_outlined, 'Education', user.education, user.educationSub),
                    _buildDivider(),
                    _buildBasicRow(Icons.work_outline, 'Work as', user.workAs, user.workAsSub),
                    _buildDivider(),
                    _buildBasicRow(Icons.auto_awesome, 'Work style', user.workStyle, null),
                    _buildDivider(),
                    _buildBasicRow(Icons.trending_up, 'Ambition level', user.ambitionLevel, null),
                    
                    const SizedBox(height: 24),
                    const Text(
                      'HER BIG DREAM',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      user.bigDream,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -15,
                right: 15,
                child: _buildFloatingRoseButton(context, 'Profile details'),
              ),
            ],
          ),
          const SizedBox(height: 32),

          Container(
            height: 380,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: CachedNetworkImageProvider(user.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 32),

          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.secondPromptQuestion,
                      style: const TextStyle(color: Colors.pinkAccent, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      user.secondPromptAnswer,
                      style: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold, height: 1.3),
                    ),
                    const SizedBox(height: 24),
                    _buildInlineRoseButton(context, 'Prompt'),
                  ],
                ),
              ),
              Positioned(
                top: -15,
                right: 15,
                child: _buildFloatingRoseButton(context, 'Profile details'),
              ),
            ],
          ),
          const SizedBox(height: 32),

          const Text(
            'INTERESTS & HOBBIES',
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: user.interests.map((interest) => _buildInterestTag(interest)).toList(),
          ),
          const SizedBox(height: 32),

          const Text(
            'LIFESTYLE',
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))
                  ],
                ),
                child: Column(
                  children: [
                    _buildBasicRow(Icons.restaurant_outlined, 'Diet', user.diet, null),
                    _buildDivider(),
                    _buildBasicRow(Icons.wine_bar_outlined, 'Drinking', user.drinking, null),
                    _buildDivider(),
                    _buildBasicRow(Icons.smoking_rooms_outlined, 'Smoking', user.smoking, null),
                    _buildDivider(),
                    _buildBasicRow(Icons.show_chart, 'Fitness', user.fitness, user.fitnessSub),
                    _buildDivider(),
                    _buildBasicRow(Icons.location_on_outlined, 'Travel', user.travel, null),
                    _buildDivider(),
                    _buildBasicRow(Icons.pets, 'Pets', user.pets, null),
                    _buildDivider(),
                    _buildBasicRow(Icons.nightlight_round_outlined, 'Sleep', user.sleep, null),
                  ],
                ),
              ),
              Positioned(
                bottom: -15,
                right: 15,
                child: _buildFloatingRoseButton(context, 'Profile details'),
              ),
            ],
          ),
          const SizedBox(height: 32),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFE85A82), Color(0xFFF16474)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.red.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'DATING GOAL',
                  style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                ),
                const SizedBox(height: 12),
                Text(
                  user.datingGoal,
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  user.datingGoalSub,
                  style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          Container(
            height: 380,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: CachedNetworkImageProvider(user.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 32),

          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.thirdPromptQuestion,
                      style: const TextStyle(color: Colors.pinkAccent, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      user.thirdPromptAnswer,
                      style: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold, height: 1.3),
                    ),
                    const SizedBox(height: 24),
                    _buildInlineRoseButton(context, 'Prompt'),
                  ],
                ),
              ),
              Positioned(
                top: -15,
                right: 15,
                child: _buildFloatingRoseButton(context, 'Profile details'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showComplimentSheet(BuildContext context, String type) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ComplimentBottomSheet(
        title: type,
        userName: user.name,
        userImageUrl: user.imageUrl,
      ),
    );
  }

  Widget _buildInlineRoseButton(BuildContext context, String type) {
    return GestureDetector(
      onTap: () => _showComplimentSheet(context, type),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.red.shade100, width: 0.5),
        ),
        child: const Text('🌹', style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget _buildFloatingRoseButton(BuildContext context, String type) {
    return GestureDetector(
      onTap: () => _showComplimentSheet(context, type),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.05),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.red.withOpacity(0.3), width: 1.0),
        ),
        child: const Text('🌹', style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget _buildInterestTag(String text) {
    IconData getIcon(String interest) {
      switch (interest) {
        case 'Travel': return Icons.flight;
        case 'Coffee': return Icons.coffee_outlined;
        case 'Trekking': return Icons.landscape;
        case 'Books': return Icons.menu_book;
        case 'Yoga': return Icons.self_improvement;
        case 'Indie music': return Icons.music_note;
        case 'Cooking': return Icons.favorite_border;
        case 'Photography': return Icons.camera_alt_outlined;
        case 'Gaming': return Icons.videogame_asset_outlined;
        case 'Movies': return Icons.movie_outlined;
        case 'Art': return Icons.palette_outlined;
        case 'Dogs': return Icons.pets;
        case 'Cats': return Icons.pets;
        case 'Fitness': return Icons.fitness_center;
        default: return Icons.star_border;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4, offset: const Offset(0, 2)),
        ],
        border: Border.all(color: Colors.red.shade50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(color: Colors.red.shade50, shape: BoxShape.circle),
            child: Icon(getIcon(text), color: Colors.red.shade300, size: 14),
          ),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildBasicRow(IconData icon, String title, String value, String? subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: subtitle != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.red.shade300, size: 22),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: const TextStyle(color: Colors.black54, fontSize: 15))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.black38, fontSize: 13)),
              ],
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(color: Colors.grey.shade200, height: 1, thickness: 1);
  }

  Widget _buildLightTag(String text, Color dotColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 6, height: 6, decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle)),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
