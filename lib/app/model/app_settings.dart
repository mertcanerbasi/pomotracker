class ApplicationSettings {
  String? languageCode;

  String? colorTheme;

  ApplicationSettings({
    this.languageCode,
    this.colorTheme,
  });

  ApplicationSettings copyWith({
    String? languageCode,
    bool? onBoarded,
    String? colorTheme,
  }) {
    return ApplicationSettings(
      languageCode: languageCode ?? this.languageCode,
      colorTheme: colorTheme ?? this.colorTheme,
    );
  }

  //to Json
  Map<String, dynamic> toJson() {
    return {
      'languageCode': languageCode,
      'colorTheme': colorTheme,
    };
  }

  //from Json
  factory ApplicationSettings.fromJson(Map<String, dynamic> json) {
    return ApplicationSettings(
      languageCode: json['languageCode'],
      colorTheme: json['colorTheme'],
    );
  }
}
