import 'dart:convert';

class PermissionRequestingModel {
  String title;
  int icon;
  String message;
  String onSuccess;
  String onFailure;
  PermissionRequestingModel({
    this.title,
    this.icon,
    this.message,
    this.onSuccess,
    this.onFailure,
  });

  PermissionRequestingModel copyWith({
    String title,
    int icon,
    String message,
    String onSuccess,
    String onFailure,
  }) {
    return PermissionRequestingModel(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      message: message ?? this.message,
      onSuccess: onSuccess ?? this.onSuccess,
      onFailure: onFailure ?? this.onFailure,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'icon': icon.toString(),
      'message': message,
      'onSuccess': onSuccess,
      'onFailure': onFailure,
    };
  }

  factory PermissionRequestingModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return PermissionRequestingModel(
      title: map['title'],
      icon: int.parse(map['icon']),
      message: map['message'],
      onSuccess: map['onSuccess'],
      onFailure: map['onFailure'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PermissionRequestingModel.fromJson(String source) => PermissionRequestingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PermissionRequestingModel(title: $title, icon: $icon, message: $message, onSuccess: $onSuccess, onFailure: $onFailure)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is PermissionRequestingModel &&
      o.title == title &&
      o.icon == icon &&
      o.message == message &&
      o.onSuccess == onSuccess &&
      o.onFailure == onFailure;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      icon.hashCode ^
      message.hashCode ^
      onSuccess.hashCode ^
      onFailure.hashCode;
  }
}
