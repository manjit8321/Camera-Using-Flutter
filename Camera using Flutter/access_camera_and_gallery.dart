import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File image = null;

  var img1 =
      "https://cdn.freebiesupply.com/logos/large/2x/dart-logo-png-transparent.png";
  var img2 =
      "https://plugins.jetbrains.com/files/9212/97400/icon/pluginIcon.png";
  var currentImage =
      "https://plugins.jetbrains.com/files/9212/97400/icon/pluginIcon.png";

  void changeImage() {
    setState(() {
      if (currentImage == img1) {
        currentImage = img2;
      } else {
        currentImage = img1;
      }
    });
  }

  Future openCamera() async {
    var img = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      this.image = img;
    });
  }

  Future openGallery() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Access your Images",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.teal[300],
        ),
        body: Center(
          child: this.image == null
              ? Image.network(
                  currentImage,
                  width: 120.0,
                  height: 120.0,
                )
              : Image.file(
                  this.image,
                  width: 300.0,
                  height: 300.0,
                ),
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.home_menu,
          children: [
            SpeedDialChild(
              child: Icon(Icons.camera),
              label: "Open Camera",
              onTap: openCamera,
            ),
            SpeedDialChild(
              child: Icon(Icons.photo),
              label: "Open Gallery",
              onTap: openGallery,
            ),
          ],
        ),
      ),
    );
  }
}
