class PasswordComplexityModel {
  final bool requireDigit;
  final bool requireLowercase;
  final bool requireNonAlphanumeric;
  final bool requireUppercase;
  final int requiredLength;

  PasswordComplexityModel({
    required this.requireDigit,
    required this.requireLowercase,
    required this.requireNonAlphanumeric,
    required this.requireUppercase,
    required this.requiredLength,
  });

  factory PasswordComplexityModel.fromJson(Map<String, dynamic> jsonData) {
    return PasswordComplexityModel(
      requireDigit: jsonData['requireDigit'],
      requireLowercase: jsonData['requireLowercase'],
      requireNonAlphanumeric: jsonData['requireNonAlphanumeric'],
      requireUppercase: jsonData['requireUppercase'],
      requiredLength: jsonData['requiredLength'],
    );
  }
}
