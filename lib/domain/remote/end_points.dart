abstract class EndPoints {
  static const getCurrentLoginInformationEndPoint =
      "api/services/app/Session/GetCurrentLoginInformations";

  static const getEditionsForSelectEndPoint =
      "api/services/app/TenantRegistration/GetEditionsForSelect";

  static const getPasswordComplexitySettingEndPoint =
      "api/services/app/Profile/GetPasswordComplexitySetting";
  static const isTenantAvailableEndPoint =
      "api/services/app/Account/IsTenantAvailable";
  static const registerTenantEndPoint =
      "api/services/app/TenantRegistration/RegisterTenant";
}
