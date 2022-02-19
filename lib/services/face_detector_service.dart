import 'package:face_net_authentication/locator_screen.dart';
import 'package:face_net_authentication/services/camera.service.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/material.dart';



/*
Title:FaceDetectorService
Purpose:FaceDetectorService
Created By:Kalpesh Khandla
Created Date: 19 Feb 2022
*/

class FaceDetectorService {
  CameraService _cameraService = locator<CameraService>();

  FaceDetector _faceDetector;
  FaceDetector get faceDetector => _faceDetector;

  void initialize() {
    _faceDetector = GoogleMlKit.vision.faceDetector(
      FaceDetectorOptions(
        mode: FaceDetectorMode.accurate,
      ),
    );
  }

  Future<List<Face>> getFacesFromImage(CameraImage image) async {
    InputImageData _firebaseImageMetadata = InputImageData(
      imageRotation: _cameraService.cameraRotation,
      inputImageFormat: InputImageFormatMethods.fromRawValue(image.format.raw),
      size: Size(image.width.toDouble(), image.height.toDouble()),
      planeData: image.planes.map(
        (Plane plane) {
          return InputImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width,
          );
        },
      ).toList(),
    );

    InputImage _firebaseVisionImage = InputImage.fromBytes(
      bytes: image.planes[0].bytes,
      inputImageData: _firebaseImageMetadata,
    );

    List<Face> faces = await _faceDetector.processImage(_firebaseVisionImage);
    return faces;
  }

  dispose() {
    _faceDetector.close();
  }
}
