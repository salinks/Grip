class MyNotifications {
  Result? result;
  List<NotificationData>? data;

  MyNotifications({this.result, this.data});

  MyNotifications.fromJson(Map<String, dynamic> json) {
    result =
    json['Result'] != null ? new Result.fromJson(json['Result']) : null;
    if (json['Data'] != null) {
      data = <NotificationData>[];
      json['Data'].forEach((v) {
        data!.add(new NotificationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['Result'] = this.result!.toJson();
    }
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? statusCode;
  String? statusMessage;
  String? actionName;

  Result({this.statusCode, this.statusMessage, this.actionName});

  Result.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    statusMessage = json['StatusMessage'];
    actionName = json['ActionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StatusCode'] = this.statusCode;
    data['StatusMessage'] = this.statusMessage;
    data['ActionName'] = this.actionName;
    return data;
  }
}

class NotificationData {
  int? recID;
  String? nTitle;
  String? nDescription;
  int? mEMBERID;
  String? nTime;
  int? readStatus;

  NotificationData(
      {this.recID,
        this.nTitle,
        this.nDescription,
        this.mEMBERID,
        this.nTime,
        this.readStatus});

  NotificationData.fromJson(Map<String, dynamic> json) {
    recID = json['recID'];
    nTitle = json['nTitle'];
    nDescription = json['nDescription'];
    mEMBERID = json['MEMBER_ID'];
    nTime = json['nTime'];
    readStatus = json['readStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recID'] = this.recID;
    data['nTitle'] = this.nTitle;
    data['nDescription'] = this.nDescription;
    data['MEMBER_ID'] = this.mEMBERID;
    data['nTime'] = this.nTime;
    data['readStatus'] = this.readStatus;
    return data;
  }
}
