



class ForgotPasswordResponse {
  String? statusCode;
  String? statusMessage;
  String? actionName;

  ForgotPasswordResponse(
      {this.statusCode, this.statusMessage, this.actionName});

  ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['Status Code'];
    statusMessage = json['Status Message'];
    actionName = json['Action Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status Code'] = statusCode;
    data['Status Message'] = statusMessage;
    data['Action Name'] = actionName;
    return data;
  }
}
