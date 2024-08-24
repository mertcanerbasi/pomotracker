class ApplicationSettings {
  String? languageCode;
  bool onBoarded;
  String? colorTheme;

  ApplicationSettings({
    this.languageCode,
    this.onBoarded = false,
    this.colorTheme,
  });

  ApplicationSettings copyWith({
    String? languageCode,
    bool? onBoarded,
    String? colorTheme,
  }) {
    return ApplicationSettings(
      languageCode: languageCode ?? this.languageCode,
      onBoarded: onBoarded ?? this.onBoarded,
      colorTheme: colorTheme ?? this.colorTheme,
    );
  }

  //to Json
  Map<String, dynamic> toJson() {
    return {
      'languageCode': languageCode,
      'onBoarded': onBoarded,
      'colorTheme': colorTheme,
    };
  }

  //from Json
  factory ApplicationSettings.fromJson(Map<String, dynamic> json) {
    return ApplicationSettings(
      languageCode: json['languageCode'],
      onBoarded: json['onBoarded'],
      colorTheme: json['colorTheme'],
    );
  }
}
