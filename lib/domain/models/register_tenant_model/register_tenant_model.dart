class RegisterTenantModel {
  final int tenantId;
  final String tenancyName;
  final String name;
  final String userName;
  final String emailAddress;
  final bool isTenantActive;
  final bool isActive;
  final bool isEmailConfirmationRequired;

  RegisterTenantModel(
      {required this.tenantId,
      required this.tenancyName,
      required this.name,
      required this.userName,
      required this.emailAddress,
      required this.isTenantActive,
      required this.isActive,
      required this.isEmailConfirmationRequired});

  factory RegisterTenantModel.fromJson(Map<String, dynamic> jsonData) {
    return RegisterTenantModel(
        tenantId: jsonData["tenantId"],
        tenancyName: jsonData["tenancyName"],
        name: jsonData["name"],
        userName: jsonData["userName"],
        emailAddress: jsonData["emailAddress"],
        isTenantActive: jsonData["isTenantActive"],
        isActive: jsonData["isActive"],
        isEmailConfirmationRequired: jsonData["isEmailConfirmationRequired"]);
  }
}
