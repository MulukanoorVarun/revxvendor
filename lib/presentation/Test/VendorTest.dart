import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_touch_ripple/flutter_touch_ripple.dart';
import 'package:go_router/go_router.dart';
import 'package:revxvendor/Components/CutomAppBar.dart';
import 'package:revxvendor/presentation/Test/AddTestsProvided.dart';
import '../../Components/CustomAppButton.dart';
import '../../Utils/color.dart';
import '../../components/Shimmers.dart';
import '../../logic/cubit/diognostic_get_tests/diognostic_getTests_cubit.dart';
import '../../logic/cubit/diognostic_get_tests/diognostic_getTests_state.dart';
import 'VendorCreateTest.dart';

class VendorTest extends StatefulWidget {
  const VendorTest({super.key});

  @override
  State<VendorTest> createState() => _VendorTestState();
}

class _VendorTestState extends State<VendorTest> {
  bool _isListening = false;
  @override
  void initState() {
    context.read<DiagnosticTestsCubit>().getTests();
    super.initState();
  }

  TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Tests',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton.filledTonal(
              visualDensity: VisualDensity.compact,
              onPressed: () {
                context.push('/add_tests_provided');
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                shape: MaterialStateProperty.all(CircleBorder()),
                backgroundColor: MaterialStateProperty.all(Color(0xffE5FCFC)),
              ),
              icon: Icon(Icons.add, color: Colors.black, size: 18),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              height: 38,
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor),
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
                        hintText: 'Search Tests',
                        icon: Icon(Icons.search, color: Color(0xff808080)),
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
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<DiagnosticTestsCubit, DiagnosticTestsState>(
                builder: (context, state) {
                  if (state is DiagnosticTestsLoading) {
                    return _shimmerList();
                  } else if (state is DiagnosticTestListLoaded || state is DiagnosticTestsLoadingMore) {
                    final diagnosticData = (state is DiagnosticTestListLoaded)
                        ? (state as DiagnosticTestListLoaded).tests
                        : (state as DiagnosticTestsLoadingMore).tests;
                    if (diagnosticData.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                            const Text('Oops !',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(height: 8),
                            const Text(
                              textAlign: TextAlign.center,
                              'No Data Found!',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Try Searching with a different name.',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    }
                    return NotificationListener<ScrollNotification>(
                      onNotification: (scrollInfo) {
                        if (scrollInfo.metrics.pixels >=
                            scrollInfo.metrics.maxScrollExtent * 0.9) {
                          if (state is DiagnosticTestListLoaded &&
                              state.hasNextPage) {
                            context.read<DiagnosticTestsCubit>().getMoreTests();
                          }
                          return false;
                        }
                        return false;
                      },
                      child: CustomScrollView(
                        physics:  AlwaysScrollableScrollPhysics(),
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                final item = diagnosticData[index];
                                return TouchRipple(rippleScale: 0.1,onTap: (){
                                  context.push('/test_details?id=${item.id}');
                                },
                                  child: Container(margin: EdgeInsets.only(bottom: 10),
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFAF9F6),
                                      border: Border.all(
                                        color: const Color(0xffE4E4E4),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.testDetails?.testName ?? '',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                color: Colors.black,
                                              ),
                                            ),
                                            Transform.scale(
                                              scale: 0.8,
                                              child: IconButton.filledTonal(
                                                visualDensity: VisualDensity.compact,
                                                onPressed: () {
                                                  context
                                                      .read<DiagnosticTestsCubit>()
                                                      .deleteTest(item.id ?? '');
                                                },
                                                style: ButtonStyle(
                                                  padding:
                                                  MaterialStateProperty.all(EdgeInsets.zero),
                                                  shape: MaterialStateProperty.all(
                                                      const CircleBorder()),
                                                  backgroundColor: MaterialStateProperty.all(
                                                      Colors.red.withOpacity(0.2)),
                                                ),
                                                icon: const Icon(
                                                  Icons.delete_outline_rounded,
                                                  color: Colors.black,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.58,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.testDetails?.category ?? '',
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Poppins",
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    '₹ ${item.testDetails?.price ?? 0}/-',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: "Poppins",
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    'No of tests: ${item.testDetails?.noOfTests ?? 0}',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Poppins",
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.2,
                                              height: MediaQuery.of(context).size.width * 0.18,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: Image.network(
                                                  item.testDetails?.image ?? '',
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error, stackTrace) {
                                                    return Container(color: Colors.grey[300]);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(
                                          height: 12,
                                          color: Color(0xffE6E6E6),
                                          thickness: 1,
                                        ),
                                        Row(
                                          children: [
                                            if (item.testDetails?.fastingRequired == true) ...[
                                              Image.asset('assets/ForkKnife.png', scale: 2.5),
                                              const SizedBox(width: 8),
                                              const Text(
                                                'Fast Required',
                                                style: TextStyle(
                                                  color: Color(0xff555555),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                            const Spacer(),
                                            Image.asset('assets/file.png', scale: 2.5),
                                            const SizedBox(width: 8),
                                            Text(
                                              'Reports in ${item.testDetails?.reportsDeliveredIn ?? 0} min',
                                              style: const TextStyle(
                                                color: Color(0xff555555),
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );

                              },
                              childCount: diagnosticData.length,
                            ),
                          ),
                         SliverPadding(padding: EdgeInsets.only(top: 30)),
                         if(state is DiagnosticTestsLoadingMore)
                           SliverToBoxAdapter(
                             child: Padding(
                               padding: const EdgeInsets.all(16.0),
                               child: Center(
                                 child: CircularProgressIndicator(
                                     strokeWidth: 0.8),
                               ),
                             ),
                           ),
                          SliverPadding(padding: EdgeInsets.only(bottom: 30)),
                        ],
                      ),
                    );
                  } else if (state is DiagnosticTestsError) {
                    return Center(child: Text(state.message));
                  }
                  return const Center(child: Text("No Data"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _shimmerList() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: Color(0xffD6D6D6), width: 0.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  shimmerText(120, 12, context),
                  shimmerCircle(18, context),
                ],
              ),
              SizedBox(height: 10),
              shimmerText(120, 12, context),
              SizedBox(height: 14),
              shimmerContainer(w * 0.5, 20, context),
            ],
          ),
        );
      },
    );
  }
}
