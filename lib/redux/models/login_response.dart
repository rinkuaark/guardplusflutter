class OutputObj {
  OutputObj({this.outputObj, this.error});

  LoginResponse outputObj;
  String error;
  factory OutputObj.fromJson(Map<String, dynamic> json) => OutputObj(
      outputObj: json["outputObj"] != null
          ? LoginResponse.fromJson(json["outputObj"])
          : null,
      error: json["error"]);

  Map<String, dynamic> toJson() => {
        "outputObj": outputObj.toJson(),
      };
}

class LoginResponse {
  int admin_id;
  String admin_token;
  LoginResponse({this.admin_id, this.admin_token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        admin_id: json["admin_id"],
        admin_token: json["admin_token"],
      );

  Map<String, dynamic> toJson() => {
        "admin_id": admin_id,
        "admin_token": admin_token,
      };
}
