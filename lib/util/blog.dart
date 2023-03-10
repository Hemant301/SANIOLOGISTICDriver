import 'package:saniologisticdriver/util/storage.dart';

class UserCred {
  bool isUserLogin() {
    String isActive = StorageUtil.getString('USERID');
    //print("ff${isActive}ff");
    return isActive == '' ? false : true;
  }

  bool isHavePincode() {
    String isActive = StorageUtil.getString('PINCODE');
    //print("ff${isActive}ff");
    return isActive == '' ? false : true;
  }

  String getUserId() {
    String isActive = StorageUtil.getString('USERID');
    //print("ff${isActive}ff");
    return isActive;
  }

  String getUserName() {
    String isActive = StorageUtil.getString('NAME');
    //print("ff${isActive}ff");
    return isActive;
  }

  String getUserImage() {
    String isActive = StorageUtil.getString('IMAGE');
    //print("ff${isActive}ff");
    return isActive;
  }

  String getPincode() {
    String isActive = StorageUtil.getString('PINCODE');
    return isActive;
  }

  String getLng() {
    String isActive = StorageUtil.getString('LNG');
    return isActive;
  }

  String getLat() {
    String isActive = StorageUtil.getString('LAT');
    return isActive;
  }

  String getDeviceId() {
    String isActive = StorageUtil.getString('DeviceId');
    return isActive;
  }

  String getApiToken() {
    String isActive = StorageUtil.getString('ApiToken');
    return isActive;
  }

  bool getPincodeAvail() {
    String isActive = StorageUtil.getString('AVAIL');
    return isActive == 'true' ? true : false;
  }

  void addUserId(String id) {
    StorageUtil.putString('USERID', id);
  }

  void addUsername(String name) {
    StorageUtil.putString('NAME', name);
  }

  void addDeviceId(String name) {
    StorageUtil.putString('DeviceId', name);
  }

  void addApiToken(String name) {
    StorageUtil.putString('ApiToken', name);
  }

  void addUserimage(String image) {
    StorageUtil.putString('IMAGE', image);
  }

  void addPincode(String pin) {
    StorageUtil.putString('PINCODE', pin);
  }

  void setShop(String info) {
    StorageUtil.putString('INFO', info);
  }

  void setBank(String info) {
    StorageUtil.putString('INFO', info);
  }

  void setSchool(String info) {
    StorageUtil.putString('INFO', info);
  }

  void setCategory(String info) {
    StorageUtil.putString('INFO', info);
  }

  void addPincodeAvail(bool isAvail) {
    StorageUtil.putString('AVAIL', '$isAvail');
  }

  void addLatLng({double lat = 0.0, double lng = 0.0}) {
    StorageUtil.putString('LAT', '$lat');
    StorageUtil.putString('LNG', '$lng');
  }

  void logoutUser() {
    StorageUtil.putString('USERID', '');
    StorageUtil.putString('PINCODE', '');
    StorageUtil.putString('LAT', '');
    StorageUtil.putString('LNG', '');
    StorageUtil.putString('AVAIL', 'false');
    StorageUtil.clearAll();
  }
}

final userCred = UserCred();
