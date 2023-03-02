import 'package:flutter/material.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({Key? key}) : super(key: key);

  @override
  _SignUpScreen2State createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  final _formKey = GlobalKey<FormState>();
  var userTypeSelectedValue = 'User Type',
      stateSelectedValue = 'State',
      selectedCityValue = 'City',
      role;
  List<String> userType = [
    'Customer',
    'Transporter',
    'Vehicle Owner',
    'Driver',
    'Rve',
    'Booking Agent'
  ];
  List<String> statelist = ['State', 'Jharkhand', 'Chhattisgarh ', 'Bihar'];
  List<String> citylist = ['City', 'Ranchi', 'Patna ', 'Bokaro'];

  TextEditingController whatsappController = TextEditingController();
  TextEditingController altmobileController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  var apiToken, userId;

  @override
  Widget build(BuildContext context) {
    String panpattern = r'(^[A-Z]{5}[0-9]{4}[A-Z]{1}$)';
    RegExp panregex = RegExp(panpattern);
    String adharpattern = r'(^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$)';
    RegExp adharregex = RegExp(adharpattern);
    String gstpattern =
        r'(^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}[A-Z]{1}Z[0-9]{1}$)';
    RegExp gstregex = RegExp(gstpattern);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var fieldHeight = height * 0.07;
    return Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: Constant.primaryColor,
      //   automaticallyImplyLeading: false,
      //   elevation: 0.0,
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //             begin: Alignment.topLeft,
      //             end: Alignment.bottomRight,
      //             colors: <Color>[
      //               Color(0xffED17C9),
      //               Color(0xff9e27b0),
      //
      //             ])
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              // padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/drawerimage.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(60)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 10,
                        shape: const CircleBorder(),
                        child: Container(
                          height: 100,
                          width: 100,
                          // padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/profile.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 20,bottom: 0,),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     // crossAxisAlignment: CrossAxisAlignment.end,
                  //     children: [
                  //       Text('SignUp',style: TextStyle(fontSize: 25,color: Colors.white),),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Form(
                    // key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: 5,
                          // ),
                          SizedBox(
                            height: fieldHeight,
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1.0,
                                ),
                              ),
                              child: TextFormField(
                                // keyboardType: TextInputType.number,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter whatsApp no.';
                                  }
                                  return null;
                                },
                                // controller: whatsappController,
                                style: const TextStyle(color: Colors.grey),
                                decoration: const InputDecoration(
                                  // labelStyle: Constant.forLabelStyle,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                  counter: Offstage(),
                                  // contentPadding: EdgeInsets.symmetric(vertical: 20),
                                  hintText: 'WhatsApp Mobile No.',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: fieldHeight,
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1.0,
                                ),
                              ),
                              child: TextFormField(
                                // keyboardType: TextInputType.number,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Alternate Mobile No.';
                                  }
                                  return null;
                                },
                                // controller: altmobileController,
                                style: TextStyle(color: Colors.grey[600]),
                                decoration: const InputDecoration(
                                  // labelStyle: Constant.forLabelStyle,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                  counter: Offstage(),
                                  // contentPadding: EdgeInsets.symmetric(vertical: 20),
                                  hintText: 'Alternate Mobile No.',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: fieldHeight,
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1.0,
                                ),
                              ),
                              child: TextFormField(
                                // keyboardType: TextInputType.number,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter PAN No.';
                                  }
                                  return null;
                                },
                                // controller: panController,
                                style: TextStyle(color: Colors.grey[600]),
                                decoration: const InputDecoration(
                                  // labelStyle: Constant.forLabelStyle,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                  counter: Offstage(),
                                  // contentPadding: EdgeInsets.symmetric(vertical: 20),
                                  hintText: 'PAN Number',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: fieldHeight,
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1.0,
                                ),
                              ),
                              child: TextFormField(
                                // keyboardType: TextInputType.number,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter PAN No.';
                                  }
                                  return null;
                                },
                                // controller: aadharController,
                                style: TextStyle(color: Colors.grey[600]),
                                decoration: const InputDecoration(
                                  // labelStyle: Constant.forLabelStyle,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                  counter: Offstage(),
                                  // contentPadding: EdgeInsets.symmetric(vertical: 20),
                                  hintText: 'Aadhar Number',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: fieldHeight,
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1.0,
                                ),
                              ),
                              child: TextFormField(
                                // keyboardType: TextInputType.number,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Address';
                                  }
                                  return null;
                                },
                                // controller: addressController,
                                style: TextStyle(color: Colors.grey[600]),
                                decoration: const InputDecoration(
                                  // labelStyle: Constant.forLabelStyle,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                  counter: Offstage(),
                                  // contentPadding: EdgeInsets.symmetric(vertical: 20),
                                  hintText: 'Address',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: fieldHeight,
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1.0,
                                ),
                              ),
                              child: TextFormField(
                                // keyboardType: TextInputType.number,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Company';
                                  }
                                  return null;
                                },
                                // controller: companyController,
                                style: TextStyle(color: Colors.grey[600]),
                                decoration: const InputDecoration(
                                  // labelStyle: Constant.forLabelStyle,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                  counter: Offstage(),
                                  // contentPadding: EdgeInsets.symmetric(vertical: 20),
                                  hintText: 'Company',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: fieldHeight,
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1.0,
                                ),
                              ),
                              child: TextFormField(
                                // keyboardType: TextInputType.number,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter GST No.';
                                  }
                                  return null;
                                },
                                // controller: gstController,
                                style: TextStyle(color: Colors.grey[600]),
                                decoration: const InputDecoration(
                                  // labelStyle: Constant.forLabelStyle,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                  counter: Offstage(),
                                  // contentPadding: EdgeInsets.symmetric(vertical: 20),
                                  hintText: 'GST Number',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                
                                },
                                child: Container(
                                  height: 40,
                                
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
                                    'Skip',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/bottomNav");
                                },
                                child: Container(
                                  height: 40,
                                  // width: MediaQuery.of(context).size.width-80,
                                  // margin: EdgeInsets.symmetric(horizontal: 20,
                                  // vertical: 10),
                                  // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                  // width: double.infinity,
                                  width: 150,
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
                                    'Next',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
