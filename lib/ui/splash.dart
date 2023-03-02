import 'package:flutter/material.dart';
import 'package:saniologisticdriver/util/blog.dart';

class SplasahScreen extends StatefulWidget {
  const SplasahScreen({Key? key}) : super(key: key);

  @override
  _SplasahScreenState createState() => _SplasahScreenState();
}

class _SplasahScreenState extends State<SplasahScreen> {
  @override
  void initState() {
    if (userCred.isUserLogin()) {
      Future.delayed(const Duration(seconds: 3), () {
        // Navigator.pushNamed(context, '/HomePage');
        Navigator.pushReplacementNamed(context, "/bottomNav");
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        // Navigator.pushNamed(context, '/HomePage');
        Navigator.pushReplacementNamed(context, "/login");
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splashnew.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Positioned(
          //   // top: 450,
          //   left: MediaQuery.of(context).size.width/2,
          //   // right: MediaQuery.of(context).size.width/2,
          //   bottom: MediaQuery.of(context).size.height/3,
          //   child: Center(
          //       child: GFShimmer(
          //         mainColor: Colors.white,
          //         child: Icon(
          //           Icons.circle,
          //         ),
          //       )),
          // ),
        ],
      ),
    );
  }
}
