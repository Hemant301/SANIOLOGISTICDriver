import 'package:flutter/material.dart';
import 'package:saniologisticdriver/ui/addbankdetail.dart';
import 'package:saniologisticdriver/ui/assignment.dart';
import 'package:saniologisticdriver/ui/bottomNav.dart';
import 'package:saniologisticdriver/ui/corporateload.dart';
import 'package:saniologisticdriver/ui/dashboard.dart';
import 'package:saniologisticdriver/ui/idScreen.dart';
import 'package:saniologisticdriver/ui/imageview.dart';
import 'package:saniologisticdriver/ui/loadingDetails.dart';
import 'package:saniologisticdriver/ui/login.dart';
import 'package:saniologisticdriver/ui/mybooking.dart';
import 'package:saniologisticdriver/ui/notification.dart';
import 'package:saniologisticdriver/ui/offer.dart';
import 'package:saniologisticdriver/ui/otp.dart';
import 'package:saniologisticdriver/ui/points.dart';
import 'package:saniologisticdriver/ui/profile.dart';
import 'package:saniologisticdriver/ui/relateddoc.dart';
import 'package:saniologisticdriver/ui/signup.dart';
import 'package:saniologisticdriver/ui/signup2.dart';
import 'package:saniologisticdriver/ui/splash.dart';
import 'package:saniologisticdriver/ui/status.dart';
import 'package:saniologisticdriver/ui/upcomingBooking.dart';
import 'package:saniologisticdriver/ui/updatePRofile.dart';
import 'package:saniologisticdriver/ui/uploadDocument.dart';
import 'package:saniologisticdriver/util/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Driver',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: ('/splash'),
        routes: {
          "/login": (context) => const LoginPage(),
          "/splash": (context) => const SplasahScreen(),
          "/otp": (context) => const OtpPage(),
          "/signup": (context) => const SignUpScreen(),
          "/signup2": (context) => const SignUpScreen2(),
          "/dashboard": (context) => const DashBoard(),
          "/notification": (context) => const NotificationScreen(),
          "/offer": (context) => const CustomerOffer(),
          "/points": (context) => const CustomerRewardLedger(),
          "/profile": (context) => const MyProfile(),
          "/mybooking": (context) => const MyBookingScreen(),
          "/upcomingBooking": (context) => const UpComingBookingScreen(),
          "/assignment": (context) => const AssignmentScreen(),
          "/bottomNav": (context) => Nav(),
          "/idScreen": (context) => const IdScreen(),
          "/status": (context) => const StatusScreen(),
          "/corporateload": (context) => const CorporateScreen(),
          "/addbankdetail": (context) => const AddbankDetails(),
          "/uploadDocument": (context) => const DocumentUpload(),
          // "/invoicescreen": (context) =>  GenerateInvoice.create(),
          "/loadingDetails": (context) => const LoadingDetailsScreen(),
          "/imageview": (context) => const GraphZoom(),
          "/relateddoc": (context) => const RelatedDocument(),
          "/updateprofile": (context) => const UpdateProfile(),
        });
  }
}
