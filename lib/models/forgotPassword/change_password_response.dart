class ChangePasswordResponse {
  Result? result;
  Null? data;

  ChangePasswordResponse({this.result, this.data});

  ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    result =
    json['Result'] != null ? new Result.fromJson(json['Result']) : null;
    data = json['Data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['Result'] = this.result!.toJson();
    }
    data['Data'] = this.data;
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
