import 'package:flutter/material.dart';

class LoadingDetailsScreen extends StatelessWidget {
  const LoadingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading Details'),
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "vehicle No :",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("582424")
                                  ],
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Booking Id :",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("87527284")
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Source:  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("latehar")
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Destination:  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("latehar")
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Load Type:  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("20TN")
                                // Text(DateFormat('yyyy-MM-dd')
                                //     .format(DateTime.parse(currentBooking['date']) ??
                                //         DateTime.now())
                                //     .toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Shedule Date:  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(DateTime.now().toString())
                                // Text(DateFormat('HH:mm:ss')
                                //     .format(DateTime.parse(currentBooking['date']) ??
                                //         DateTime.now())
                                //     .toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Material Type:  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("Cemint")
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Helper:  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("yes")
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Vehicle Owner Mobile Number:  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("820925564")
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Driver Name(1):  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("Hemant")
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Driver Name(2):  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("santosh")
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Consignment Id:  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("4564565642")
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Customer Name:  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("hmant")
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Customer Mobile:  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("452452452")
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "View Related Document  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Invoice",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "View",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Bilty",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "View",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Weighment Slip",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "View",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "E Way Bill",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "View",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Other",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "View",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    ),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
