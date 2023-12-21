class LoginInfoModel {
  final User? user;
  final Tenant? tenant;

  LoginInfoModel({required this.user, required this.tenant});

  factory LoginInfoModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginInfoModel(
      user: jsonData["user"] != null ? User.fromJson(jsonData["user"]) : null,
      tenant: jsonData["tenant"] != null
          ? Tenant.fromJson(jsonData["tenant"])
          : null,
    );
  }
}

class User {
  final String name;
  final String surName;
  final String userName;
  final String emailAddress;
  final String? profilePictureUrl;
  final bool allowSetPassword;
  final int userType;
  final String userToken;
  final String? lastSeen;
  final String? title;
  final List<dynamic> roles;
  final int id;

  User({
    required this.name,
    required this.surName,
    required this.userName,
    required this.emailAddress,
    required this.profilePictureUrl,
    required this.allowSetPassword,
    required this.userType,
    required this.userToken,
    required this.lastSeen,
    required this.title,
    required this.roles,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
        name: jsonData["name"],
        surName: jsonData["surname"],
        userName: jsonData["userName"],
        emailAddress: jsonData["emailAddress"],
        profilePictureUrl: jsonData["profilePictureUrl"],
        allowSetPassword: jsonData["allowSetPassword"],
        userType: jsonData["userType"],
        userToken: jsonData["userToken"],
        lastSeen: jsonData["lastSeen"],
        title: jsonData["title"],
        roles: jsonData["roles"],
        id: jsonData["id"]);
  }
}

class Tenant {
  final String tenancyName;
  final String name;
  final int ownerId;
  final String logoUrl;
  final String waterMarkUrl;
  final String creationTime;

  final Edition edition;

  Tenant({
    required this.tenancyName,
    required this.name,
    required this.ownerId,
    required this.logoUrl,
    required this.waterMarkUrl,
    required this.creationTime,
    required this.edition,
  });
  factory Tenant.fromJson(Map<String, dynamic> jsonData) {
    return Tenant(
      tenancyName: jsonData["tenancyName"],
      name: jsonData["name"],
      ownerId: jsonData["ownerId"],
      logoUrl: jsonData["logoUrl"],
      waterMarkUrl: jsonData["watermarkUrl"],
      creationTime: jsonData["creationTime"],
      edition: Edition.fromJson(jsonData["edition"]),
    );
  }
}

class Edition {
  final String name;
  final String displayName;
  final int type;
  final int id;

  Edition(
      {required this.name,
      required this.displayName,
      required this.type,
      required this.id});

  factory Edition.fromJson(Map<String, dynamic> jsonData) {
    return Edition(
      name: jsonData["name"],
      displayName: jsonData["displayName"],
      type: jsonData["type"],
      id: jsonData["id"],
    );
  }
}
