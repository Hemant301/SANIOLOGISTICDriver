import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../api/regisrtApi.dart';
import '../shareFunction/consttext.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  List getMyBooking = [];
  Map currentBooking = {};
  getMyBookingapi() async {
    RegisterApi api = RegisterApi();
    Map data = await api.myBooking();
    setState(() {
      currentBooking = data['currentbooking'];
      getMyBooking = data['previousbooking'];
    });
    log(getMyBooking.toString());
  }

  @override
  void initState() {
    getMyBookingapi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backColor,
      appBar: AppBar(
        title: const Text('My Booking'),
        centerTitle: true,
        // backgroundColor: Constant.primaryColor,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color(0xff9e27b0),
                Color(0xffED17C9),
              ])),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: getMyBooking.isEmpty || currentBooking.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Column(
                        children: List.generate(
                          1,
                          (index) => InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/loadingDetails");
                            },
                            child: Container(
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Center(
                                        //   child: Container(
                                        //     height: 75,
                                        //     width: 75,
                                        //     decoration: BoxDecoration(
                                        //         borderRadius: BorderRadius.circular(90),
                                        //         image: const DecorationImage(
                                        //             image: AssetImage('assets/logo.png'))),
                                        //   ),
                                        // ),
                                        const Text(
                                          "Current Booking",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Status             :  ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(currentBooking['status']
                                                .toString())
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Booking Id     :  ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(currentBooking['booking_id']
                                                .toString())
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Date                :  ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(DateFormat('yyyy-MM-dd')
                                                .format(DateTime.parse(
                                                        currentBooking[
                                                            'date']) ??
                                                    DateTime.now())
                                                .toString()),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Time               :  ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(DateFormat('HH:mm:ss')
                                                .format(DateTime.parse(
                                                        currentBooking[
                                                            'date']) ??
                                                    DateTime.now())
                                                .toString()),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),

                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Source            :  ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(currentBooking['source']
                                                .toString())
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Destionation  :  ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(currentBooking['source']
                                                .toString())
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Previous Booking Completed",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: List.generate(
                                getMyBooking.length,
                                (index) => AllConsultCard(
                                      startDate: getMyBooking[index]
                                              ['start_date']
                                          .toString(),
                                      co_id: getMyBooking[index]
                                              ['consignmentid'] ??
                                          "Not Found",
                                      compDate: getMyBooking[index]
                                              ['complete_date']
                                          .toString(),
                                      startTime: getMyBooking[index]
                                              ['start_time']
                                          .toString(),
                                      endTime: getMyBooking[index]
                                              ['complete_time']
                                          .toString(),
                                    )),
                          )
                        ],
                      )
                    ]),
        ),
      ),
    );
  }
}

class AllConsultCard extends StatelessWidget {
  final String? co_id, startDate, compDate, startTime, endTime;

  const AllConsultCard({
    Key? key,
    this.co_id,
    this.startDate,
    this.endTime,
    this.startTime,
    this.compDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ScreenUtil().setHeight(130),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 10, 143, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Consignment Id: $co_id",
                    style: const TextStyle(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  "Starting Date",
                  style: TextStyle(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Completed Date",
                  style: TextStyle(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const Divider(
            thickness: 5,
            height: 2,
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Date : $startDate",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Date : $compDate",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Time: $startTime",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Time: $endTime",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          //   child: RichText(
          //     overflow: TextOverflow.ellipsis,
          //     textAlign: TextAlign.end,
          //     softWrap: true,
          //     maxLines: 1,
          //     textScaleFactor: 1,
          //     text: TextSpan(
          //       text: 'Patient Name :',
          //       style: DefaultTextStyle.of(context).style.copyWith(
          //             fontSize: 13,
          //             color: Colors.black,
          //             fontWeight: FontWeight.w500,
          //           ),
          //       children: <TextSpan>[
          //         TextSpan(
          //           text: ' $patientName / $patientAge / $patientGender',
          //           style: const TextStyle(
          //             fontSize: 13,
          //             color: Colors.blue,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
