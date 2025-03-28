class AppointmentDetailsModel {
  Data? data;
  Settings? settings;

  AppointmentDetailsModel({this.data, this.settings});

  AppointmentDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    settings = json['settings'] != null ? Settings.fromJson(json['settings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? appointmentNumber;
  String? diagnosticCentreName;
  String? appointmentDate;
  String? startTime;
  List<AppointmentTests>? appointmentTests;
  PatientDetails? patientDetails;
  String? totalAmount;
  List<AppointmentReport>? appointmentReports; // Changed from List<Null> to List<AppointmentReport>
  String? status;
  String? paymentStatus;
  bool? isPaid;

  Data({
    this.id,
    this.appointmentNumber,
    this.diagnosticCentreName,
    this.appointmentDate,
    this.startTime,
    this.appointmentTests,
    this.patientDetails,
    this.totalAmount,
    this.appointmentReports,
    this.status,
    this.paymentStatus,
    this.isPaid,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    appointmentNumber = json['appointment_number'] as String?;
    diagnosticCentreName = json['diagnostic_centre_name'] as String?;
    appointmentDate = json['appointment_date'] as String?;
    startTime = json['start_time'] as String?;
    if (json['appointment_tests'] != null) {
      appointmentTests = (json['appointment_tests'] as List)
          .map((v) => AppointmentTests.fromJson(v))
          .toList();
    }
    patientDetails = json['patient_details'] != null
        ? PatientDetails.fromJson(json['patient_details'])
        : null;
    totalAmount = json['total_amount'] as String?;
    if (json['appointment_reports'] != null) {
      appointmentReports = (json['appointment_reports'] as List)
          .map((v) => AppointmentReport.fromJson(v))
          .toList();
    }
    status = json['status'] as String?;
    paymentStatus = json['payment_status'] as String?;
    isPaid = json['is_paid'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['appointment_number'] = appointmentNumber;
    data['diagnostic_centre_name'] = diagnosticCentreName;
    data['appointment_date'] = appointmentDate;
    data['start_time'] = startTime;
    if (appointmentTests != null) {
      data['appointment_tests'] = appointmentTests!.map((v) => v.toJson()).toList();
    }
    if (patientDetails != null) {
      data['patient_details'] = patientDetails!.toJson();
    }
    data['total_amount'] = totalAmount;
    if (appointmentReports != null) {
      data['appointment_reports'] = appointmentReports!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['payment_status'] = paymentStatus;
    data['is_paid'] = isPaid;
    return data;
  }
}

class AppointmentTests {
  String? id;
  TestDetails? testDetails;
  int? noOfPersons;
  int? totalPrice;

  AppointmentTests({
    this.id,
    this.testDetails,
    this.noOfPersons,
    this.totalPrice,
  });

  AppointmentTests.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    testDetails = json['test_details'] != null
        ? TestDetails.fromJson(json['test_details'])
        : null;
    noOfPersons = json['no_of_persons'] as int?;
    totalPrice = json['total_price'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    if (testDetails != null) {
      data['test_details'] = testDetails!.toJson();
    }
    data['no_of_persons'] = noOfPersons;
    data['total_price'] = totalPrice;
    return data;
  }
}

class TestDetails {
  String? id;
  String? testName;
  String? category;
  int? price;
  String? condition;
  bool? fastingRequired;
  int? reportsDeliveredIn;
  String? image;
  int? noOfTests;

  TestDetails({
    this.id,
    this.testName,
    this.category,
    this.price,
    this.condition,
    this.fastingRequired,
    this.reportsDeliveredIn,
    this.image,
    this.noOfTests,
  });

  TestDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    testName = json['test_name'] as String?;
    category = json['category'] as String?;
    price = json['price'] as int?;
    condition = json['condition'] as String?;
    fastingRequired = json['fasting_required'] as bool?;
    reportsDeliveredIn = json['reports_delivered_in'] as int?;
    image = json['image'] as String?;
    noOfTests = json['no_of_tests'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['test_name'] = testName;
    data['category'] = category;
    data['price'] = price;
    data['condition'] = condition;
    data['fasting_required'] = fastingRequired;
    data['reports_delivered_in'] = reportsDeliveredIn;
    data['image'] = image;
    data['no_of_tests'] = noOfTests;
    return data;
  }
}

class PatientDetails {
  String? id;
  String? fullName;
  String? dateOfBirth;
  String? mobile;
  String? email;

  PatientDetails({
    this.id,
    this.fullName,
    this.dateOfBirth,
    this.mobile,
    this.email,
  });

  PatientDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    fullName = json['full_name'] as String?;
    dateOfBirth = json['date_of_birth'] as String?;
    mobile = json['mobile'] as String?;
    email = json['email'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['full_name'] = fullName;
    data['date_of_birth'] = dateOfBirth;
    data['mobile'] = mobile;
    data['email'] = email;
    return data;
  }
}

// New class for AppointmentReport
class AppointmentReport {
  String? reportId;
  String? reportUrl;

  AppointmentReport({this.reportId, this.reportUrl});

  AppointmentReport.fromJson(Map<String, dynamic> json) {
    reportId = json['report_id'] as String?;
    reportUrl = json['report_url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['report_id'] = reportId;
    data['report_url'] = reportUrl;
    return data;
  }
}

class Settings {
  int? success;
  String? message;
  int? status;

  Settings({this.success, this.message, this.status});

  Settings.fromJson(Map<String, dynamic> json) {
    success = json['success'] as int?;
    message = json['message'] as String?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}