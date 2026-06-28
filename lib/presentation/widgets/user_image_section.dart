import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/domain/entities/user_entity.dart';

class UserImageSection extends StatelessWidget {
  final UserEntity user;

  const UserImageSection({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: CachedNetworkImage(
                imageUrl: user.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 250,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.9), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(top: 16, left: 16, child: _buildCircularButton(Icons.refresh)),
          Positioned(top: 16, right: 16, child: _buildCircularButton(Icons.more_vert)),
          Positioned(
            bottom: 24,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildDarkTag(user.matchPercentage.toString() + '% Match', Colors.blue),
                    _buildDarkTag(user.trustPercentage.toString() + '% Trust', Colors.green),
                    _buildDarkTag(user.replyTime, Colors.orange),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.greenAccent, shape: BoxShape.circle)),
                    const SizedBox(width: 8),
                    Text('${user.name} ${user.age}', style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    if (user.isVerified) const Icon(Icons.verified, color: Colors.pinkAccent, size: 24),
                  ],
                ),
                const SizedBox(height: 8),
                _buildDetailRow(Icons.location_on, '${user.city} - ${user.distanceKm} km away'),
                const SizedBox(height: 4),
                _buildDetailRow(Icons.work, '${user.profession} - ${user.height.split(" ")[0]}'),
                const SizedBox(height: 4),
                _buildDetailRow(Icons.favorite, user.relationshipIntent),
              ],
            ),
          ),
          Positioned(
            bottom: 24,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: const Text('🌹', style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
      child: IconButton(icon: Icon(icon, color: Colors.black54), onPressed: () {}),
    );
  }

  Widget _buildDarkTag(String text, Color dotColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24, width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 6, height: 6, decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle)),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 16),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }
}
