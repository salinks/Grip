
class CancelBookingResponse {
  Result? result;
  Null? data;

  CancelBookingResponse({this.result, this.data});

  CancelBookingResponse.fromJson(Map<String, dynamic> json) {
    result =
    json['Result'] != null ? Result.fromJson(json['Result']) : null;
    data = json['Data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (result != null) {
      data['Result'] = result!.toJson();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['StatusCode'] = statusCode;
    data['StatusMessage'] = statusMessage;
    data['ActionName'] = actionName;
    return data;
  }
}
