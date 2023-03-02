import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../api/regisrtApi.dart';

class UpComingBookingScreen extends StatefulWidget {
  const UpComingBookingScreen({super.key});

  @override
  State<UpComingBookingScreen> createState() => _UpComingBookingScreenState();
}

class _UpComingBookingScreenState extends State<UpComingBookingScreen> {
  List upComingbooking = [];

  getupComingbooking() async {
    log("upComingBooking");
    RegisterApi api = RegisterApi();
    Map data = await api.upComingbooking();
    setState(() {
      upComingbooking = data['upcomingbooking'];
    });
    log(upComingbooking.toString());
  }

  @override
  void initState() {
    getupComingbooking();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('UpComing Booking'),
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
      body: SingleChildScrollView(
        child: upComingbooking.isEmpty
            ? const Center(
                child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ))
            : Column(
                children: List.generate(
                upComingbooking.length,
                (index) => Faqbutton(
                  status: upComingbooking[index]['status'].toString(),
                  booking_id: upComingbooking[index]['booking_id'].toString(),
                  date: DateFormat('yyyy-MM-dd')
                      .format(DateTime.parse(upComingbooking[index]
                                  ['booking_date']
                              .toString()) ??
                          DateTime.now())
                      .toString(),
                  lode_type: upComingbooking[index]['loadtype'].toString(),
                  material_type:
                      upComingbooking[index]['material_type'].toString(),
                  driver_name: upComingbooking[index]['drivername'].toString(),
                  rve_contact: upComingbooking[index]['rvecontact'].toString(),
                  source: upComingbooking[index]['source'].toString(),
                  distatition: upComingbooking[index]['destination'].toString(),
                  driver_contact:
                      upComingbooking[index]['destination'].toString(),
                  time: DateFormat('HH:mm:ss')
                      .format(DateTime.parse(upComingbooking[index]
                                  ['booking_date']
                              .toString()) ??
                          DateTime.now())
                      .toString(),
                ),
              )),
      ),
    );
  }
}

class Faqbutton extends StatefulWidget {
  Faqbutton(
      {Key? key,
      this.status,
      this.booking_id,
      this.date,
      this.time,
      this.source,
      this.distatition,
      this.driver_name,
      this.driver_number,
      this.lode_type,
      this.material_type,
      this.rve_contact,
      this.driver_contact})
      : super(
          key: key,
        );
  String? status,
      booking_id,
      date,
      driver_contact,
      time,
      source,
      distatition,
      lode_type,
      material_type,
      rve_contact,
      driver_name,
      driver_number;

  @override
  State<Faqbutton> createState() => _FaqbuttonState();
}

class _FaqbuttonState extends State<Faqbutton> {
  int expand = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (expand == 1) {
            setState(() {
              expand = 0;
            });
          } else {
            setState(() {
              expand = 1;
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xff9e27b0),
                    Color(0xffED17C9),
                  ]),
              color: Colors.purple.shade200,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            "Upcoming Booking",
                            style: TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: expand == 0
                                ? const Icon(
                                    Icons.arrow_drop_down,
                                    size: 40,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.arrow_drop_up,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                          )
                        ],
                      ),
                      expand == 0
                          ? Container()
                          : Column(
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Your Booking     :  ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("booking configuration")
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Booking Date     :  ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("booking configuration")
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Vehicle No          :  ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("booking configuration")
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            Text(widget.status!)
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
                            Text(widget.booking_id!)
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
                            Text(widget.date!)
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
                            Text(widget.time!)
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
                            Text(widget.source!)
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
                            Text(widget.distatition!)
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  )),
              expand == 0
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Load Type      :  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.lode_type!)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Loaging Time    :  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.time!)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Material Type     :  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.material_type!)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "RVE Contact     :  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.rve_contact!)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Driver  Mobile Number   :  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.driver_contact!)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Driver Name(1)   :  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.driver_name!)
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(4.0),
                          //   child: Row(
                          //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: const [
                          //       Text(
                          //         "Driver Name(2)   :  ",
                          //         style: TextStyle(
                          //             color: Colors.black,
                          //             fontSize: 15,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //       Text("Santosh Kumar")
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
