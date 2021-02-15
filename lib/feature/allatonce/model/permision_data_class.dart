class PermissionRepository {
  CommonData camera;
  CommonData location;
  CommonData storage;

  PermissionRepository({
    this.camera,
    this.location,
    this.storage,
  });

  PermissionRepository.fromJson(Map<String, dynamic> json) {
    camera =
        json['camera'] != null ? new CommonData.fromJson(json['camera']) : null;
    location =
        json['location'] != null ? new CommonData.fromJson(json['location']) : null;
    storage =
        json['storage'] != null ? new CommonData.fromJson(json['storage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.camera != null) {
      data['camera'] = this.camera.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.storage != null) {
      data['storage'] = this.storage.toJson();
    }
    return data;
  }

  PermissionRepository copyWith({
    CommonData camera,
    CommonData location,
    CommonData storage,
  }) {
    return PermissionRepository(
      camera: camera ?? this.camera,
      location: location ?? this.location,
      storage: storage ?? this.storage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'camera': camera?.toMap(),
      'location': location?.toMap(),
      'storage': storage?.toMap(),
    };
  }

  factory PermissionRepository.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return PermissionRepository(
      camera: CommonData.fromMap(map['camera']),
      location: CommonData.fromMap(map['location']),
      storage: CommonData.fromMap(map['storage']),
    );
  }
  @override
  String toString() => 'PermissionRepository(camera: $camera, location: $location, storage: $storage)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is PermissionRepository &&
      o.camera == camera &&
      o.location == location &&
      o.storage == storage;
  }

  @override
  int get hashCode => camera.hashCode ^ location.hashCode ^ storage.hashCode;
}

class CommonData {
  String title;
  String icon;
  String description;
  String buttonText;
  String errorMessage;

  CommonData([
    this.title,
    this.icon,
    this.description,
    this.buttonText,
    this.errorMessage
  ]);

  CommonData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    description = json['description'];
    buttonText = json['buttonText'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['description'] = this.description;
    data['buttonText'] = this.buttonText;
    data['errorMessage'] = this.errorMessage;
    return data;
  }

  CommonData copyWith({
    String title,
    String icon,
    String description,
    String buttonText,
    String errorMessage,
  }) {
    return CommonData(
      title ?? this.title,
      icon ?? this.icon,
      description ?? this.description,
      buttonText ?? this.buttonText,
      errorMessage ?? this.errorMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'icon': icon,
      'description': description,
      'buttonText': buttonText,
      'errorMessage': errorMessage,
    };
  }

  factory CommonData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return CommonData(
      map['title'],
      map['icon'],
      map['description'],
      map['buttonText'],
      map['errorMessage'],
    );
  }

  @override
  String toString() {
    return 'CommonData(title: $title, icon: $icon, description: $description, buttonText: $buttonText, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is CommonData &&
      o.title == title &&
      o.icon == icon &&
      o.description == description &&
      o.buttonText == buttonText &&
      o.errorMessage == errorMessage;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      icon.hashCode ^
      description.hashCode ^
      buttonText.hashCode ^
      errorMessage.hashCode;
  }
}
