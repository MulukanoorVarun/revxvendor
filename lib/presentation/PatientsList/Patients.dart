import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../Components/CutomAppBar.dart';
import '../../Utils/color.dart';
import 'PatientDetails.dart';

class Patients extends StatefulWidget {
  const Patients({super.key});

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  bool _isListening = false;

  TextEditingController _searchController = TextEditingController();
  String searchQuery = "";


  Future<bool> _requestMicrophonePermission() async {
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      print("Microphone permission granted.");
      return true; // Permission granted
    } else {
      print("Microphone permission not granted.");
      return false; // Permission denied
    }
  }


  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Patients', actions: [
        IconButton.filledTonal(
            visualDensity: VisualDensity.compact,
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => CreateNewCategory()));
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                shape: MaterialStateProperty.all(CircleBorder()),
                backgroundColor: MaterialStateProperty.all(Color(0xffE5FCFC))),
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
              size: 18,
            )),
        SizedBox(
          width: 16,
        )
      ]),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              margin: EdgeInsets.only(bottom: 10),
              height: 38,
              decoration: BoxDecoration(
                border: Border.all(
                  color: primaryColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (c) {
                        setState(() {
                          if (c.length > 2) {
                            searchQuery = c.toLowerCase();
                          } else {
                            searchQuery = "";
                          }
                        });
                      },
                      decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        hintText: 'Search here...',
                        icon: Icon(
                          Icons.search,
                          color: Color(0xff808080),
                        ),
                        hintStyle: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff808080),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: "Inter",
                        ),
                      ),
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: "Poppins",
                        overflow: TextOverflow.ellipsis,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _isListening ? Icons.stop : Icons.mic,
                      color: primaryColor,
                      size: 18,
                    ),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InkResponse(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PateintDetails()));
                  },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xffD6D6D6), width: 0.5))),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            child: Image.asset('assets/person.png',
                                fit: BoxFit.contain),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: w * 0.45,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              'Rameswer',
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Spacer(),
                          IconButton.filledTonal(
                              visualDensity: VisualDensity.compact,
                              onPressed: () {

                              },
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                                  shape: MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor:
                                  MaterialStateProperty.all(Color(0xffE5FCFC))),
                              icon: Icon(
                                Icons.call,
                                color: Colors.black,
                                size: 20,
                              )),
                          SizedBox(width: 12,),
                          IconButton.filledTonal(
                              visualDensity: VisualDensity.compact,
                              onPressed: () {

                              },
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                                  shape: MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor:
                                  MaterialStateProperty.all(Color(0xffE5FCFC))),
                              icon: Icon(
                                Icons.info_outline,
                                color: Colors.black,
                                size: 20,
                              )),


                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
