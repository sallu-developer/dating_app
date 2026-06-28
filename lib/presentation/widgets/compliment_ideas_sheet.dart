import 'package:flutter/material.dart';

class ComplimentIdeasSheet extends StatefulWidget {
  const ComplimentIdeasSheet({Key? key}) : super(key: key);

  @override
  State<ComplimentIdeasSheet> createState() => _ComplimentIdeasSheetState();
}

class _ComplimentIdeasSheetState extends State<ComplimentIdeasSheet> {
  String selectedCategory = 'Flirty';
  String? selectedCompliment;

  final List<String> categories = ['Sweet', 'Playful', 'Admiring', 'Flirty', 'Direct'];

  final Map<String, List<String>> complimentData = {
    'Sweet': [
      "You have a really warm smile.",
      "Your profile definitely stood out to me.",
      "You seem like a really genuine person.",
    ],
    'Playful': [
      "I bet I can beat you at Mario Kart.",
      "Are you always this adventurous?",
      "First round is on me if you can guess my favorite movie.",
    ],
    'Admiring': [
      "Your travel photos are absolutely amazing.",
      "I really love your sense of style.",
      "You have great taste in music.",
    ],
    'Flirty': [
      "Not gonna lie, your smile stopped my scroll 😍",
      "You're trouble, I can already tell — the good kind.",
      "If you're as fun in person as your profile, I'm in.",
      "I think we'd make a dangerously good team ☕️➡️🍷",
      "You've got a vibe I can't quite look away from.",
      "Coffee, you, and good conversation — when's good for you?",
    ],
    'Direct': [
      "I'd love to take you out on a date.",
      "Let's skip the small talk and grab a drink.",
    ]
  };

  @override
  void initState() {
    super.initState();
    selectedCompliment = "If you're as fun in person as your profile, I'm in.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F2), // Lighter creamy background
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // Background Gradient at the top
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 300,
              child: Container(
                decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFFFE6EE).withOpacity(0.8), // vibrant pale pink
                    const Color(0xFFEBE6FF).withOpacity(0.5), // pale lavender
                    const Color(0xFFF9F6F2).withOpacity(0.0),
                  ],
                  stops: const [0.0, 0.4, 1.0],
                ),
              ),
            ),
          ),
          
          Column(
            children: [
              // Header with back button
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),

              // Title Section
              const SizedBox(height: 20),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.pink.shade200.withOpacity(0.4), blurRadius: 20, spreadRadius: 2, offset: const Offset(0, 8))
                  ],
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Thick white interior to block the background
                      const Padding(
                        padding: EdgeInsets.only(bottom: 6),
                        child: Icon(Icons.chat_bubble, size: 40, color: Colors.white),
                      ),
                      // Outline icon
                      const Icon(Icons.chat_bubble_outline, size: 48, color: Colors.black87),
                      // The three dots inside
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Icon(Icons.more_horiz, size: 24, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Compliment Ideas',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 6),
              const Text(
                'pick one to make a great first impression',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // Categories List
              SizedBox(
                height: 44,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = category == selectedCategory;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFDF4A70) : Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey.shade800,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Compliments List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 100),
                  itemCount: complimentData[selectedCategory]?.length ?? 0,
                  itemBuilder: (context, index) {
                    final compliment = complimentData[selectedCategory]![index];
                    final isSelected = compliment == selectedCompliment;
                    
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCompliment = compliment;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.pink.shade50.withOpacity(0.5) : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: isSelected ? Border.all(color: Colors.pink.shade200, width: 1.5) : Border.all(color: Colors.transparent),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                compliment,
                                style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.4),
                              ),
                            ),
                            if (isSelected)
                              const Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Icon(Icons.check_circle, color: Color(0xFFDF4A70), size: 22),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // Bottom sticky button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color(0xFFF9F6F2),
                    const Color(0xFFF9F6F2).withOpacity(0.0),
                  ],
                  stops: const [0.7, 1.0],
                ),
              ),
              child: ElevatedButton(
                onPressed: selectedCompliment != null 
                    ? () => Navigator.pop(context, selectedCompliment)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDF4A70),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 5,
                  shadowColor: const Color(0xFFDF4A70).withOpacity(0.5),
                ),
                child: const Text(
                  'Use this compliment',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
