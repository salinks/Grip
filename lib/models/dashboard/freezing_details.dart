class FreezingDetails {
  Result? result;
  List<FreezingData>? freezingData;

  FreezingDetails({this.result, this.freezingData});

  FreezingDetails.fromJson(Map<String, dynamic> json) {
    result =
    json['Result'] != null ? Result.fromJson(json['Result']) : null;
    if (json['Data'] != null) {
      freezingData = <FreezingData>[];
      json['Data'].forEach((v) {
        freezingData!.add(FreezingData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (result != null) {
      data['Result'] = result!.toJson();
    }
    if (freezingData != null) {
      data['Data'] = freezingData!.map((v) => v.toJson()).toList();
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

class FreezingData {
  Object? packageRegId;
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
  String? extendedEndDate;
  Object? isDeleted;
  Object? deletedBy;
  Object? deletedDate;
  Object? packageFreezeId;
  Object? freezeFromDate;
  Object? freezeToDate;
  Object? freezingDayCount;
  Object? packageRegistrationFreezeIsDeleted;
  Object? packageRegistrationFreezeDeletedBy;
  Object? packageRegistrationFreezeDeletedDate;

  FreezingData(
      {this.packageRegId,
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
        this.isDeleted,
        this.deletedBy,
        this.deletedDate,
        this.packageFreezeId,
        this.freezeFromDate,
        this.freezeToDate,
        this.freezingDayCount,
        this.packageRegistrationFreezeIsDeleted,
        this.packageRegistrationFreezeDeletedBy,
        this.packageRegistrationFreezeDeletedDate});

  FreezingData.fromJson(Map<String, dynamic> json) {
    packageRegId = json['PackageRegId'];
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
    isDeleted = json['IsDeleted'];
    deletedBy = json['DeletedBy'];
    deletedDate = json['DeletedDate'];
    packageFreezeId = json['PackageFreezeId'];
    freezeFromDate = json['FreezeFromDate'];
    freezeToDate = json['FreezeToDate'];
    freezingDayCount = json['FreezingDayCount'];
    packageRegistrationFreezeIsDeleted =
    json['PackageRegistrationFreeze_IsDeleted'];
    packageRegistrationFreezeDeletedBy =
    json['PackageRegistrationFreeze_DeletedBy'];
    packageRegistrationFreezeDeletedDate =
    json['PackageRegistrationFreeze_DeletedDate'];
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
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['ExtendedEndDate'] = this.extendedEndDate;
    data['IsDeleted'] = this.isDeleted;
    data['DeletedBy'] = this.deletedBy;
    data['DeletedDate'] = this.deletedDate;
    data['PackageFreezeId'] = this.packageFreezeId;
    data['FreezeFromDate'] = this.freezeFromDate;
    data['FreezingDayCount'] = this.freezingDayCount;
    data['FreezeToDate'] = this.freezeToDate;
    data['PackageRegistrationFreeze_IsDeleted'] =
        this.packageRegistrationFreezeIsDeleted;
    data['PackageRegistrationFreeze_DeletedBy'] =
        this.packageRegistrationFreezeDeletedBy;
    data['PackageRegistrationFreeze_DeletedDate'] =
        this.packageRegistrationFreezeDeletedDate;
    return data;
  }
}
