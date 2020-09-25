class LogoutResponse {
  LogoutResponse({
    this.outputObj,
    this.error,
  });

  String outputObj;
  String error;

  factory LogoutResponse.fromJson(Map<String, dynamic> json) => LogoutResponse(
        outputObj: json["outputObj"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "outputObj": outputObj,
        "error": error,
      };
}
