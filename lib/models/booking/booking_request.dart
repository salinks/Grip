class BookRequest {
  String? memberID;
  String? bookingDate;
  String? bookingPackageRegId;
  String? isClass;
  String? classScheduleID;

  BookRequest(
      {this.memberID,
        this.bookingDate,
        this.bookingPackageRegId,
        this.isClass,
        this.classScheduleID});

  BookRequest.fromJson(Map<String, dynamic> json) {
    memberID = json['MemberID'];
    bookingDate = json['BookingDate'];
    bookingPackageRegId = json['BookingPackageRegId'];
    isClass = json['Is_Class'];
    classScheduleID = json['ClassScheduleID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MemberID'] = this.memberID;
    data['BookingDate'] = this.bookingDate;
    data['BookingPackageRegId'] = this.bookingPackageRegId;
    data['Is_Class'] = this.isClass;
    data['ClassScheduleID'] = this.classScheduleID;
    return data;
  }
}
