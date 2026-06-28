import 'dart:math';
import 'package:dating_app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.age,
    required super.imageUrl,
    required super.city,
    required super.state,
    required super.dob,
    required super.distanceKm,
    required super.matchPercentage,
    required super.trustPercentage,
    required super.replyTime,
    required super.profession,
    required super.height,
    required super.relationshipIntent,
    required super.isVerified,
    required super.about,
    required super.loveLanguage,
    required super.loveLanguageSub,
    required super.religion,
    required super.interestedIn,
    required super.zodiac,
    required super.zodiacSub,
    required super.motherTongue,
    required super.communicationStyle,
    required super.videoDuration,
    required super.promptQuestion,
    required super.promptAnswer,
    required super.education,
    required super.educationSub,
    required super.workAs,
    required super.workAsSub,
    required super.workStyle,
    required super.ambitionLevel,
    required super.bigDream,
    required super.secondPromptQuestion,
    required super.secondPromptAnswer,
    required super.thirdPromptQuestion,
    required super.thirdPromptAnswer,
    required super.interests,
    required super.diet,
    required super.drinking,
    required super.smoking,
    required super.fitness,
    required super.fitnessSub,
    required super.travel,
    required super.pets,
    required super.sleep,
    required super.datingGoal,
    required super.datingGoalSub,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final nameData = json['name'];
    final locationData = json['location'];
    final pictureData = json['picture'];
    final dobData = json['dob'];
    final loginData = json['login'];

    final random = Random();
    
    final professions = ['Fashion Designer', 'Content Creator', 'Software Engineer', 'Photographer', 'Artist'];
    final relationshipIntents = ['Serious relationship', 'Casual dating', 'Not sure yet', 'Marriage'];
    final replyTimes = ['~5m Reply', '~1h Reply', '~10m Reply'];
    final heights = ["5'2\" (157 cm)", "5'4\" (162 cm)", "5'5\" (165 cm)", "5'8\" (172 cm)", "6'0\" (182 cm)"];

    final aboutList = [
      "Building products by day, planning my next trek by night. Looking for someone equally driven and equally curious.",
      "Coffee enthusiast and dog lover. Let's explore the city together!",
      "I love reading, painting, and deep conversations at 2 AM. Seeking a genuine connection.",
    ];
    
    final zodiacs = [
      {'name': 'Scorpio', 'sub': 'Loyal - Passionate - Intuitive'},
      {'name': 'Leo', 'sub': 'Confident - Ambitious - Generous'},
      {'name': 'Aries', 'sub': 'Bold - Courageous - Energetic'},
    ];
    final selectedZodiac = zodiacs[random.nextInt(zodiacs.length)];

    final prompts = [
      {'q': 'The way to win me over is...', 'a': 'A good book rec and a strong chai opinion.'},
      {'q': 'My most irrational fear...', 'a': 'Accidentally swiping left on my soulmate.'},
      {'q': 'A shower thought I recently had...', 'a': 'Why do we park in driveways and drive on parkways?'},
      {'q': 'I\'ll know I\'ve found the one when...', 'a': 'We can sit in silence and it\'s not awkward.'},
      {'q': 'The dorkiest thing about me is...', 'a': 'I still play Pokemon Go on my daily walks.'},
      {'q': 'My simple pleasures...', 'a': 'Roadside chai after a long trek, no signal, good company.'},
      {'q': 'First round is on me if...', 'a': 'You can beat me at Mario Kart.'},
      {'q': 'We\'ll get along if...', 'a': 'You can debate me for an hour and still want dessert after.'},
    ];
    final shuffledPrompts = List.of(prompts)..shuffle();
    final selectedPrompt1 = shuffledPrompts[0];
    final selectedPrompt2 = shuffledPrompts[1];
    final selectedPrompt3 = shuffledPrompts[2];

    final videoDurations = ['0:15', '0:28', '0:45', '1:02', '0:33'];
    
    final bigDreams = [
      "Launch her own sustainable Indian fashion label — handcrafted, slow fashion made with heart. Also wants to travel every fashion capital before 30.",
      "Open a quaint little cafe in the mountains where people can read books and drink the best hot chocolate.",
      "Build a successful tech startup that genuinely helps people in their day-to-day lives.",
      "Write a bestselling novel and adopt at least three rescue dogs.",
    ];

    final educations = [
      {'inst': 'NIFT Pune', 'sub': 'B. Des Fashion Design - 3rd year'},
      {'inst': 'IIT Bombay', 'sub': 'B.Tech Computer Science - Alumni'},
      {'inst': 'Delhi University', 'sub': 'B.A. English Honors - 2nd year'},
      {'inst': 'Symbiosis', 'sub': 'MBA Marketing - Alumni'},
    ];
    final selectedEducation = educations[random.nextInt(educations.length)];

    final workStyles = ['Creative - Hybrid', 'Corporate - Office', 'Freelance - Remote', 'Startup - Hustle', 'Flexible - Remote'];
    final ambitionLevels = ['HIGHLY DRIVEN', 'BALANCED', 'CHILL', 'GOAL ORIENTED', 'PASSIONATE'];
    final workAsSubs = ['Freelance - 2 yrs exp', 'Full time - 4 yrs exp', 'Internship - 6 mos', 'Self employed', 'Part time'];

    final allInterests = [
      'Travel', 'Coffee', 'Trekking', 'Books', 'Yoga', 'Indie music', 'Cooking', 'Photography',
      'Gaming', 'Movies', 'Art', 'Dogs', 'Cats', 'Fitness'
    ];
    final shuffledInterests = List.of(allInterests)..shuffle();
    final userInterests = shuffledInterests.take(random.nextInt(3) + 6).toList();

    final diets = ['Vegetarian', 'Vegan', 'Pescatarian', 'Anything'];
    final drinks = ['Socially', 'Never', 'Often'];
    final smokes = ['Non-smoker', 'Socially', 'Regularly'];
    final fitnessLevels = ['Gym 4x/week', 'Active', 'Occasional', 'Couch potato'];
    final fitnessSubs = ['Yoga · Trekking', 'Running · Swimming', 'Cycling', 'Pilates'];
    final travels = ['4-5 trips/year', '1-2 trips/year', 'Constantly traveling', 'Homebody'];
    final petOptions = ['Cat parent', 'Dog parent', 'No pets', 'Want a dog'];
    final sleeps = ['Night Owl', 'Early Bird', 'Heavy Sleeper'];
    
    final datingGoals = [
      {'goal': 'Long-term, marriage-open', 'sub': 'No pressure, no timelines — just looking for the right person to build something real with.'},
      {'goal': 'Long-term partner', 'sub': 'Looking for someone to share a life with.'},
      {'goal': 'Still figuring it out', 'sub': 'Open to whatever happens naturally.'},
    ];
    final selectedDatingGoal = datingGoals[random.nextInt(datingGoals.length)];

    return UserModel(
      id: loginData['uuid'] ?? random.nextDouble().toString(),
      name: '${nameData['first']}',
      age: dobData['age'],
      imageUrl: pictureData['large'],
      city: locationData['city'] ?? 'Unknown',
      state: locationData['state'] ?? 'Unknown',
      dob: DateTime.parse(dobData['date']),
      distanceKm: random.nextInt(15) + 1,
      matchPercentage: random.nextInt(30) + 70,
      trustPercentage: random.nextInt(15) + 85,
      replyTime: replyTimes[random.nextInt(replyTimes.length)],
      profession: professions[random.nextInt(professions.length)],
      height: heights[random.nextInt(heights.length)],
      relationshipIntent: relationshipIntents[random.nextInt(relationshipIntents.length)],
      isVerified: random.nextDouble() > 0.3,
      about: aboutList[random.nextInt(aboutList.length)],
      loveLanguage: 'Compliment',
      loveLanguageSub: 'Words of affirmation',
      religion: 'Hindu-Marathi',
      interestedIn: 'Women - Dating',
      zodiac: selectedZodiac['name']!,
      zodiacSub: selectedZodiac['sub']!,
      motherTongue: 'Marathi',
      communicationStyle: 'Phone calls over texts',
      videoDuration: videoDurations[random.nextInt(videoDurations.length)],
      promptQuestion: selectedPrompt1['q']!,
      promptAnswer: selectedPrompt1['a']!,
      education: selectedEducation['inst']!,
      educationSub: selectedEducation['sub']!,
      workAs: professions[random.nextInt(professions.length)],
      workAsSub: workAsSubs[random.nextInt(workAsSubs.length)],
      workStyle: workStyles[random.nextInt(workStyles.length)],
      ambitionLevel: ambitionLevels[random.nextInt(ambitionLevels.length)],
      bigDream: bigDreams[random.nextInt(bigDreams.length)],
      secondPromptQuestion: selectedPrompt2['q']!,
      secondPromptAnswer: selectedPrompt2['a']!,
      thirdPromptQuestion: selectedPrompt3['q']!,
      thirdPromptAnswer: selectedPrompt3['a']!,
      interests: userInterests,
      diet: diets[random.nextInt(diets.length)],
      drinking: drinks[random.nextInt(drinks.length)],
      smoking: smokes[random.nextInt(smokes.length)],
      fitness: fitnessLevels[random.nextInt(fitnessLevels.length)],
      fitnessSub: fitnessSubs[random.nextInt(fitnessSubs.length)],
      travel: travels[random.nextInt(travels.length)],
      pets: petOptions[random.nextInt(petOptions.length)],
      sleep: sleeps[random.nextInt(sleeps.length)],
      datingGoal: selectedDatingGoal['goal']!,
      datingGoalSub: selectedDatingGoal['sub']!,
    );
  }
}
