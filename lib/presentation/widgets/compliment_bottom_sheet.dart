import 'package:flutter/material.dart';
import 'package:dating_app/presentation/pages/chat_screen.dart';
import 'package:dating_app/presentation/widgets/compliment_ideas_sheet.dart';

class ComplimentBottomSheet extends StatefulWidget {
  final String title;
  final String userName;
  final String userImageUrl;

  const ComplimentBottomSheet({
    Key? key,
    required this.title,
    required this.userName,
    required this.userImageUrl,
  }) : super(key: key);

  @override
  State<ComplimentBottomSheet> createState() => _ComplimentBottomSheetState();
}

class _ComplimentBottomSheetState extends State<ComplimentBottomSheet> {
  final TextEditingController _textController = TextEditingController();
  bool _isRoseSelected = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _openIdeasSheet() async {
    final selectedIdea = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => const ComplimentIdeasSheet(),
      ),
    );

    if (selectedIdea != null) {
      setState(() {
        _textController.text = selectedIdea;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool hasText = _textController.text.trim().isNotEmpty;
    final bool showRedSendButton = _isRoseSelected || hasText;

    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFF2EFE9),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'COMPLIMENTING',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              _buildStatPill('💬', '3 comments'),
              const SizedBox(width: 8),
              _buildStatPill('🌹', '2 roses'),
              const SizedBox(width: 8),
              _buildStatPill('', '5,258 balance', isYellow: true, icon: Icons.monetization_on),
            ],
          ),
          const SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.pink.shade100, width: 1.5),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _textController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'Write a sweet compliment...',
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: _openIdeasSheet,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('💡', style: TextStyle(fontSize: 12)),
                          const SizedBox(width: 4),
                          Text(
                            'Try',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isRoseSelected = !_isRoseSelected;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: _isRoseSelected ? Colors.pink.shade50 : Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: _isRoseSelected ? Colors.pink.shade200 : Colors.grey.shade200),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('🌹', style: TextStyle(fontSize: 14)),
                        const SizedBox(width: 6),
                        Text(
                          'Rose',
                          style: TextStyle(
                            fontSize: 14, 
                            fontWeight: FontWeight.bold, 
                            color: _isRoseSelected ? const Color(0xFFDF4A70) : Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Icon(Icons.check_circle, color: _isRoseSelected ? const Color(0xFFDF4A70) : Colors.grey.shade300, size: 16),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('🎁', style: TextStyle(fontSize: 14)),
                      SizedBox(width: 6),
                      Text(
                        'Select Gift',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${_textController.text.length}/140',
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.pink.shade200, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite, color: Colors.pink.shade300, size: 20),
                    Text('Like', style: TextStyle(fontSize: 10, color: Colors.pink.shade300, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (showRedSendButton) {
                      final navigator = Navigator.of(context);
                      final messenger = ScaffoldMessenger.of(context);

                      navigator.pop();
                      
                      messenger.showSnackBar(
                        SnackBar(
                          backgroundColor: const Color(0xFF2C2424),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          elevation: 0,
                          content: InkWell(
                            onTap: () {
                              messenger.hideCurrentSnackBar();
                              navigator.push(MaterialPageRoute(builder: (_) => ChatScreen(
                                userName: widget.userName,
                                userImageUrl: widget.userImageUrl,
                              )));
                            },
                            child: const Text(
                              '🌹 Rose + 💬 Comment sent! ✨ Opening chat...',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                          ),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: showRedSendButton ? const Color(0xFFDF4A70) : Colors.pink.shade100,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: showRedSendButton ? [
                        BoxShadow(color: const Color(0xFFDF4A70).withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 4))
                      ] : null,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            showRedSendButton ? 'Send 🌹 + 💬' : 'Send Compliment',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Reacting to ${widget.userName}\'s prompt',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatPill(String emoji, String text, {bool isYellow = false, IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isYellow ? Colors.yellow.shade50 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(icon, size: 14, color: Colors.amber.shade600)
          else
            Text(emoji, style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
