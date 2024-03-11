import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../consts/colors.dart';
import '../../controllers/player_controller.dart';
import '../../widgets/neumorphBtn.dart';

class PlayerScreen extends StatelessWidget {
  final List<SongModel> data;
  const PlayerScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<PlayerController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NeumorphismBtn(
                    size: 60,
                    child: Icon(
                      Icons.favorite_border,
                      color: secondaryTextColor,
                    ),
                  ),
                  Text(
                    'UnMute'.toUpperCase(),
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: 18,
                    ),
                  ),
                  NeumorphismBtn(
                    size: 60,
                    child: Icon(
                      Icons.search,
                      color: secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// child: Scaffold(
//         backgroundColor: backgroundColor,
//         body: Column(
//           children: [
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Container(
//                 height: 50,
//                 width: 50,
//                 alignment: Alignment.center,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: lightColor2,
//                 ),
//                 child: IconButton(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     icon: const Icon(Icons.arrow_back_ios)),
//               ),
//             ),
//             Obx(
//               () => Expanded(
//                 child: Container(
//                   height: 300,
//                   width: 300,
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: primaryColor1,
//                   ),
//                   child: QueryArtworkWidget(
//                     id: data[controller.playIndex.value].id,
//                     type: ArtworkType.AUDIO,
//                     artworkHeight: 300,
//                     artworkWidth: 300,
//                     artworkFit: BoxFit.fill,
//                     nullArtworkWidget: const Icon(
//                       Icons.music_note,
//                       size: 50,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(12.0),
//                 decoration: const BoxDecoration(
//                   color: lightColor1,
//                   borderRadius: BorderRadius.vertical(
//                     top: Radius.circular(20),
//                   ),
//                 ),
//                 child: Obx(
//                   () => Column(
//                     children: [
//                       Text(
//                         data[controller.playIndex.value].displayName,
//                         textAlign: TextAlign.center,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                         style: const TextStyle(
//                           color: darkColor,
//                           fontSize: 26,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         "${data[controller.playIndex.value].artist}",
//                         textAlign: TextAlign.center,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                         style: TextStyle(
//                           color: darkColor.withOpacity(0.6),
//                           fontSize: 22,
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       Obx(
//                         () => Row(
//                           children: [
//                             Text(
//                               controller.position.value,
//                               style: const TextStyle(
//                                 color: darkColor,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             Expanded(
//                               child: Slider(
//                                 min: const Duration(seconds: 0)
//                                     .inSeconds
//                                     .toDouble(),
//                                 max: controller.max.value,
//                                 value: controller.value.value,
//                                 onChanged: (value) {
//                                   controller
//                                       .changeDurationToSeconds(value.toInt());
//                                   value = value;
//                                 },
//                                 thumbColor: primaryColor3,
//                                 inactiveColor: primaryColor1,
//                                 activeColor: primaryColor3,
//                               ),
//                             ),
//                             Text(
//                               controller.duration.value,
//                               style: const TextStyle(
//                                 color: darkColor,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 40),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               controller.playSong(
//                                   data[controller.playIndex.value - 1].uri,
//                                   controller.playIndex.value - 1);
//                             },
//                             icon: const Icon(
//                               Icons.skip_previous_rounded,
//                               size: 50,
//                             ),
//                           ),
//                           Obx(
//                             () => IconButton(
//                               onPressed: () {
//                                 if (controller.isPlaying.value) {
//                                   controller.audioPlayer.pause();
//                                   controller.isPlaying(false);
//                                 } else {
//                                   controller.audioPlayer.play();
//                                   controller.isPlaying(true);
//                                 }
//                               },
//                               icon: controller.isPlaying.value
//                                   ? const Icon(
//                                       Icons.pause_circle,
//                                       size: 60,
//                                     )
//                                   : const Icon(
//                                       Icons.play_circle,
//                                       size: 60,
//                                     ),
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               controller.playSong(
//                                   data[controller.playIndex.value + 1].uri,
//                                   controller.playIndex.value + 1);
//                             },
//                             icon: const Icon(
//                               Icons.skip_next_rounded,
//                               size: 50,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
    
