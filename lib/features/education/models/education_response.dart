import 'dart:convert';

class EducationResponse {
  final String id;
  final String title;
  final String category;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  const EducationResponse({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EducationResponse.fromMap(Map<String, dynamic> map) {
    return EducationResponse(
      id: map['id']?.toString() ?? '',
      title: map['title'] ?? '',
      category: map['category'] ?? '',
      description: map['description'] ?? '',
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(map['updatedAt'] ?? '') ??
          DateTime.now(),
    );
  }

  factory EducationResponse.fromJson(String source) =>
      EducationResponse.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  String toJson() => json.encode(toMap());

  EducationResponse copyWith({
    String? id,
    String? title,
    String? category,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EducationResponse(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}