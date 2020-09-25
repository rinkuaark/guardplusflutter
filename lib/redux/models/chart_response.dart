class GuardAlarmResponse {
  GuardAlarmResponse({this.outputObj, this.error});

  GuardAlarmInfo outputObj;
  String error;

  factory GuardAlarmResponse.fromJson(Map<String, dynamic> json) =>
      GuardAlarmResponse(
          outputObj: GuardAlarmInfo.fromJson(json["outputObj"]),
          error: json['error']);

  Map<String, dynamic> toJson() => {
        "outputObj": outputObj.toJson(),
      };
}

class GuardAlarmInfo {
  GuardAlarmInfo({
    this.att,
    this.miss,
  });

  List<Att> att;
  List<Miss> miss;

  factory GuardAlarmInfo.fromJson(Map<String, dynamic> json) => GuardAlarmInfo(
        att: List<Att>.from(json["att"].map((x) => Att.fromJson(x))),
        miss: List<Miss>.from(json["miss"].map((x) => Miss.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "att": List<dynamic>.from(att.map((x) => x.toJson())),
        "miss": List<dynamic>.from(miss.map((x) => x.toJson())),
      };
}

class Att {
  Att({
    this.gname,
    this.guardId,
    this.attended,
  });

  String gname;
  int guardId;
  int attended;

  factory Att.fromJson(Map<String, dynamic> json) => Att(
        gname: json["gname"],
        guardId: json["guard_id"],
        attended: json["attended"],
      );

  Map<String, dynamic> toJson() => {
        "gname": gname,
        "guard_id": guardId,
        "attended": attended,
      };
}

class Miss {
  Miss({
    this.gname,
    this.guardId,
    this.missed,
  });

  String gname;
  int guardId;
  int missed;

  factory Miss.fromJson(Map<String, dynamic> json) => Miss(
        gname: json["gname"],
        guardId: json["guard_id"],
        missed: json["missed"],
      );

  Map<String, dynamic> toJson() => {
        "gname": gname,
        "guard_id": guardId,
        "missed": missed,
      };
}
