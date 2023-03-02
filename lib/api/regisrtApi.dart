import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:saniologisticdriver/util/blog.dart';
import 'package:saniologisticdriver/util/const.dart';

class RegisterApi {
  var client = http.Client();
  Future<dynamic> loginApi({
    String? phone = "",
  }) async {
    try {
      final response = await client.post(
          Uri.parse("$mainBaseUrl/driver/sendotp"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"phone": phone}));
      if (response.statusCode == 200) {
        log("hhhhh");
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<dynamic> verifyOtp({
    String? phone,
    otp,
    device_id,
  }) async {
    try {
      final response = await client.post(
          Uri.parse("$mainBaseUrl/driver/verifyotp"),
          headers: {"Content-Type": "application/json"},
          body:
              jsonEncode({"otp": otp, "phone": phone, "device_id": device_id}));
      log("$mainBaseUrl/driver/verifyotp");
      print(jsonEncode({"otp": otp, "phone": phone, "device_id": device_id}));
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<dynamic> signUpApi(
      {String? name, email, city, state, referral}) async {
    try {
      final response =
          await client.post(Uri.parse("$mainBaseUrl/driver/register/signup"),
              headers: {
                "Content-Type": "application/json",
                "Authorization": userCred.getApiToken(),
              },
              body: jsonEncode({
                "name": name,
                "email": email,
                "state": state,
                "city": city,
                "referral_code": referral
              }));
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<dynamic> signUpApi2(
      {String? whatsapp_no, alt_mobile_no, pan_no, aadhar_no, address}) async {
    try {
      final response =
          await client.post(Uri.parse("$mainBaseUrl/driver/register/signup2"),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode({
                "whatsapp_no": whatsapp_no,
                "alt_mobile_no": alt_mobile_no,
                "pan_no": pan_no,
                "aadhar_no": aadhar_no,
                "address": address
              }));
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<dynamic> grtprofileDataApi() async {
    try {
      final response = await client.get(
        Uri.parse("$mainBaseUrl/driver/profile/view"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": userCred.getApiToken(),
        },
      );
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<dynamic> addBankdetail(
      {String? bank_name,
      ifsc_code,
      account_type,
      account_number,
      account_holder,
      branch_name,
      branch_address}) async {
    try {
      final response =
          await client.post(Uri.parse("$mainBaseUrl/driver/add_bank_detail"),
              headers: {
                "Content-Type": "application/json",
                "Authorization": userCred.getApiToken(),
              },
              body: jsonEncode({
                "bank_name": bank_name,
                "ifsc_code": ifsc_code,
                "account_type": account_type,
                "account_number": account_number,
                "account_holder": account_holder,
                "branch_name": branch_name,
                "branch_address": branch_address
              }));
      print(userCred.getApiToken());
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<dynamic> myBooking() async {
    try {
      final response = await client.post(
        Uri.parse("$mainBaseUrl/driver/mybooking"),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "ZaZCO3SeyRfEr4oQePEKmaC2ZMxabz1Tx2KeJialuUa1wuZvWiRFxWVsnk0g",
        },
      );
      print(userCred.getApiToken());
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<dynamic> upComingbooking() async {
    try {
      final response = await client.post(
        Uri.parse("$mainBaseUrl/driver/upcomingbooking"),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "ZaZCO3SeyRfEr4oQePEKmaC2ZMxabz1Tx2KeJialuUa1wuZvWiRFxWVsnk0g",
        },
      );
      print(userCred.getApiToken());
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<dynamic> driverStatus() async {
    try {
      final response = await client.post(
        Uri.parse("$mainBaseUrl/driver/ridestatus"),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "ZaZCO3SeyRfEr4oQePEKmaC2ZMxabz1Tx2KeJialuUa1wuZvWiRFxWVsnk0g",
        },
      );
      print(userCred.getApiToken());
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<dynamic> redeamPoint() async {
    try {
      final response = await client.post(
        Uri.parse("$mainBaseUrl/driver/balance/points"),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "ZaZCO3SeyRfEr4oQePEKmaC2ZMxabz1Tx2KeJialuUa1wuZvWiRFxWVsnk0g",
        },
      );
      print(userCred.getApiToken());
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<dynamic> getNotifiation() async {
    try {
      final response = await client.get(
        Uri.parse("$mainBaseUrl/customer/notifications"),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "ZaZCO3SeyRfEr4oQePEKmaC2ZMxabz1Tx2KeJialuUa1wuZvWiRFxWVsnk0g",
        },
      );
      print(userCred.getApiToken());
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<dynamic> myoffers() async {
    try {
      final response = await client.post(
        Uri.parse("$mainBaseUrl/driver/myoffers"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": userCred.getApiToken(),
        },
      );
      print(userCred.getApiToken());
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<dynamic> locationUpdate({String? longitude, latitude}) async {
    try {
      final response =
          await client.post(Uri.parse("$mainBaseUrl/location/update"),
              headers: {
                "Content-Type": "application/json",
                "Authorization": userCred.getApiToken(),
              },
              body: jsonEncode({"longitude": longitude, "latitude": latitude}));
      log({"longitude": longitude, "latitude": latitude}.toString());
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }
}
