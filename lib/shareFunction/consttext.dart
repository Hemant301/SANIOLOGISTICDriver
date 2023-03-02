import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:getwidget/components/shimmer/gf_shimmer.dart';
import 'package:intl/intl.dart';

class Constant {
  static const Color primaryColor = Color(0xff9e27b0);
  static const Color appColor = Color(0xffED17C9);
  static const Color backColor = Color(0xffF0F0F0);
  static const String baseUrl =
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
  static const String API_KEY = "AIzaSyDExoGhzKn-eH5qBNZcCD-cQz-KbZlEJnA";
  static const String baseURL =
      "https://www.taekwondofederationofindia.org/saniologistics/api/";
  static String serverErrorRes = "Server doesn't  responding !! try again";

  static TextStyle containerHeadingTextStyle =
      const TextStyle(fontSize: 25, color: Colors.white);
  static TextStyle containerSubHeadingTextStyle =
      const TextStyle(fontSize: 18, color: Colors.white);
  static TextStyle containerdreaHeadingTextStyle =
      const TextStyle(fontSize: 22, color: Colors.white);
  static TextStyle drawerListTextStyle = const TextStyle(
      fontSize: 16, color: Color(0xff39383b), fontWeight: FontWeight.w500);
  static TextStyle forLabelStyle = TextStyle(color: Colors.grey[600]);
  static TextStyle forButtonLabelStyle =
      const TextStyle(color: Colors.white, fontSize: 12);
  static TextStyle TitleTextStyle = const TextStyle(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800);
  static TextStyle TitleTextStyleNotBold =
      const TextStyle(color: Colors.black, fontSize: 20);
  static TextStyle TitleTextStyleNotBoldSmall =
      const TextStyle(color: Colors.black, fontSize: 16);
  static TextStyle SmallSubTitleTextStyle =
      const TextStyle(color: Colors.grey, fontSize: 14);
  static TextStyle SmallBlackSubTitleTextStyle =
      const TextStyle(color: Colors.black, fontSize: 14);
  static TextStyle labelTextStyle = const TextStyle(
      fontWeight: FontWeight.w800, color: Colors.black45, fontSize: 16);
  static TextStyle labelTextStyleNotBold =
      const TextStyle(color: Colors.black45, fontSize: 16);
  static TextStyle InputTextStyle =
      const TextStyle(color: Colors.black, fontSize: 16);
  static TextStyle CardtitleTextStyle = const TextStyle(
      fontWeight: FontWeight.w600, color: Colors.black, fontSize: 14);
  static TextStyle SmallSubTitleTextStyleAvailable =
      const TextStyle(color: Colors.green, fontSize: 14);
  static TextStyle SmallSubTitleTextStyleBooked =
      const TextStyle(color: Colors.red, fontSize: 14);
  static TextStyle AppColorHeadingTextStyle = const TextStyle(
      color: Constant.primaryColor, fontSize: 20, fontWeight: FontWeight.w600);
  static TextStyle NotificationSubHeading =
      const TextStyle(color: Colors.black45, fontSize: 14);
  static TextStyle NotificationSubHeadingWhite =
      const TextStyle(color: Colors.white, fontSize: 14);
  static TextStyle CouponTitleTextStyleNotBold =
      const TextStyle(color: Colors.white, fontSize: 25);
  // static final load = Center(
  //     child: GFShimmer(
  //   mainColor: Colors.blue,
  //   child: Icon(
  //     Icons.circle,
  //   ),
  // ));

  // static final load2 = Center(
  //     child: GFShimmer(
  //   mainColor: Constant.appColor,
  //   child: Icon(
  //     Icons.circle,
  //   ),
  // ));

  static void messageShow(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.tealAccent,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  static String getDate(String date) {
    return DateFormat('dd-MM-yyyy hh:mm a')
        .format(DateTime.parse(date))
        .toString();
  }

  static String getTimeOnly(String date) {
    return DateFormat('hh:mm').format(DateTime.parse(date)).toString();
  }

  static String getTimeOnlyWithAMPM(String date) {
    return DateFormat('hh:mm a').format(DateTime.parse(date)).toString();
  }

  static String getDateOnly(String date) {
    return DateFormat('dd-MM-yyyy').format(DateTime.parse(date)).toString();
  }

  static String getFirstDate(String date) {
    return DateFormat.d('en_US').format(DateTime.parse(date)).toString();
  }

  static String getDateWithText(String date) {
    return DateFormat.yMMMEd('en_US').format(DateTime.parse(date)).toString();
  }

  static String getCurrentDateTime() {
    return DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.now()).toString();
  }

  static String capitalizeAllSentence(String value) {
    // var result = value[0].toUpperCase();
    // bool caps = false;
    // bool start = true;

    // for (int i = 1; i < value.length; i++) {
    //   if (start == true) {
    //     if (value[i - 1] == " " && value[i] != " ") {
    //       result = result + value[i].toUpperCase();
    //       start = false;
    //     } else {
    //       result = result + value[i];
    //     }
    //   } else {
    //     if (value[i - 1] == " " && caps == true) {
    //       result = result + value[i].toUpperCase();
    //       caps = false;
    //     } else {
    //       if (caps && value[i] != " ") {
    //         result = result + value[i].toUpperCase();
    //         caps = false;
    //       } else {
    //         result = result + value[i];
    //       }
    //     }

    //     if (value[i] == ".") {
    //       caps = true;
    //     }
    //   }
    // }
    return value;
  }
}
