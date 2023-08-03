class AvailableScheduleResponse {
  Result? result;
  List<ScheduleData>? data;

  AvailableScheduleResponse({this.result, this.data});

  AvailableScheduleResponse.fromJson(Map<String, dynamic> json) {
    result =
    json['Result'] != null ? Result.fromJson(json['Result']) : null;
    if (json['Data'] != null) {
      data = <ScheduleData>[];
      json['Data'].forEach((v) {
        data!.add(ScheduleData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (result != null) {
      data['Result'] = result!.toJson();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['StatusCode'] = statusCode;
    data['StatusMessage'] = statusMessage;
    data['ActionName'] = actionName;
    return data;
  }
}

class ScheduleData {
  Object? rowCheck;
  Object? cLASSSCHEDULEID;
  Object? dATE;
  Object? scheduleDescription;
  Object? trinerName;
  Object? seatCapacity;
  Object? aGENDAID;
  Object? aGENDANAME;
  Object? timeSlotID;
  Object? timeSlot;
  Object? pACKAGEID;
  Object? pACKAGENAME;
  Object? isClass;
  Object? noOfMember;
  Object? noOfSession;
  Object? validityInDays;
  Object? maxFreezeDays;
  Object? packageRegId;
  Object? memberId;

  ScheduleData(
      {this.rowCheck,
        this.cLASSSCHEDULEID,
        this.dATE,
        this.scheduleDescription,
        this.trinerName,
        this.seatCapacity,
        this.aGENDAID,
        this.aGENDANAME,
        this.timeSlotID,
        this.timeSlot,
        this.pACKAGEID,
        this.pACKAGENAME,
        this.isClass,
        this.noOfMember,
        this.noOfSession,
        this.validityInDays,
        this.maxFreezeDays,
        this.packageRegId,
        this.memberId});

  ScheduleData.fromJson(Map<String, dynamic> json) {
    rowCheck = json['RowCheck'];
    cLASSSCHEDULEID = json['CLASS_SCHEDULE_ID'];
    dATE = json['DATE'];
    scheduleDescription = json['ScheduleDescription'];
    trinerName = json['TrinerName'];
    seatCapacity = json['SeatCapacity'];
    aGENDAID = json['AGENDA_ID'];
    aGENDANAME = json['AGENDA_NAME'];
    timeSlotID = json['TimeSlot_ID'];
    timeSlot = json['TimeSlot'];
    pACKAGEID = json['PACKAGE_ID'];
    pACKAGENAME = json['PACKAGE_NAME'];
    isClass = json['IsClass'];
    noOfMember = json['NoOfMember'];
    noOfSession = json['NoOfSession'];
    validityInDays = json['ValidityInDays'];
    maxFreezeDays = json['MaxFreezeDays'];
    packageRegId = json['PackageRegId'];
    memberId = json['MemberId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['RowCheck'] = rowCheck;
    data['CLASS_SCHEDULE_ID'] = cLASSSCHEDULEID;
    data['DATE'] = dATE;
    data['ScheduleDescription'] = scheduleDescription;
    data['TrinerName'] = trinerName;
    data['SeatCapacity'] = seatCapacity;
    data['AGENDA_ID'] = aGENDAID;
    data['AGENDA_NAME'] = aGENDANAME;
    data['TimeSlot_ID'] = timeSlotID;
    data['TimeSlot'] = timeSlot;
    data['PACKAGE_ID'] = pACKAGEID;
    data['PACKAGE_NAME'] = pACKAGENAME;
    data['IsClass'] = isClass;
    data['NoOfMember'] = noOfMember;
    data['NoOfSession'] = noOfSession;
    data['ValidityInDays'] = validityInDays;
    data['MaxFreezeDays'] = maxFreezeDays;
    data['PackageRegId'] = packageRegId;
    data['MemberId'] = memberId;
    return data;
  }
}
