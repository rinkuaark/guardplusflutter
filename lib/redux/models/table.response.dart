class MainTableResponse {
  MainTableResponse({this.outputObj, this.error});

  List<TableValues> outputObj;
  String error;

  factory MainTableResponse.fromJson(Map<String, dynamic> json) =>
      MainTableResponse(
          outputObj: List<TableValues>.from(
              json["outputObj"].map((x) => TableValues.fromJson(x))),
          error: json['error']);

  Map<String, dynamic> toJson() => {
        "outputObj": List<dynamic>.from(outputObj.map((x) => x.toJson())),
      };
}

class TableValues {
  TableValues({
    this.gname,
    this.guardId,
    this.attended,
    this.missed,
  });

  String gname;
  int guardId;
  int attended;
  int missed;

  factory TableValues.fromJson(Map<String, dynamic> json) => TableValues(
        gname: json["gname"],
        guardId: json["guard_id"],
        attended: json["attended"],
        missed: json["missed"],
      );

  Map<String, dynamic> toJson() => {
        "gname": gname,
        "guard_id": guardId,
        "attended": attended,
        "missed": missed,
      };
}
