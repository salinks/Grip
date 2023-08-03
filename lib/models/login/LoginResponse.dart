class LoginResponse {
  Result? result;
  List<Data>? data;

  LoginResponse({this.result, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    result =
    json['Result'] != null ? new Result.fromJson(json['Result']) : null;
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? memberID;
  String? firstName;
  String? email;
  String? webLoginId;
  String? webLoginPassword;

  Data(
      {this.memberID,
        this.firstName,
        this.email,
        this.webLoginId,
        this.webLoginPassword});

  Data.fromJson(Map<String, dynamic> json) {
    memberID = json['MEMBER_ID'];
    firstName = json['FirstName'];
    email = json['Email'];
    webLoginId = json['WebLoginId'];
    webLoginPassword = json['WebLoginPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MEMBER_ID'] = this.memberID;
    data['FirstName'] = this.firstName;
    data['Email'] = this.email;
    data['WebLoginId'] = this.webLoginId;
    data['WebLoginPassword'] = this.webLoginPassword;
    return data;
  }
}
