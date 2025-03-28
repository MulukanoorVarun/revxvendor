class AppointmentListModel {
  List<AppointmentList>? appointmentlist;
  Settings? settings;

  AppointmentListModel({this.appointmentlist, this.settings});

  AppointmentListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      appointmentlist = <AppointmentList>[];
      json['data'].forEach((v) {
        appointmentlist!.add(new AppointmentList.fromJson(v));
      });
    }
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appointmentlist != null) {
      data['data'] = this.appointmentlist!.map((v) => v.toJson()).toList();
    }
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    return data;
  }
}

class AppointmentList {
  String? id;
  String? appointmentNumber;
  String? diagnosticCentreName;
  String? patientName;
  String? patientEmail;
  String? appointmentDate;
  String? startTime;
  String? status;
  String? totalAmount;
  String? paymentStatus;
  bool? isPaid;

  AppointmentList(
      {this.id,
        this.appointmentNumber,
        this.diagnosticCentreName,
        this.patientName,
        this.patientEmail,
        this.appointmentDate,
        this.startTime,
        this.status,
        this.totalAmount,
        this.paymentStatus,
        this.isPaid});

  AppointmentList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentNumber = json['appointment_number'];
    diagnosticCentreName = json['diagnostic_centre_name'];
    patientName = json['patient_name'];
    patientEmail = json['patient_email'];
    appointmentDate = json['appointment_date'];
    startTime = json['start_time'];
    status = json['status'];
    totalAmount = json['total_amount'];
    paymentStatus = json['payment_status'];
    isPaid = json['is_paid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appointment_number'] = this.appointmentNumber;
    data['diagnostic_centre_name'] = this.diagnosticCentreName;
    data['patient_name'] = this.patientName;
    data['patient_email'] = this.patientEmail;
    data['appointment_date'] = this.appointmentDate;
    data['start_time'] = this.startTime;
    data['status'] = this.status;
    data['total_amount'] = this.totalAmount;
    data['payment_status'] = this.paymentStatus;
    data['is_paid'] = this.isPaid;
    return data;
  }
}

class Settings {
  int? success;
  String? message;
  int? status;
  int? count;
  int? page;
  bool? nextPage;
  bool? prevPage;

  Settings(
      {this.success,
        this.message,
        this.status,
        this.count,
        this.page,
        this.nextPage,
        this.prevPage});

  Settings.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    status = json['status'];
    count = json['count'];
    page = json['page'];
    nextPage = json['next_page'];
    prevPage = json['prev_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['status'] = this.status;
    data['count'] = this.count;
    data['page'] = this.page;
    data['next_page'] = this.nextPage;
    data['prev_page'] = this.prevPage;
    return data;
  }
}
