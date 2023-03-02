import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saniologisticdriver/api/regisrtApi.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  var userTypeSelectedValue = 'Customer',
      stateSelectedValue,
      selectedCityValue,
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
  final bool _load = false;
  List listStates = [], listStates2 = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  var userId, apiToken;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var fieldHeight = height * 0.07;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              // padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
              decoration: const BoxDecoration(
                // gradient: LinearGradient(
                //     begin: Alignment.centerRight,
                //     end: Alignment.centerLeft,
                //     colors: [
                //       Color(0xff9e27b0),
                //       Color(0xffED17C9)
                //     ]
                // ),
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
                  // SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'SignUp',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
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
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                controller: nameController,
                                style: TextStyle(color: Colors.grey[600]),
                                decoration: const InputDecoration(
                                  // labelStyle: Constant.forLabelStyle,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                  counter: Offstage(),
                                  // contentPadding: EdgeInsets.symmetric(vertical: 20),
                                  hintText: 'Name',
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
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                                controller: emailController,
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
                                  hintText: 'Email',
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
                                    return 'Please enter referral code';
                                  }
                                  return null;
                                },
                                // controller: RCController,
                                style: TextStyle(color: Colors.grey[600]),
                                decoration: const InputDecoration(
                                  // labelStyle: Constant.forLabelStyle,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.people_outline_rounded,
                                    color: Colors.grey,
                                  ),
                                  counter: Offstage(),
                                  // contentPadding: EdgeInsets.symmetric(vertical: 20),
                                  hintText: 'Referral code',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () async {
                              if (nameController.text == "") {
                                // print("${(phonecontroller.text).length <= 9}");
                                Fluttertoast.showToast(
                                    msg: "Invalid name !",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);

                                return;
                              }
                              setState(() {
                                loading = true;
                              });

                              RegisterApi authapi = RegisterApi();
                              try {
                                Map data = await authapi.signUpApi(
                                    name: nameController.text,
                                    email: emailController.text,
                                    state: "jharkhand",
                                    city: "latehar",
                                    referral: referralController.text);
                                print(data["status"].runtimeType);

                                if (data["status"] == true) {
                                  //  userCred.addUserId(data["user"]["_id"]);
                                  setState(() {
                                    loading = false;
                                  });
                                  Future.delayed(const Duration(seconds: 0),
                                      () {
                                    Navigator.pushNamed(context, "/signup2");
                                  });
                                } else {
                                  setState(() {
                                    loading = false;
                                  });
                                  Fluttertoast.showToast(
                                      msg: " ${data['message']}! ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              } catch (e) {}
                              // Navigator.pushReplacementNamed(context, '/main');
                            },
                            child: Container(
                              height: 40,
                              // width: MediaQuery.of(context).size.width-80,
                              // margin: EdgeInsets.symmetric(horizontal: 20,
                              // vertical: 10),
                              // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              width: double.infinity,
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
                                    color:
                                        const Color(0xff9e27b0).withOpacity(.5),
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
