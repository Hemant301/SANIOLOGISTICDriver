import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:saniologisticdriver/api/regisrtApi.dart';

import '../shareFunction/consttext.dart';

class CustomerRewardLedger extends StatefulWidget {
  const CustomerRewardLedger({Key? key}) : super(key: key);

  @override
  _CustomerRewardLedgerState createState() => _CustomerRewardLedgerState();
}

class _CustomerRewardLedgerState extends State<CustomerRewardLedger> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Map pointData = {};
  List txnsdata = [];

  getPonitData() async {
    RegisterApi api = RegisterApi();
    Map data = await api.redeamPoint();
    setState(() {
      pointData = data;

      txnsdata = data["txnsdata"];
    });
    log(pointData.toString());
  }

  @override
  void initState() {
    getPonitData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var upperspacing = height * 0.035;
    var textspacing = height * 0.010;
    var divider = height * 0.06;
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: const Text('Points'),
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
        body: SafeArea(
          child: pointData.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/drawerimage.jpg'),
                              fit: BoxFit.fill,
                            ),
                            // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // InkWell(
                            //   onTap: () {
                            //     _scaffoldKey.currentState.openDrawer();
                            //   },
                            //   child:  IconButton(
                            //       icon: Icon(
                            //     Icons.navigate_before,
                            //     color: Colors.white,
                            //   )),
                            // ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              // margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.2,right: MediaQuery.of(context).size.width-330),
                              height: MediaQuery.of(context).size.height * 0.16,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total Earn Point : ${pointData['totalpoint'].toString()}',
                                    style: Constant.TitleTextStyleNotBold,
                                  ),
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  Text(
                                    'Reedeem Point : ${pointData['redeembalancepoint'].toString()}',
                                    style: Constant.TitleTextStyleNotBold,
                                  ),
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  Text(
                                    'Balance Point : ${pointData['balancepoint'].toString()}',
                                    style: Constant.TitleTextStyleNotBold,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: txnsdata.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(
                                        left: 02,
                                        right: 02,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Constant.primaryColor,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(0),
                                            topLeft: Radius.circular(0)),
                                      ),
                                      height: 03),
                                  Card(
                                    elevation: 1,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              const Image(
                                                image: AssetImage(
                                                  "assets/45.png",
                                                ),
                                                width: 60,
                                              ),
                                              Text(
                                                "${txnsdata[index]['points']} Point",
                                                style: const TextStyle(
                                                    color:
                                                        Constant.primaryColor,
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            left: 02,
                                            right: 02,
                                          ),
                                          decoration: const BoxDecoration(
                                            color: Colors.black45,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(0),
                                                topLeft: Radius.circular(0)),
                                          ),
                                          height: height * 0.08,
                                          width: 2,
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                    text: "Date: ",
                                                    style: Constant
                                                        .NotificationSubHeading,
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              "${txnsdata[index]['date']}",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black))
                                                    ]),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                    text: "Transaction ID: ",
                                                    style: Constant
                                                        .NotificationSubHeading,
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              "${txnsdata[index]['txnid']}",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black))
                                                    ]),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                    text: "Point: ",
                                                    style: Constant
                                                        .NotificationSubHeading,
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              "${txnsdata[index]['points']}",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black))
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
        ));
  }
}
