import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:saniologisticdriver/api/regisrtApi.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({super.key});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  List assignList = [];
  getData() async {
    Map data = await callApi.fetchassignmentList();
    setState(() {
      assignList = data['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Assignment'),
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
        child: Column(children: [
          Column(
            children: List.generate(
              5,
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Container(
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color(0xff9e27b0),
                                  Color(0xffED17C9),
                                ]),
                            color: Color.fromARGB(255, 10, 143, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: const [
                                    Text(
                                      "Vehicle No :",
                                      style: TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "7677665",
                                      style: TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "Booking Id :",
                                      style: TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "7677665",
                                      style: TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
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
                                children: const [
                                  Text(
                                    "Source             :  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Ranchi")
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Destination     :  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Delhi")
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Load Type             :  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("20 To")
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Schedule Date      :  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(DateTime.now().toString())
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Material Type       :  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("cenent")
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Helper  :  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Ranchi")
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Vehicle Owner Mobile Number  :  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("8210925188")
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Assigned Active Driver :  ",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Hemant Kumar",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const Divider(
                                thickness: 3,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Assignment of new driver",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Primary Driver\nName",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 30,
                                  // width: MediaQuery.of(context).size.width - 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: const Color(0xff8F8F8F),
                                        width: 2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: const Offset(
                                            1, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: DropDown(
                                    showUnderline: false,
                                    items: const [
                                      "Hemant",
                                      "santosh",
                                      "Ravi",
                                      "Ranjit"
                                    ],
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    hint: const Text("Select a Driver Name"),
                                    icon: const Icon(
                                      Icons.expand_more,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Secondary Driver\nName",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 30,
                                  // width: MediaQuery.of(context).size.width - 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: const Color(0xff8F8F8F),
                                        width: 2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: const Offset(
                                            1, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: DropDown(
                                    showUnderline: false,
                                    items: const [
                                      "Hemant",
                                      "santosh",
                                      "Ravi",
                                      "Ranjit"
                                    ],
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    hint: const Text("Select a Driver Name"),
                                    icon: const Icon(
                                      Icons.expand_more,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/otp");
                              },
                              child: Container(
                                height: 30,
                                width: 150,
                                // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xff9e27b0),
                                        Color(0xffED17C9)
                                      ]),
                                  // color:Color(0xff9e27b0),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      // spreadRadius: 12,
                                      offset: const Offset(5, 5),
                                      color: const Color(0xff9e27b0)
                                          .withOpacity(.5),
                                    ),
                                  ],
                                ),
                                child: const Center(
                                    child: Text(
                                  'Assing',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
