class VendorGetTestDetailsModel {
  Data? data;
  Settings? settings;

  VendorGetTestDetailsModel({this.data, this.settings});

  VendorGetTestDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String? diagnosticCentre;
  TestDetails? testDetails;

  Data({this.id, this.diagnosticCentre, this.testDetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    diagnosticCentre = json['diagnostic_centre'];
    testDetails = json['test_details'] != null
        ? new TestDetails.fromJson(json['test_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['diagnostic_centre'] = this.diagnosticCentre;
    if (this.testDetails != null) {
      data['test_details'] = this.testDetails!.toJson();
    }
    return data;
  }
}

class TestDetails {
  String? id;
  String? testName;
  String? description;
  String? overview;
  String? ranges;
  String? testResultInterpretation;
  String? riskAssessment;
  int? noOfTests;
  List<String>? subTests;
  String? sampleType;
  int? fastingRequired;
  String? category;
  String? categoryName;
  int? price;
  String? condition;
  int? reportsDeliveredIn;
  String? image;
  String? conditionName;

  TestDetails(
      {this.id,
        this.testName,
        this.description,
        this.overview,
        this.ranges,
        this.testResultInterpretation,
        this.riskAssessment,
        this.noOfTests,
        this.subTests,
        this.sampleType,
        this.fastingRequired,
        this.category,
        this.categoryName,
        this.price,
        this.condition,
        this.reportsDeliveredIn,
        this.image,
        this.conditionName});

  TestDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    testName = json['test_name'];
    description = json['description'];
    overview = json['overview'];
    ranges = json['ranges'];
    testResultInterpretation = json['test_result_interpretation'];
    riskAssessment = json['risk_assessment'];
    noOfTests = json['no_of_tests'];
    subTests = json['sub_tests'].cast<String>();
    sampleType = json['sample_type'];
    fastingRequired = json['fasting_required'];
    category = json['category'];
    categoryName = json['category_name'];
    price = json['price'];
    condition = json['condition'];
    reportsDeliveredIn = json['reports_delivered_in'];
    image = json['image'];
    conditionName = json['condition_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['test_name'] = this.testName;
    data['description'] = this.description;
    data['overview'] = this.overview;
    data['ranges'] = this.ranges;
    data['test_result_interpretation'] = this.testResultInterpretation;
    data['risk_assessment'] = this.riskAssessment;
    data['no_of_tests'] = this.noOfTests;
    data['sub_tests'] = this.subTests;
    data['sample_type'] = this.sampleType;
    data['fasting_required'] = this.fastingRequired;
    data['category'] = this.category;
    data['category_name'] = this.categoryName;
    data['price'] = this.price;
    data['condition'] = this.condition;
    data['reports_delivered_in'] = this.reportsDeliveredIn;
    data['image'] = this.image;
    data['condition_name'] = this.conditionName;
    return data;
  }
}

class Settings {
  int? success;
  String? message;
  int? status;

  Settings({this.success, this.message, this.status});

  Settings.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
