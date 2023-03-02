import 'package:flutter/material.dart';
import 'package:saniologisticdriver/shareFunction/testfiledss.dart';

class IdScreen extends StatelessWidget {
  const IdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('ID'),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Color(0xff9e27b0),
                        Color(0xffED17C9),
                      ])),
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 5, color: Colors.white)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.white,
                              ),
                            )),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Image.asset(
                            "assets/logo.png",
                            height: 50,
                            width: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Driver Id      :  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("745556666",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Name           :  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("74556",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "ESI                :  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("746",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "PF                 :  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("745556666",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "MOB No       :  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("745556666",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Address       :  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("ranchi jharkhand",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Textfiless(
            icon: Icons.person,
            title: "PAN Card",
          ),
          const SizedBox(
            height: 10,
          ),
          Textfiless(
            icon: Icons.person,
            title: "Aadhar Card",
          ),
          const SizedBox(
            height: 10,
          ),
          Textfiless(
            icon: Icons.person,
            title: "Driving License",
          ),
          const SizedBox(
            height: 10,
          ),
          Textfiless(
            icon: Icons.person,
            title: "RC Book",
          ),
          const SizedBox(
            height: 10,
          ),
          Textfiless(
            icon: Icons.person,
            title: "Insurance",
          ),
          const SizedBox(
            height: 10,
          ),
          Textfiless(
            icon: Icons.person,
            title: "Permit",
          ),
          const SizedBox(
            height: 10,
          ),
          Textfiless(
            icon: Icons.person,
            title: "Corporate Id",
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/bottomNav");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width - 80,
                // margin: EdgeInsets.symmetric(horizontal: 20,
                // vertical: 10),
                // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff9e27b0), Color(0xffED17C9)]),
                  // color:Color(0xff9e27b0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      // spreadRadius: 12,
                      offset: const Offset(5, 5),
                      color: const Color(0xff9e27b0).withOpacity(.5),
                    ),
                  ],
                ),
                child: const Center(
                    child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
