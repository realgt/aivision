import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'aivision.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();

    availableCameras().then((availableCameras) {
      if (availableCameras.length > 0) {
        setState(() {
          cameras = availableCameras;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (cameras == null) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = CourtVision(cameras);
    }

    return Scaffold(
      body: content,
    );
  }
}
