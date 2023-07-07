class CommonResponse {
  String? statusCode;
  String? statusMessage;
  String? actionName;

  CommonResponse({this.statusCode, this.statusMessage, this.actionName});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['Status Code'];
    statusMessage = json['Status Message'];
    actionName = json['Action Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status Code'] = this.statusCode;
    data['Status Message'] = this.statusMessage;
    data['Action Name'] = this.actionName;
    return data;
  }
}
