import 'package:flutter/material.dart';
import 'package:dating_app/domain/entities/user_entity.dart';
import 'package:dating_app/presentation/widgets/user_image_section.dart';
import 'package:dating_app/presentation/widgets/user_details_section.dart';

class UserCard extends StatelessWidget {
  final UserEntity user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: const Color(0xFFF2EFE9), // Light background color for the scrollable area
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Reusable Image Section Component
              UserImageSection(user: user),
              
              // 2. Reusable Details Section Component
              UserDetailsSection(user: user),

              // Add extra space at the bottom so content isn't hidden behind the bottom nav bar
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
