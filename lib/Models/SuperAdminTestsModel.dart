import 'package:revxvendor/Models/DiognosticGetCategoriesModel.dart';

class SuperAdminTestsModel {
  List<Data>? data;
  Settings? settings;

  SuperAdminTestsModel({this.data, this.settings});

  SuperAdminTestsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? id;
  String? testName;
  String? category;
  int? price;
  String? condition;
  bool? fastingRequired;
  int? reportsDeliveredIn;
  String? image;
  int? noOfTests;

  Data(
      {this.id,
        this.testName,
        this.category,
        this.price,
        this.condition,
        this.fastingRequired,
        this.reportsDeliveredIn,
        this.image,
        this.noOfTests});

  Data.fromJson(Map<String, dynamic> json) {
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
