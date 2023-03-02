import 'dart:developer';

import 'package:flutter/material.dart';

import '../api/regisrtApi.dart';
import '../shareFunction/consttext.dart';

class CustomerOffer extends StatefulWidget {
  const CustomerOffer({Key? key}) : super(key: key);

  @override
  _CustomerOfferState createState() => _CustomerOfferState();
}

class _CustomerOfferState extends State<CustomerOffer> {
  List myoffer = [];

  getmyoffer() async {
    RegisterApi api = RegisterApi();
    Map data = await api.myoffers();
    setState(() {
      myoffer = data['data'];
    });
    log(myoffer.toString());
  }

  @override
  void initState() {
    getmyoffer();
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
      backgroundColor: Constant.backColor,
      appBar: AppBar(
        title: const Text('MY OFFERS'),
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
      body: myoffer.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              child: ListView.builder(
                  itemCount: myoffer.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: height * 0.2,
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Container(
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/offerupper.png"),
                                        fit: BoxFit.fill)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 8),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/logo.png'))),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                myoffer[index]['offer_price'],
                                                style: Constant
                                                    .TitleTextStyleNotBold,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                    text:
                                                        "You can use this code on any first\n booking ",
                                                    style: Constant.NotificationSubHeading,
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              "Sanio Logistics",
                                                          style: Constant
                                                              .CardtitleTextStyle)
                                                    ]),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                    text: "Important: ",
                                                    style: Constant
                                                        .NotificationSubHeading,
                                                    children: const [
                                                      TextSpan(
                                                          text:
                                                              "This code has valid \nonly first time",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.blue))
                                                    ]),
                                              ),
                                              // Text("You can use this code on any first booking ",style: Constant.NotificationSubHeading,),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.13,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/offerbottom.png",
                                  ),
                                  fit: BoxFit.fill)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Booking Confirm",
                                          style: Constant
                                              .NotificationSubHeadingWhite,
                                        ),
                                        SizedBox(
                                          height: textspacing,
                                        ),
                                        Text(
                                          myoffer[index]['offer_code'],
                                          style: Constant
                                              .CouponTitleTextStyleNotBold,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
    );
  }
}
