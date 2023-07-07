class LoginResponse {
  String? statusCode;
  String? statusMessage;
  String? actionName;

  LoginResponse({this.statusCode, this.statusMessage, this.actionName});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['Status Code'];
    statusMessage = json['Status Message'];
    actionName = json['Action Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Status Code'] = statusCode;
    data['Status Message'] = statusMessage;
    data['Action Name'] = actionName;
    return data;
  }
}