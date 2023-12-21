class EditionModel {
  final String displayName;
  final bool isRegistrable;
  final double? annualPrice;
  final bool hasTrial;
  final bool? isMostPopular;
  final int id;

  EditionModel({
    required this.displayName,
    required this.isRegistrable,
    required this.annualPrice,
    required this.hasTrial,
    required this.isMostPopular,
    required this.id,
  });

  factory EditionModel.fromJson(Map<String, dynamic> jsonData) => EditionModel(
        displayName: jsonData['displayName'],
        isRegistrable: jsonData['isRegistrable'],
        annualPrice: jsonData['annualPrice'],
        hasTrial: jsonData['hasTrial'],
        isMostPopular: jsonData['isMostPopular'],
        id: jsonData['id'],
      );
}
