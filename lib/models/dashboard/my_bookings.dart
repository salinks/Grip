

class MyBookingResponse {
  Result? result;
  List<BookingData>? bookingData;

  MyBookingResponse({this.result, this.bookingData});

  MyBookingResponse.fromJson(Map<String, dynamic> json) {
    result =
    json['Result'] != null ?  Result.fromJson(json['Result']) : null;
    if (json['Data'] != null) {
      bookingData = <BookingData>[];
      json['Data'].forEach((v) {
        bookingData!.add( BookingData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.result != null) {
      data['Result'] = this.result!.toJson();
    }
    if (this.bookingData != null) {
      data['Data'] = this.bookingData!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['StatusCode'] = this.statusCode;
    data['StatusMessage'] = this.statusMessage;
    data['ActionName'] = this.actionName;
    return data;
  }
}

class BookingData {
  Object? bookingId;
  Object? bookingDate;
  Object? cLASSSCHEDULEID;
  Object? packageRegId;
  Object? bookingMemberId;
  Object? isDeleted;
  Object? deletedBy;
  Object? deletedDate;
  Object? date;
  Object? description;
  Object? isClass;
  Object? timeSlotID;
  Object? tRAINERID;
  Object? aGENDAID;
  Object? seatCapacity;
  Object? registrationDate;
  Object? packageId;
  Object? amount;
  Object? discPercentage;
  Object? discAmount;
  Object? taxPercentage;
  Object? taxAmount;
  Object? netAmount;
  Object? startDate;
  Object? endDate;
  Object? extendedEndDate;
  Object? pACKAGEID;
  Object? pACKAGENAME;
  Object? noOfMember;
  Object? noOfSession;
  Object? validityInDays;
  Object? packageAmount;
  Object? isIncludeVAT;
  Object? maxFreezeDays;
  Object? maxFreezeTimes;
  Object? maxNoOfInstallment;
  Object? isInstallment;
  Object? memberId;
  Object? firstName;
  Object? email;
  Object? telephone;
  Object? timeFrom;
  Object? timeFromAMPM;
  Object? timeTo;
  Object? timeToAMPM;
  Object? timeSlot;
  Object? aGENDANAME;
  Object? employeeFirstName;

  BookingData(
      {this.bookingId,
        this.bookingDate,
        this.cLASSSCHEDULEID,
        this.packageRegId,
        this.bookingMemberId,
        this.isDeleted,
        this.deletedBy,
        this.deletedDate,
        this.date,
        this.description,
        this.isClass,
        this.timeSlotID,
        this.tRAINERID,
        this.aGENDAID,
        this.seatCapacity,
        this.registrationDate,
        this.packageId,
        this.amount,
        this.discPercentage,
        this.discAmount,
        this.taxPercentage,
        this.taxAmount,
        this.netAmount,
        this.startDate,
        this.endDate,
        this.extendedEndDate,
        this.pACKAGEID,
        this.pACKAGENAME,
        this.noOfMember,
        this.noOfSession,
        this.validityInDays,
        this.packageAmount,
        this.isIncludeVAT,
        this.maxFreezeDays,
        this.maxFreezeTimes,
        this.maxNoOfInstallment,
        this.isInstallment,
        this.memberId,
        this.firstName,
        this.email,
        this.telephone,
        this.timeFrom,
        this.timeFromAMPM,
        this.timeTo,
        this.timeToAMPM,
        this.timeSlot,
        this.aGENDANAME,
        this.employeeFirstName});

  BookingData.fromJson(Map<String, dynamic> json) {
    bookingId = json['BookingId'];
    bookingDate = json['BookingDate'];
    cLASSSCHEDULEID = json['CLASS_SCHEDULE_ID'];
    packageRegId = json['PackageRegId'];
    bookingMemberId = json['BookingMemberId'];
    isDeleted = json['IsDeleted'];
    deletedBy = json['DeletedBy'];
    deletedDate = json['DeletedDate'];
    date = json['Date'];
    description = json['Description'];
    isClass = json['IsClass'];
    timeSlotID = json['TimeSlot_ID'];
    tRAINERID = json['TRAINER_ID'];
    aGENDAID = json['AGENDA_ID'];
    seatCapacity = json['SeatCapacity'];
    registrationDate = json['RegistrationDate'];
    packageId = json['PackageId'];
    amount = json['Amount'];
    discPercentage = json['DiscPercentage'];
    discAmount = json['DiscAmount'];
    taxPercentage = json['TaxPercentage'];
    taxAmount = json['TaxAmount'];
    netAmount = json['NetAmount'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    extendedEndDate = json['ExtendedEndDate'];
    pACKAGEID = json['PACKAGE_ID'];
    pACKAGENAME = json['PACKAGE_NAME'];
    noOfMember = json['NoOfMember'];
    noOfSession = json['NoOfSession'];
    validityInDays = json['ValidityInDays'];
    packageAmount = json['PackageAmount'];
    isIncludeVAT = json['IsIncludeVAT'];
    maxFreezeDays = json['MaxFreezeDays'];
    maxFreezeTimes = json['MaxFreezeTimes'];
    maxNoOfInstallment = json['MaxNoOfInstallment'];
    isInstallment = json['IsInstallment'];
    memberId = json['MemberId'];
    firstName = json['FirstName'];
    email = json['Email'];
    telephone = json['Telephone'];
    timeFrom = json['TimeFrom'];
    timeFromAMPM = json['TimeFromAMPM'];
    timeTo = json['TimeTo'];
    timeToAMPM = json['TimeToAMPM'];
    timeSlot = json['TimeSlot'];
    aGENDANAME = json['AGENDA_NAME'];
    employeeFirstName = json['Employee_FirstName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['BookingId'] = this.bookingId;
    data['BookingDate'] = this.bookingDate;
    data['CLASS_SCHEDULE_ID'] = this.cLASSSCHEDULEID;
    data['PackageRegId'] = this.packageRegId;
    data['BookingMemberId'] = this.bookingMemberId;
    data['IsDeleted'] = this.isDeleted;
    data['DeletedBy'] = this.deletedBy;
    data['DeletedDate'] = this.deletedDate;
    data['Date'] = this.date;
    data['Description'] = this.description;
    data['IsClass'] = this.isClass;
    data['TimeSlot_ID'] = this.timeSlotID;
    data['TRAINER_ID'] = this.tRAINERID;
    data['AGENDA_ID'] = this.aGENDAID;
    data['SeatCapacity'] = this.seatCapacity;
    data['RegistrationDate'] = this.registrationDate;
    data['PackageId'] = this.packageId;
    data['Amount'] = this.amount;
    data['DiscPercentage'] = this.discPercentage;
    data['DiscAmount'] = this.discAmount;
    data['TaxPercentage'] = this.taxPercentage;
    data['TaxAmount'] = this.taxAmount;
    data['NetAmount'] = this.netAmount;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['ExtendedEndDate'] = this.extendedEndDate;
    data['PACKAGE_ID'] = this.pACKAGEID;
    data['PACKAGE_NAME'] = this.pACKAGENAME;
    data['NoOfMember'] = this.noOfMember;
    data['NoOfSession'] = this.noOfSession;
    data['ValidityInDays'] = this.validityInDays;
    data['PackageAmount'] = this.packageAmount;
    data['IsIncludeVAT'] = this.isIncludeVAT;
    data['MaxFreezeDays'] = this.maxFreezeDays;
    data['MaxFreezeTimes'] = this.maxFreezeTimes;
    data['MaxNoOfInstallment'] = this.maxNoOfInstallment;
    data['IsInstallment'] = this.isInstallment;
    data['MemberId'] = this.memberId;
    data['FirstName'] = this.firstName;
    data['Email'] = this.email;
    data['Telephone'] = this.telephone;
    data['TimeFrom'] = this.timeFrom;
    data['TimeFromAMPM'] = this.timeFromAMPM;
    data['TimeTo'] = this.timeTo;
    data['TimeToAMPM'] = this.timeToAMPM;
    data['TimeSlot'] = this.timeSlot;
    data['AGENDA_NAME'] = this.aGENDANAME;
    data['Employee_FirstName'] = this.employeeFirstName;
    return data;
  }
}
