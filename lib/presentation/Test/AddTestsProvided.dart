import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revxvendor/Components/CustomAppButton.dart';
import 'package:revxvendor/Models/SuperAdminTestsModel.dart';
import 'package:revxvendor/Utils/color.dart';
import 'package:revxvendor/logic/cubit/super_admin_tests/super_admin_test_cubit.dart';
import 'package:revxvendor/logic/cubit/super_admin_tests/super_admin_test_state.dart';

class Addtestsprovided extends StatefulWidget {
  @override
  _AddtestsprovidedState createState() => _AddtestsprovidedState();
}

class _AddtestsprovidedState extends State<Addtestsprovided> {
  List<String> selectedTestIds = [];
  @override
  void initState() {
    super.initState();
    context.read<SuperAdminTestsCubit>().getSuperaAdminTests();
  }

  void _saveSelectedTests() {
    // Handle saving selected test IDs
    print("Selected Test IDs: $selectedTestIds");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Available Tests")),
      body: BlocBuilder<SuperAdminTestsCubit, SuperAdminTestsState>(
        builder: (context, state) {
          if (state is SuperAdminTestsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SuperAdminTestsLoaded) {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(8.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final test = state.data.data![index];
                        return _buildTestCard(test);
                      },
                      childCount: state.data.data!.length,
                    ),
                  ),
                ),
              ],
            );
          } else if (state is SuperAdminTestsError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text("No tests available"));
        },
      ),
      bottomNavigationBar: selectedTestIds.isNotEmpty
          ? Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomAppButton(text: "Save", onPlusTap: _saveSelectedTests),
      )
          : null,
    );
  }

  Widget _buildTestCard(Data test) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: CachedNetworkImage(
                imageUrl: test.image ?? '',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) => SizedBox(
                  width: 30,
                    height: 20,
                    child: SizedBox(
                      height: 30,
                        width: 30,
                        child: CircularProgressIndicator(strokeWidth: 1,))),
                errorWidget: (context, url, error) => Icon(Icons.image_not_supported),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${ test.testName ?? "Unknown"}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,  fontFamily: "Poppins"),
                  ),
                  SizedBox(height: 4),
                  Text("₹${test.price ?? 0}",style: TextStyle(
                      fontFamily: "Poppins"
                  ),),
                  Text("No. of Tests: ${test.noOfTests ?? 0}",
                    style: TextStyle(
                      fontFamily: "Poppins"
                    ),
                  ),
                ],
              ),
            ),
            Checkbox(
              value: selectedTestIds.contains(test.id),
              activeColor: primaryColor,
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedTestIds.add(test.id!);
                  } else {
                    selectedTestIds.remove(test.id);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

