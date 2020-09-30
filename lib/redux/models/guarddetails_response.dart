class GuardDetailsResponse {
  GuardDetailsResponse({this.outputObj, this.error});

  GuardDetail outputObj;
  String error;

  factory GuardDetailsResponse.fromJson(Map<String, dynamic> json) =>
      GuardDetailsResponse(
          outputObj: GuardDetail.fromJson(json["outputObj"]),
          error: json["error"]);

  Map<String, dynamic> toJson() => {
        "outputObj": outputObj.toJson(),
      };
}

class GuardDetail {
  GuardDetail({
    this.gname,
    this.attended,
    this.missed,
    this.alarms,
  });

  String gname;
  int attended;
  int missed;
  List<Alarm> alarms;

  factory GuardDetail.fromJson(Map<String, dynamic> json) => GuardDetail(
        gname: json["gname"],
        attended: json["attended"],
        missed: json["missed"],
        alarms: List<Alarm>.from(json["alarms"].map((x) => Alarm.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "gname": gname,
        "attended": attended,
        "missed": missed,
        "alarms": List<dynamic>.from(alarms.map((x) => x.toJson())),
      };
}

class Alarm {
  String alarmtime;
  String status;

  Alarm({this.alarmtime, this.status});

  Alarm.fromJson(Map<String, dynamic> json) {
    alarmtime = json['alarmtime'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alarmtime'] = this.alarmtime;
    data['status'] = this.status;
    return data;
  }
}
