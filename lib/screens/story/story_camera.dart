// import 'package:camera/camera.dart';
// import 'package:foap/helper/file_extension.dart';
// import 'package:foap/screens/add_on/controller/reel/create_reel_controller.dart';
// import 'package:foap/helper/imports/common_import.dart';
// import 'package:foap/screens/story/text_story_maker/text_story_maker_view.dart';
// import '../../helper/story_editor/vs_story_designer.dart';
// import '../chat/media.dart';
// import '../content_creator_view.dart';
// import '../home_feed/story_uploader.dart';
//
// enum StoryContentMode { text, camera }
//
// class StoryCameraController extends GetxController {
//   Rx<StoryContentMode> storyContentMode = StoryContentMode.camera.obs;
//
//   selectStoryContentMode(StoryContentMode mode) {
//     storyContentMode.value = mode;
//   }
// }
//
// class StoryCameraScreen extends StatefulWidget {
//   const StoryCameraScreen({super.key});
//
//   @override
//   State<StoryCameraScreen> createState() => _StoryCameraScreenState();
// }
//
// class _StoryCameraScreenState extends State<StoryCameraScreen>
//     with TickerProviderStateMixin {
//   final CreateReelController _createReelController = Get.find();
//   AnimationController? animationController;
//   final StoryCameraController storyCameraController = StoryCameraController();
//
//   @override
//   void initState() {
//     _initAnimation();
//     super.initState();
//   }
//
//   @override
//   void didUpdateWidget(covariant StoryCameraScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _initAnimation();
//   }
//
//   @override
//   void dispose() {
//     _createReelController.clear();
//     super.dispose();
//   }
//
//   _initAnimation() {
//     animationController = AnimationController(
//         vsync: this,
//         duration:
//             Duration(seconds: _createReelController.recordingLength.value));
//     animationController!.addListener(() {
//       setState(() {});
//     });
//     animationController!.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         stopRecording();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AppScaffold(
//         backgroundColor: AppColorConstants.backgroundColor,
//         body: TextStoryMakerView(
//           textFieldFocusChanged: (status) {},
//         ));
//     // return AppScaffold(
//     //   backgroundColor: AppColorConstants.backgroundColor,
//     //   body: Obx(() => storyCameraController.storyContentMode.value ==
//     //           StoryContentMode.camera
//     //       ? Column(
//     //           children: [
//     //             const SizedBox(
//     //               height: 40,
//     //             ),
//     //             Stack(
//     //               alignment: Alignment.center,
//     //               children: [
//     //                 const CameraView(),
//     //                 Positioned(
//     //                   left: 15,
//     //                   right: 15,
//     //                   top: 25,
//     //                   child: Column(
//     //                     children: [
//     //                       Row(
//     //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //                         children: [
//     //                           Container(
//     //                                   color: AppColorConstants.themeColor,
//     //                                   child:
//     //                                       ThemeIconWidget(ThemeIcon.close).p4)
//     //                               .circular
//     //                               .ripple(() {
//     //                             Get.back();
//     //                           }),
//     //                         ],
//     //                       ),
//     //                     ],
//     //                   ),
//     //                 ),
//     //                 Positioned(
//     //                   left: 15,
//     //                   top: 150,
//     //                   child: Container(
//     //                     color: AppColorConstants.cardColor.withOpacity(0.4),
//     //                     child: Column(
//     //                       children: [
//     //                         GestureDetector(
//     //                           onTap: () {
//     //                             final cameraService =
//     //                                 Get.find<CameraControllerService>();
//     //
//     //                             if (cameraService
//     //                                     .controller.description.lensDirection ==
//     //                                 CameraLensDirection.back) {
//     //                               cameraService.initializeCamera(
//     //                                   CameraLensDirection.front);
//     //                             } else {
//     //                               cameraService.initializeCamera(
//     //                                   CameraLensDirection.back);
//     //                             }
//     //                           },
//     //                           child: Icon(
//     //                             Icons.cameraswitch_outlined,
//     //                             size: 30,
//     //                             color: AppColorConstants.themeColor,
//     //                           ),
//     //                         ),
//     //                         const SizedBox(
//     //                           height: 25,
//     //                         ),
//     //                         Obx(() => GestureDetector(
//     //                               onTap: () {
//     //                                 final cameraService =
//     //                                     Get.find<CameraControllerService>();
//     //                                 if (_createReelController
//     //                                     .flashSetting.value) {
//     //                                   cameraService.controller
//     //                                       .setFlashMode(FlashMode.off);
//     //                                   _createReelController.turnOffFlash();
//     //                                 } else {
//     //                                   cameraService.controller
//     //                                       .setFlashMode(FlashMode.always);
//     //                                   _createReelController.turnOnFlash();
//     //                                 }
//     //                               },
//     //                               child: Icon(
//     //                                 _createReelController.flashSetting.value
//     //                                     ? Icons.flash_on
//     //                                     : Icons.flash_off,
//     //                                 size: 30,
//     //                                 color: AppColorConstants.themeColor,
//     //                               ),
//     //                             )),
//     //                         const SizedBox(
//     //                           height: 25,
//     //                         ),
//     //                         GestureDetector(
//     //                           onTap: () {
//     //                             _createReelController.updateRecordingLength(15);
//     //                             _initAnimation();
//     //                           },
//     //                           child: ThemeIconWidget(
//     //                             ThemeIcon.text,
//     //                             size: 30,
//     //                           ).ripple(() {
//     //                             storyCameraController.selectStoryContentMode(
//     //                                 StoryContentMode.text);
//     //                           }),
//     //                         ),
//     //                         const SizedBox(
//     //                           height: 25,
//     //                         ),
//     //                         GestureDetector(
//     //                           onTap: () {
//     //                             _createReelController.updateRecordingLength(30);
//     //                             _initAnimation();
//     //                           },
//     //                           child: ThemeIconWidget(ThemeIcon.boomerang),
//     //                         )
//     //                       ],
//     //                     ).setPadding(left: 8, right: 8, top: 12, bottom: 12),
//     //                   ).round(20),
//     //                 ),
//     //                 Positioned(
//     //                     bottom: 20,
//     //                     child: GestureDetector(
//     //                       onTap: () {
//     //                         animationController!.forward();
//     //                         _recordVideo();
//     //                       },
//     //                       child: Stack(
//     //                         alignment: Alignment.center,
//     //                         children: <Widget>[
//     //                           SizedBox(
//     //                             height: 60,
//     //                             width: 60,
//     //                             child: CircularProgressIndicator(
//     //                               value: animationController!.value,
//     //                               valueColor: AlwaysStoppedAnimation<Color>(
//     //                                   AppColorConstants.themeColor),
//     //                             ),
//     //                           ),
//     //                           Obx(() => Container(
//     //                                 height: 50,
//     //                                 width: 50,
//     //                                 color: AppColorConstants.themeColor,
//     //                                 child: ThemeIconWidget(
//     //                                   _createReelController.isRecording.value
//     //                                       ? ThemeIcon.pause
//     //                                       : ThemeIcon.play,
//     //                                   size: 30,
//     //                                 ),
//     //                               ).circular)
//     //                         ],
//     //                       ),
//     //                     ))
//     //               ],
//     //             ),
//     //           ],
//     //         )
//     //       : VSStoryDesigner(
//     //           giphyKey: settingsController.setting.value!.giphyApiKey!,
//     //           editorBackgroundColor: AppColorConstants.backgroundColor,
//     //
//     //           /// (String), //disabled feature for now
//     //           onDone: (String uri) async {
//     //             XFile image = XFile(uri);
//     //
//     //             Media media = await image.toMedia(GalleryMediaType.photo);
//     //             postStoryMedia([media]);
//     //
//     //             Get.back();
//     //           },
//     //           onTextEditingStatusChange: (status) {},
//     //           onDoneButtonStyle: Container(
//     //                   color: AppColorConstants.cardColor,
//     //                   height: 50,
//     //                   width: 50,
//     //                   child: Center(child: BodyLargeText(postString.tr)))
//     //               .round(10)
//     //               .rp(DesignConstants.horizontalPadding),
//     //           centerText: '',
//     //           middleBottomWidget: Container(),
//     //         )),
//     // );
//   }
//
//   _recordVideo() async {
//     if (_createReelController.isRecording.value) {
//       stopRecording();
//     } else {
//       startRecording();
//     }
//   }
//
//   void stopRecording() async {
//     animationController?.reset();
//     final cameraService = Get.find<CameraControllerService>();
//     final file = await cameraService.controller.stopVideoRecording();
//     debugPrint('RecordedFile:: ${file.path}');
//     _createReelController.stopRecording();
//     if (_createReelController.croppedAudioFile != null) {
//       _createReelController.stopPlayingAudio();
//     }
//     _createReelController.isRecording.value = false;
//     _createReelController.createReel(
//         _createReelController.croppedAudioFile, file);
//   }
//
//   void startRecording() async {
//     final cameraService = Get.find<CameraControllerService>();
//
//     await cameraService.controller.prepareForVideoRecording();
//     await cameraService.controller.startVideoRecording();
//     _createReelController.startRecording();
//     if (_createReelController.croppedAudioFile != null) {
//       _createReelController
//           .playAudioFile(_createReelController.croppedAudioFile!);
//     }
//     // startRecordingTimer();
//   }
// }
