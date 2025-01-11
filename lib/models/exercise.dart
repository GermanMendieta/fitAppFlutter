enum Complexity {
  easy,
  medium,
  hard,
}

class Exercise {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final String description;
  final String repetitions;
  final String sets;
  final int duration;
  final Complexity complexity;
  final bool isBeginnerFriendly;
  final bool isNoEquipmentNeeded;
  final bool isHighIntensity;
  final bool isLowImpact;

  const Exercise({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.repetitions,
    required this.sets,
    required this.duration,
    required this.complexity,
    required this.isBeginnerFriendly,
    required this.isNoEquipmentNeeded,
    required this.isHighIntensity,
    required this.isLowImpact,
  });
}
