

class MyProfileResponse {
  Result? result;
  List<ProfileData>? data;

  MyProfileResponse({this.result, this.data});

  MyProfileResponse.fromJson(Map<String, dynamic> json) {
    result =
    json['Result'] != null ? Result.fromJson(json['Result']) : null;
    if (json['Data'] != null) {
      data = <ProfileData>[];
      json['Data'].forEach((v) {
        data!.add(ProfileData.fromJson(v));
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

class ProfileData {
  Object? mEMBERID;
  Object? surname;
  Object? firstName;
  Object? province;
  Object? region;
  Object? gender;
  Object? dateOfBirth;
  Object? residentialAddress;
  Object? profession;
  Object? telephone;
  Object? email;
  Object? emergencyContact;
  Object? billingDate;
  Object? bATCHID;
  Object? fEEPLANID;
  Object? mEMBERSHIPCATEGORYID;
  Object? registrationDate;
  Object? admissionFee;
  Object? active;
  Object? deactive;
  Object? memberPhoto;
  Object? webLoginId;
  Object? webLoginPassword;
  Object? isDeleted;
  Object? deletedBy;
  Object? deletedDate;

  ProfileData(
      {this.mEMBERID,
        this.surname,
        this.firstName,
        this.province,
        this.region,
        this.gender,
        this.dateOfBirth,
        this.residentialAddress,
        this.profession,
        this.telephone,
        this.email,
        this.emergencyContact,
        this.billingDate,
        this.bATCHID,
        this.fEEPLANID,
        this.mEMBERSHIPCATEGORYID,
        this.registrationDate,
        this.admissionFee,
        this.active,
        this.deactive,
        this.memberPhoto,
        this.webLoginId,
        this.webLoginPassword,
        this.isDeleted,
        this.deletedBy,
        this.deletedDate});

  ProfileData.fromJson(Map<String, dynamic> json) {
    mEMBERID = json['MEMBER_ID'];
    surname = json['Surname'];
    firstName = json['FirstName'];
    province = json['Province'];
    region = json['Region'];
    gender = json['Gender'];
    dateOfBirth = json['DateOfBirth'];
    residentialAddress = json['ResidentialAddress'];
    profession = json['Profession'];
    telephone = json['Telephone'];
    email = json['Email'];
    emergencyContact = json['EmergencyContact'];
    billingDate = json['BillingDate'];
    bATCHID = json['BATCH_ID'];
    fEEPLANID = json['FEEPLAN_ID'];
    mEMBERSHIPCATEGORYID = json['MEMBERSHIP_CATEGORY_ID'];
    registrationDate = json['RegistrationDate'];
    admissionFee = json['AdmissionFee'];
    active = json['Active'];
    deactive = json['Deactive'];
    memberPhoto = json['MemberPhoto'];
    webLoginId = json['WebLoginId'];
    webLoginPassword = json['WebLoginPassword'];
    isDeleted = json['IsDeleted'];
    deletedBy = json['DeletedBy'];
    deletedDate = json['DeletedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['MEMBER_ID'] = mEMBERID;
    data['Surname'] = surname;
    data['FirstName'] = firstName;
    data['Province'] = province;
    data['Region'] = region;
    data['Gender'] = gender;
    data['DateOfBirth'] = dateOfBirth;
    data['ResidentialAddress'] = residentialAddress;
    data['Profession'] = profession;
    data['Telephone'] = telephone;
    data['Email'] = email;
    data['EmergencyContact'] = emergencyContact;
    data['BillingDate'] = billingDate;
    data['BATCH_ID'] = bATCHID;
    data['FEEPLAN_ID'] = fEEPLANID;
    data['MEMBERSHIP_CATEGORY_ID'] = mEMBERSHIPCATEGORYID;
    data['RegistrationDate'] = registrationDate;
    data['AdmissionFee'] = admissionFee;
    data['Active'] = active;
    data['Deactive'] = deactive;
    data['MemberPhoto'] = memberPhoto;
    data['WebLoginId'] = webLoginId;
    data['WebLoginPassword'] = webLoginPassword;
    data['IsDeleted'] = isDeleted;
    data['DeletedBy'] = deletedBy;
    data['DeletedDate'] = deletedDate;
    return data;
  }
}
