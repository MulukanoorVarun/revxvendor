import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../Components/CutomAppBar.dart';
import '../../Utils/color.dart';
import '../../Utils/media_query_helper.dart';
import '../../logic/cubit/diognostic_get_test_details/diagnostic_get_test_details_cubit.dart';
import '../../logic/cubit/diognostic_get_test_details/diagnostic_get_test_details_state.dart';


class VendorTestDetails extends StatefulWidget {
  String id;
  VendorTestDetails({super.key,required this.id});

  @override
  State<VendorTestDetails> createState() => _VendorTestDetailsState();
}

class _VendorTestDetailsState extends State<VendorTestDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    context.read<DiagnosticTestDetailsCubit>().getTestDetails(widget.id);
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Test Details',
        actions: [],
      ),
      body: BlocBuilder<DiagnosticTestDetailsCubit, DiagnosticTestDetailsState>(
        builder: (context, state) {
          if (state is DiagnosticTestDetailsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is DiagnosticTestDetailsLoaded) {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 16, right: 16, bottom: 16, top: 8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      width: w * 0.25,
                      height: w * 0.3,
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          '${state.vendorGetTestDetailsModel.data?.testDetails?.image??''}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: w * 0.56,
                      child: Column(
                        spacing: 12,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          state.vendorGetTestDetailsModel.data?.testDetails
                                    ?.testName ??
                                "",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '₹ ${state.vendorGetTestDetailsModel.data?.testDetails?.price ?? 0}/-',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'No of tests : ${state.vendorGetTestDetailsModel.data?.testDetails?.noOfTests ?? 0}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              color: Colors.black,
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.5),
                        blurRadius: 1,
                        offset: Offset(0, 0.1),
                      ),
                    ],
                    border: Border(
                      bottom: BorderSide(
                        color: primaryColor.withOpacity(0.1),
                        width: 0.5,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    indicatorColor: primaryColor,
                    indicatorWeight: 4,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabAlignment: TabAlignment.start,
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.width(2),
                    ),
                    labelStyle: TextStyle(
                      fontFamily: 'pjs',
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.fontSize(12),
                      color: primaryColor,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontFamily: 'pjs',
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey,
                      fontSize: SizeConfig.fontSize(11),
                    ),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Description'),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Overview'),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Ranges'),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Test Result Iinterpretation'),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Risk Assessment'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            Html(
                                data: state.vendorGetTestDetailsModel.data?.testDetails?.description??'',
                                style: {
                                  "body": Style(
                                    fontSize: FontSize(12),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w400,
                                  ),
                                })
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              children: [
                                Html(
                                    data: state.vendorGetTestDetailsModel.data?.testDetails?.overview??'',
                                    style: {
                                      "body": Style(
                                        fontSize: FontSize(12),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    })
                              ],
                            ),
                          )),
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              children: [
                                Html(
                                    data: state.vendorGetTestDetailsModel.data?.testDetails?.ranges??'',
                                    style: {
                                      "body": Style(
                                        fontSize: FontSize(12),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    })
                              ],
                            ),
                          )),
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              children: [
                                Html(
                                    data: state.vendorGetTestDetailsModel.data?.testDetails?.testResultInterpretation??'',
                                    style: {
                                      "body": Style(
                                        fontSize: FontSize(12),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    })
                              ],
                            ),
                          )),
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              children: [
                                Html(
                                    data: state.vendorGetTestDetailsModel.data?.testDetails?.riskAssessment??'',
                                    style: {
                                      "body": Style(
                                        fontSize: FontSize(12),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    })
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is DiagnosticTestDetailsError) {
            return Center(
              child: Text(state.msg),
            );
          }
          return Center(child: Text("No Data"));
        },
      ),

    );
  }
}
