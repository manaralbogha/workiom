class IsTenantAvailableModel {
  final int state;
  final int? stattenantIde;
  final String? serverRootAddress;

  IsTenantAvailableModel({
    required this.state,
    required this.stattenantIde,
    required this.serverRootAddress,
  });

  factory IsTenantAvailableModel.fromJson(Map<String, dynamic> jsonData) {
    return IsTenantAvailableModel(
        state: jsonData["state"],
        stattenantIde: jsonData["stattenantIde"],
        serverRootAddress: jsonData["serverRootAddress"]);
  }
}
