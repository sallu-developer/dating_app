import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final int age;
  final String imageUrl;
  final String city;
  final String state;
  final DateTime dob;
  // Mocked fields for UI based on design
  final int distanceKm;
  final int matchPercentage;
  final int trustPercentage;
  final String replyTime;
  final String profession;
  final String height;
  final String relationshipIntent;
  final bool isVerified;
  
  // New detailed fields
  final String about;
  final String loveLanguage;
  final String loveLanguageSub;
  final String religion;
  final String interestedIn;
  final String zodiac;
  final String zodiacSub;
  final String motherTongue;
  final String communicationStyle;
  
  // Extra sections
  final String videoDuration;
  final String promptQuestion;
  final String promptAnswer;
  final String education;
  final String educationSub;
  final String workAs;
  final String workAsSub;
  final String workStyle;
  final String ambitionLevel;
  final String bigDream;
  final String secondPromptQuestion;
  final String secondPromptAnswer;
  final String thirdPromptQuestion;
  final String thirdPromptAnswer;
  final List<String> interests;
  final String diet;
  final String drinking;
  final String smoking;
  final String fitness;
  final String fitnessSub;
  final String travel;
  final String pets;
  final String sleep;
  final String datingGoal;
  final String datingGoalSub;

  const UserEntity({
    required this.id,
    required this.name,
    required this.age,
    required this.imageUrl,
    required this.city,
    required this.state,
    required this.dob,
    required this.distanceKm,
    required this.matchPercentage,
    required this.trustPercentage,
    required this.replyTime,
    required this.profession,
    required this.height,
    required this.relationshipIntent,
    required this.isVerified,
    required this.about,
    required this.loveLanguage,
    required this.loveLanguageSub,
    required this.religion,
    required this.interestedIn,
    required this.zodiac,
    required this.zodiacSub,
    required this.motherTongue,
    required this.communicationStyle,
    required this.videoDuration,
    required this.promptQuestion,
    required this.promptAnswer,
    required this.education,
    required this.educationSub,
    required this.workAs,
    required this.workAsSub,
    required this.workStyle,
    required this.ambitionLevel,
    required this.bigDream,
    required this.secondPromptQuestion,
    required this.secondPromptAnswer,
    required this.thirdPromptQuestion,
    required this.thirdPromptAnswer,
    required this.interests,
    required this.diet,
    required this.drinking,
    required this.smoking,
    required this.fitness,
    required this.fitnessSub,
    required this.travel,
    required this.pets,
    required this.sleep,
    required this.datingGoal,
    required this.datingGoalSub,
  });

  @override
  List<Object?> get props => [
    id, name, age, imageUrl, city, state, dob, distanceKm, matchPercentage, 
    trustPercentage, replyTime, profession, height, relationshipIntent, isVerified,
    about, loveLanguage, loveLanguageSub, religion, interestedIn, zodiac, zodiacSub,
    motherTongue, communicationStyle, videoDuration, promptQuestion, promptAnswer,
    education, educationSub, workAs, workAsSub, workStyle, ambitionLevel, bigDream,
    secondPromptQuestion, secondPromptAnswer, thirdPromptQuestion, thirdPromptAnswer,
    interests, diet, drinking, smoking, fitness, fitnessSub, travel, pets, sleep, 
    datingGoal, datingGoalSub,
  ];
}
