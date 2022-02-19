import 'package:face_net_authentication/services/camera.service.dart';
import 'package:face_net_authentication/services/ml_service.dart';
import 'package:face_net_authentication/services/face_detector_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;


/*
Title:Locator Screen
Purpose:Locator Screen
Created By:Kalpesh Khandla
Created Date: 19 Feb 2022
*/

void setupServices() {
  locator.registerLazySingleton<CameraService>(() => CameraService());
  locator.registerLazySingleton<FaceDetectorService>(() => FaceDetectorService());
  locator.registerLazySingleton<MLService>(() => MLService());
}
