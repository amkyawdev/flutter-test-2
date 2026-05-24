class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String link;
  final List<String> techStack;
  final DateTime createdAt;

  Project({
    required this.title,
    required this.description,
    this.imageUrl = '',
    this.link = '',
    required this.techStack,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      link: json['link'] ?? '',
      techStack: List<String>.from(json['techStack'] ?? []),
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt']) 
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'link': link,
      'techStack': techStack,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}