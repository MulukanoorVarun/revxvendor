import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:revxvendor/logic/cubit/diognostic_appointment/diognostic_get_appointment_cubit.dart';
import 'package:revxvendor/logic/cubit/diognostic_appointment/diognostic_get_appointment_state.dart';
import '../Utils/color.dart';


class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> with TickerProviderStateMixin {
  late TabController _tabController;
  bool isTodaySelected = true;
  bool isTomorrowSelected = false; // Fixed typo
  bool isThisWeekSelected = false;

  @override
  void initState() {
    super.initState();
    context.read<DiagnosticAppointmentListCubit>().fetchAppointmentList();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return BlocBuilder<DiagnosticAppointmentListCubit, DiagnosticAppointmentListState>(
      builder: (context, state) {
        if (state is DiagnosticAppointmentListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DiagnosticAppointmentListLoaded) {
          final appointmentData = state.appointmentListModel.appointmentlist;

          final appointmentList = appointmentData ?? [];
          if (appointmentList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  const Text(
                    'Oops !',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    textAlign: TextAlign.center,
                    'No Data Found!',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leadingWidth: 0,
              toolbarHeight: 95,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.pop(true);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        'Appointments',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Color(0xffffffff)),
                    child: TabBar(
                      dividerColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      indicatorColor: primaryColor,
                      indicatorWeight: 0.01,
                      tabAlignment: TabAlignment.start,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: primaryColor,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff808080),
                        fontSize: 13,
                      ),
                      tabs: const [
                        Tab(child: Align(alignment: Alignment.centerLeft, child: Text('Scheduled'))),
                        Tab(child: Align(alignment: Alignment.centerLeft, child: Text('Past'))),
                        Tab(child: Align(alignment: Alignment.centerLeft, child: Text('Cancelled'))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  if (_tabController.index == 0) ...[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F7FB),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkResponse(
                            onTap: () {
                              setState(() {
                                isTodaySelected = true;
                                isTomorrowSelected = false;
                                isThisWeekSelected = false;
                              });
                            },
                            child: Container(
                              width: w * 0.3,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: isTodaySelected ? primaryColor : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  "Today",
                                  style: TextStyle(
                                    color: isTodaySelected ? Colors.white : primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkResponse(
                            onTap: () {
                              setState(() {
                                isTodaySelected = false;
                                isTomorrowSelected = true;
                                isThisWeekSelected = false;
                              });
                            },
                            child: Container(
                              width: w * 0.3,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: isTomorrowSelected ? primaryColor : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  "Tomorrow", // Fixed typo
                                  style: TextStyle(
                                    color: isTomorrowSelected ? Colors.white : primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkResponse(
                            onTap: () {
                              setState(() {
                                isTodaySelected = false;
                                isTomorrowSelected = false;
                                isThisWeekSelected = true;
                              });
                            },
                            child: Container(
                              width: w * 0.3,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: isThisWeekSelected ? primaryColor : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  "This Week",
                                  style: TextStyle(
                                    color: isThisWeekSelected ? Colors.white : primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    Container(),
                  ],
                   Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Text(
                          '22th April, Monday',
                          style: TextStyle(
                            color: Color(0xff151515),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/uil_calender.png',
                          fit: BoxFit.contain,
                          height: 14,
                          width: 14,
                        ),
                        TextButton(
                          onPressed: null,
                          child: Text(
                            'Calendar',
                            style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: appointmentList.length,
                      itemBuilder: (context, index) {
                        final appointment = appointmentList[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            border: Border.all(color: primaryColor, width: 0.5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${appointment.patientName}',
                                    style: const TextStyle(
                                      color: Color(0xff151515),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      customButton: const Icon(
                                        Icons.more_vert_rounded,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                      items: [
                                        ...MenuItems.firstItems.map(
                                              (item) => DropdownMenuItem<MenuItem>(
                                            value: item,
                                            child: MenuItems.buildItem(item),
                                          ),
                                        ),
                                        const DropdownMenuItem<Divider>(
                                          enabled: false,
                                          child: Divider(color: Colors.white),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        if (value != null) {
                                          MenuItems.onChanged(
                                            context,
                                            value as MenuItem,
                                            "address_id_here",
                                          );
                                        }
                                      },
                                      dropdownStyleData:  DropdownStyleData(
                                        width: 200,
                                        padding: EdgeInsets.symmetric(vertical: 6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                      ),
                                      menuItemStyleData: const MenuItemStyleData(
                                        customHeights: [
                                          ...[48.0, 48.0, 48.0, 48.0], // Fixed length to match firstItems
                                          8,
                                        ],
                                        padding: EdgeInsets.only(left: 16, right: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                              const Text(
                                '1 Hour slot',
                                style: TextStyle(
                                  color: Color(0xff151515),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              const SizedBox(height: 7),
                              Text(
                                  appointment.appointmentDate ?? "",
                                style: const TextStyle(
                                  color: Color(0xff151515),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                              appointment.diagnosticCentreName??'',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  OutlinedButton(
                                    style: ButtonStyle(
                                      visualDensity: VisualDensity.comfortable,
                                      padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                                      ),
                                      side: MaterialStateProperty.all(
                                        BorderSide(color: primaryColor, width: 0.5),
                                      ),
                                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Pending', // Placeholder; adjust if dynamic
                                      style: TextStyle(
                                        color: Color(0xff151515),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Divider(height: 1, color: Color(0xffCACACA)),
                              const SizedBox(height: 10),
                              const Text(
                                'Notes: Test is incomplete', // Placeholder; adjust if dynamic
                                style: TextStyle(
                                  color: Color(0xff151515),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is DiagnosticAppointmentListError) {
          return Center(child: Text(state.errorMessage));
        }
        return const Center(child: Text('Press fetch to load appointments'));
      },
    );
  }
}

class MenuItem {
  final List<Widget> textButtons;

  MenuItem({required this.textButtons});
}

abstract class MenuItems {
  static List<MenuItem> get firstItems {
    return [
      MenuItem(
        textButtons: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Update Status",
              style: TextStyle(
                color: Color(0xff151515),
                fontWeight: FontWeight.w400,
                fontSize: 12,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
      MenuItem(
        textButtons: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Edit Appointment",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xff151515),
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
      MenuItem(
        textButtons: [
          TextButton(
            onPressed: () {},
            child: const Text(
              overflow: TextOverflow.ellipsis,
              "Reschedule Appointment",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xff151515),
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
      MenuItem(
        textButtons: [
          TextButton(
            onPressed: () {},
            child: const Text(
              overflow: TextOverflow.ellipsis,
              "Cancel Appointment",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xff151515),
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    ];
  }

  static Widget buildItem(MenuItem item) {
    return Column(children: item.textButtons);
  }

  static void onChanged(BuildContext context, MenuItem item, String addressId) {}
}