import 'dart:convert';

import 'package:flutter_permission_using_bloc/helper/app_resource_constants.dart';

class PermissionRepository {
  bool isDenied;
  bool isGranted;
  bool isPermanentlyDenied;
  bool isUnknown;
  bool isReRequesting;
  String buttonText;
  String displayTitle;
  String displayMessage;

  PermissionRepository({
    this.isDenied,
    this.isGranted,
    this.isPermanentlyDenied,
    this.isUnknown,
    this.isReRequesting,
    this.buttonText,
    this.displayTitle,
    this.displayMessage,
  });

  PermissionRepository.granted()
      : this.isDenied = false,
        this.isGranted = true,
        this.isPermanentlyDenied = false,
        this.isUnknown = false,
        this.isReRequesting = false,
        this.buttonText = ResourceConstants.buttonTextSuccess,
        this.displayMessage = ResourceConstants.displayMessageSuccess,
        this.displayTitle = ResourceConstants.titleDefault;

  PermissionRepository.denied()
      : this.isDenied = true,
        this.isGranted = false,
        this.isPermanentlyDenied = false,
        this.isUnknown = false,
        this.isReRequesting = false,
        this.buttonText = ResourceConstants.buttonTextDefault,
        this.displayMessage =
        ResourceConstants.displayMessageDenied,
        this.displayTitle = ResourceConstants.titleDefault;

  PermissionRepository.permanentlyDenied()
      : this.isDenied = false,
        this.isGranted = false,
        this.isPermanentlyDenied = true,
        this.isUnknown = false,
        this.isReRequesting = false,
        this.buttonText = ResourceConstants.buttonTextPermanentlyDenied,
        this.displayMessage =
        ResourceConstants.displayMessagePermanentlydenied,
        this.displayTitle = ResourceConstants.titleDefault;

  PermissionRepository.unknown()
      : this.isDenied = false,
        this.isGranted = false,
        this.isPermanentlyDenied = false,
        this.isUnknown = true,
        this.isReRequesting = false,
        this.buttonText = ResourceConstants.buttonTextDefault,
        this.displayMessage =ResourceConstants.displayMessageDefault,
        this.displayTitle = ResourceConstants.titleDefault;

  PermissionRepository.waiting()
      : this.isDenied = false,
        this.isGranted = false,
        this.isPermanentlyDenied = false,
        this.isUnknown = false,
        this.isReRequesting = false,
        this.buttonText = ResourceConstants.buttonTextDefault,
        this.displayMessage =ResourceConstants.displayMessageDefault,
        this.displayTitle = ResourceConstants.titleDefault;

  PermissionRepository.reRequesting()
      : this.isDenied = false,
        this.isGranted = false,
        this.isPermanentlyDenied = false,
        this.isUnknown = false,
        this.isReRequesting = true,
        this.buttonText = ResourceConstants.buttonTextDefault,
        this.displayMessage =ResourceConstants.displayMessageDefault,
        this.displayTitle = ResourceConstants.titleDefault;

  @override
  String toString() {
    return 'PermissionRepository(isDenied: $isDenied, isGranted: $isGranted, isPermanentlyDenied: $isPermanentlyDenied, isUnknown: $isUnknown, isReRequesting: $isReRequesting, buttonText: $buttonText, displayTitle: $displayTitle, displayMessage: $displayMessage)';
  }

  PermissionRepository copyWith({
    bool isDenied,
    bool isGranted,
    bool isPermanentlyDenied,
    bool isUnknown,
    bool isReRequesting,
    String buttonText,
    String displayTitle,
    String displayMessage,
  }) {
    return PermissionRepository(
      isDenied: isDenied ?? this.isDenied,
      isGranted: isGranted ?? this.isGranted,
      isPermanentlyDenied: isPermanentlyDenied ?? this.isPermanentlyDenied,
      isUnknown: isUnknown ?? this.isUnknown,
      isReRequesting: isReRequesting ?? this.isReRequesting,
      buttonText: buttonText ?? this.buttonText,
      displayTitle: displayTitle ?? this.displayTitle,
      displayMessage: displayMessage ?? this.displayMessage,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PermissionRepository &&
        o.isDenied == isDenied &&
        o.isGranted == isGranted &&
        o.isPermanentlyDenied == isPermanentlyDenied &&
        o.isUnknown == isUnknown &&
        o.isReRequesting == isReRequesting &&
        o.buttonText == buttonText &&
        o.displayTitle == displayTitle &&
        o.displayMessage == displayMessage;
  }

  @override
  int get hashCode {
    return isDenied.hashCode ^
    isGranted.hashCode ^
    isPermanentlyDenied.hashCode ^
    isUnknown.hashCode ^
    isReRequesting.hashCode ^
    buttonText.hashCode ^
    displayTitle.hashCode ^
    displayMessage.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'isDenied': isDenied,
      'isGranted': isGranted,
      'isPermanentlyDenied': isPermanentlyDenied,
      'isUnknown': isUnknown,
      'isReRequesting': isReRequesting,
      'buttonText': buttonText,
      'displayTitle': displayTitle,
      'displayMessage': displayMessage,
    };
  }

  factory PermissionRepository.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PermissionRepository(
      isDenied: map['isDenied'],
      isGranted: map['isGranted'],
      isPermanentlyDenied: map['isPermanentlyDenied'],
      isUnknown: map['isUnknown'],
      isReRequesting: map['isReRequesting'],
      buttonText: map['buttonText'],
      displayTitle: map['displayTitle'],
      displayMessage: map['displayMessage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PermissionRepository.fromJson(String source) =>
      PermissionRepository.fromMap(json.decode(source));
}
