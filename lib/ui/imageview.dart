import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class GraphZoom extends StatefulWidget {
  const GraphZoom({super.key});

  @override
  State<GraphZoom> createState() => _GraphZoomState();
}

class _GraphZoomState extends State<GraphZoom> {
  String img = "";
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    // print("${data['ACCId']}}-------------123");
    img = data['img'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.pink,
          ),
        ),
        title: const Text(
          "View Document",
          style: TextStyle(
              color: Colors.pink,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: Container(
          child: PhotoView(
        backgroundDecoration: const BoxDecoration(
          color: Colors.white,
        ),
        imageProvider: NetworkImage(img.toString()),
      )),
    );
  }
}
