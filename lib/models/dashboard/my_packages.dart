class MyPackageResponse {
  Result? result;
  List<PackageData>? data;

  MyPackageResponse({this.result, this.data});

  MyPackageResponse.fromJson(Map<String, dynamic> json) {
    result =
    json['Result'] != null ? new Result.fromJson(json['Result']) : null;
    if (json['Data'] != null) {
      data = <PackageData>[];
      json['Data'].forEach((v) {
        data!.add(new PackageData.fromJson(v));
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

class PackageData {
  Object? packageRegId;
  Object? registrationDate;
  Object? packageId;
  Object? amount;
  Object? discPercentage;
  Object? discAmount;
  Object? taxPercentage;
  Object? taxAmount;
  Object? netAmount;
  Object? paidAmount;
  Object? startDate;
  Object? endDate;
  Object? extendedEndDate;
  Object? isDeleted;
  Object? deletedBy;
  Object? deletedDate;
  Object? pACKAGEID;
  Object? pACKAGENAME;
  bool? isClass;
  String? packageType;
  Object? noOfMember;
  Object? noOfSession;
  Object? totalBookingCount;
  Object? validityInDays;
  Object? packageAmount;
  bool? isIncludeVAT;
  Object? maxFreezeDays;
  Object? maxFreezeTimes;
  Object? maxNoOfInstallment;
  bool? isInstallment;
  Object? memberId;
  Object? firstName;
  Object? email;
  Object? telephone;

  PackageData(
      {this.packageRegId,
        this.registrationDate,
        this.packageId,
        this.amount,
        this.discPercentage,
        this.discAmount,
        this.taxPercentage,
        this.taxAmount,
        this.netAmount,
        this.paidAmount,
        this.startDate,
        this.endDate,
        this.extendedEndDate,
        this.isDeleted,
        this.deletedBy,
        this.deletedDate,
        this.pACKAGEID,
        this.pACKAGENAME,
        this.isClass,
        this.packageType,
        this.noOfMember,
        this.noOfSession,
        this.totalBookingCount,
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
        this.telephone});

  PackageData.fromJson(Map<String, dynamic> json) {
    packageRegId = json['PackageRegId'];
    registrationDate = json['RegistrationDate'];
    packageId = json['PackageId'];
    amount = json['Amount'];
    discPercentage = json['DiscPercentage'];
    discAmount = json['DiscAmount'];
    taxPercentage = json['TaxPercentage'];
    taxAmount = json['TaxAmount'];
    netAmount = json['NetAmount'];
    paidAmount = json['PaidAmount'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    extendedEndDate = json['ExtendedEndDate'];
    isDeleted = json['IsDeleted'];
    deletedBy = json['DeletedBy'];
    deletedDate = json['DeletedDate'];
    pACKAGEID = json['PACKAGE_ID'];
    pACKAGENAME = json['PACKAGE_NAME'];
    isClass = json['IsClass'];
    packageType = json['PackageType'];
    noOfMember = json['NoOfMember'];
    noOfSession = json['NoOfSession'];
    totalBookingCount = json['TotalBookingCount'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PackageRegId'] = this.packageRegId;
    data['RegistrationDate'] = this.registrationDate;
    data['PackageId'] = this.packageId;
    data['Amount'] = this.amount;
    data['DiscPercentage'] = this.discPercentage;
    data['DiscAmount'] = this.discAmount;
    data['TaxPercentage'] = this.taxPercentage;
    data['TaxAmount'] = this.taxAmount;
    data['NetAmount'] = this.netAmount;
    data['PaidAmount'] = this.paidAmount;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['ExtendedEndDate'] = this.extendedEndDate;
    data['IsDeleted'] = this.isDeleted;
    data['DeletedBy'] = this.deletedBy;
    data['DeletedDate'] = this.deletedDate;
    data['PACKAGE_ID'] = this.pACKAGEID;
    data['PACKAGE_NAME'] = this.pACKAGENAME;
    data['IsClass'] = this.isClass;
    data['PackageType'] = this.packageType;
    data['NoOfMember'] = this.noOfMember;
    data['NoOfSession'] = this.noOfSession;
    data['TotalBookingCount'] = this.totalBookingCount;
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
    return data;
  }
}
