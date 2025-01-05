class NotificationModel {
  DateTime createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  String title;
  String content;
  String id;
  String? userId;
  String? leadingImage;

  NotificationModel({
    required this.createdAt,
    required this.title,
    required this.content,
    required this.id,
    this.userId,
    this.updatedAt,
    this.deletedAt,
    this.leadingImage,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt.toIso8601String();
    data['updatedAt'] = updatedAt?.toIso8601String();
    data['deletedAt'] = deletedAt?.toIso8601String();
    data['title'] = title;
    data['content'] = content;
    data['id'] = id;
    data['userId'] = userId;
    data['leadingImage'] = leadingImage;
    return data;
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        deletedAt: json['deletedAt'],
        title: json['title'],
        content: json['content'],
        id: json['id'],
        userId: json['userId'],
        leadingImage: json['leadingImage']);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NotificationModel &&
        other.id == id &&
        other.userId == userId &&
        other.title == title &&
        other.content == content &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      userId,
      title,
      content,
      createdAt,
      updatedAt,
      deletedAt,
    );
  }
}
