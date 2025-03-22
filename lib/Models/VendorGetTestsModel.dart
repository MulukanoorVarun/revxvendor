class VendorGetTestsModel {
  List<VendorGetTest>? data;
  Settings? settings;

  VendorGetTestsModel({this.data, this.settings});

  VendorGetTestsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <VendorGetTest>[];
      json['data'].forEach((v) {
        data!.add(new VendorGetTest.fromJson(v));
      });
    }
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    return data;
  }
}

class VendorGetTest {
  String? id;
  TestDetails? testDetails;

  VendorGetTest({this.id, this.testDetails});

  VendorGetTest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    testDetails = json['test_details'] != null
        ? new TestDetails.fromJson(json['test_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.testDetails != null) {
      data['test_details'] = this.testDetails!.toJson();
    }
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

  TestDetails(
      {this.id,
        this.testName,
        this.category,
        this.price,
        this.condition,
        this.fastingRequired,
        this.reportsDeliveredIn,
        this.image,
        this.noOfTests});

  TestDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    testName = json['test_name'];
    category = json['category'];
    price = json['price'];
    condition = json['condition'];
    fastingRequired = json['fasting_required'];
    reportsDeliveredIn = json['reports_delivered_in'];
    image = json['image'];
    noOfTests = json['no_of_tests'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['test_name'] = this.testName;
    data['category'] = this.category;
    data['price'] = this.price;
    data['condition'] = this.condition;
    data['fasting_required'] = this.fastingRequired;
    data['reports_delivered_in'] = this.reportsDeliveredIn;
    data['image'] = this.image;
    data['no_of_tests'] = this.noOfTests;
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
