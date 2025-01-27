import 'package:agroguru/src/config/global.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      Global.cameras[0],
      ResolutionPreset.ultraHigh,
    );
    controller.initialize().then(
          (value) => setState(
            () {},
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Scaffold(
        body: Container(
          child: Text('Camera Not Initialized'),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 844.h,
              width: 390.w,
              child: CameraPreview(controller),
            ),
          ),
          Positioned(
            bottom: 30.h,
            width: 390.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60.h,
                    width: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(64.r),
                    ),
                    child: Icon(Icons.videocam),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 70.h,
                    width: 70.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(64.r),
                    ),
                    child: Icon(Icons.camera_alt),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60.h,
                    width: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(64.r),
                    ),
                    child: Icon(Icons.switch_camera),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
