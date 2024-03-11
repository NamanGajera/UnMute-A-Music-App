import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:unmute/views/otherscreens/player_screen.dart';

import '../../consts/colors.dart';
import '../../controllers/player_controller.dart';
import '../../widgets/neumorphBtn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  bool _hasPermission = false;
  List<SongModel> songdata = [];

  @override
  void initState() {
    super.initState();

    LogConfig logConfig = LogConfig(logType: LogType.DEBUG);
    _audioQuery.setLogConfig(logConfig);

    checkAndRequestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlayerController());
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const NeumorphismBtn(
                    size: 60,
                    child: Icon(
                      Icons.sort_outlined,
                      color: secondaryTextColor,
                    ),
                  ),
                  Text(
                    'UnMute'.toUpperCase(),
                    style: const TextStyle(
                      color: primaryTextColor,
                      fontSize: 18,
                    ),
                  ),
                  const NeumorphismBtn(
                    size: 60,
                    child: Icon(
                      Icons.search,
                      color: secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: FutureBuilder<List<SongModel>>(
                future: _audioQuery.querySongs(
                  ignoreCase: true,
                  orderType: OrderType.ASC_OR_SMALLER,
                  sortType: null,
                  uriType: UriType.EXTERNAL,
                ),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        'No Song Found',
                        style: TextStyle(
                          color: darkColor.withOpacity(0.3),
                          fontSize: 34,
                        ),
                      ),
                    );
                  } else {
                    for (var element in snapshot.data!) {
                      bool checkMusic = element.isMusic ?? false;
                      if (checkMusic) {
                        songdata.add(element);
                      }
                    }

                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: songdata.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => PlayerScreen(
                                  data: songdata,
                                ));
                            controller.playSong(songdata[index].uri, index);
                          },
                          child: Obx(
                            () => Container(
                              height: size.height * 0.09,
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              decoration: BoxDecoration(
                                color: controller.playIndex.value == index
                                    ? secondaryTextColor.withOpacity(0.3)
                                    : null,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.6,
                                        child: Text(
                                          songdata[index].displayNameWOExt,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: primaryTextColor,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.6,
                                        child: Text(
                                          '${songdata[index].artist}',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: secondaryTextColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  controller.playIndex.value == index &&
                                          controller.isPlaying.value
                                      ? const NeumorphismBtn(
                                          size: 60,
                                          colors: [
                                            blueTopDark,
                                            blue,
                                          ],
                                          child: Icon(
                                            Icons.pause,
                                            color: white,
                                          ),
                                        )
                                      : const NeumorphismBtn(
                                          size: 60,
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: secondaryTextColor,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            //  Card(
            //                   elevation: 8,
            //                   shadowColor: lightColor1,
            //                   shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(20)),
            //                   child: Container(
            //                     padding: const EdgeInsets.all(8),
            //                     height:
            //                         MediaQuery.of(context).size.height * 0.1,
            //                     width: MediaQuery.of(context).size.width,
            //                     decoration: BoxDecoration(
            //                       color: lightColor2,
            //                       borderRadius: BorderRadius.circular(20),
            //                     ),
            //                     child: Row(
            //                       children: [
            //                         // artist image
            //                         Container(
            //                           height:
            //                               MediaQuery.of(context).size.height *
            //                                   0.1,
            //                           width: MediaQuery.of(context).size.width *
            //                               0.17,
            //                           alignment: Alignment.center,
            //                           decoration: BoxDecoration(
            //                             color: lightColor1,
            //                             borderRadius: BorderRadius.circular(16),
            //                           ),
            //                           child: QueryArtworkWidget(
            //                             controller: _audioQuery,
            //                             // id: snapshot.data![index].id,
            //                             id: songdata[index].id,
            //                             type: ArtworkType.AUDIO,
            //                             nullArtworkWidget: const Icon(
            //                               Icons.music_note,
            //                               color: darkColor,
            //                               size: 45,
            //                             ),
            //                           ),
            //                         ),
            //                         const SizedBox(width: 12),
            //                         SizedBox(
            //                           width: MediaQuery.of(context).size.width *
            //                               0.55,
            //                           child: Column(
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             children: [
            //                               const SizedBox(height: 3),
            //                               Text(
            //                                 // snapshot.data![index].displayNameWOExt,
            //                                 songdata[index].displayNameWOExt,
            //                                 overflow: TextOverflow.ellipsis,
            //                                 style: const TextStyle(
            //                                   color: darkColor,
            //                                   fontSize: 18,
            //                                 ),
            //                               ),
            //                               const SizedBox(height: 5),
            //                               Text(
            //                                 // "${snapshot.data![index].artist}",
            //                                 "${songdata[index].artist}",
            //                                 style: TextStyle(
            //                                   color: darkColor.withOpacity(0.5),
            //                                   fontSize: 15,
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                         const Spacer(),
            //                         Align(
            //                           alignment: Alignment.center,
            //                           child:
            //                               controller.playIndex.value == index &&
            //                                       controller.isPlaying.value
            //                                   ? Icon(
            //                                       Icons.pause_circle,
            //                                       color: darkColor,
            //                                       size: MediaQuery.of(context)
            //                                               .size
            //                                               .width *
            //                                           0.12,
            //                                     )
            //                                   : Icon(
            //                                       Icons.play_circle,
            //                                       color: darkColor,
            //                                       size: MediaQuery.of(context)
            //                                               .size
            //                                               .width *
            //                                           0.12,
            //                                     ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
          ],
        ),
      ),
    );
  }

  void checkAndRequestPermissions({bool retry = false}) async {
    _hasPermission = await _audioQuery.checkAndRequest(
      retryRequest: retry,
    );

    _hasPermission ? setState(() {}) : null;
  }
}

// Scaffold(
//         backgroundColor: lightColor2,
//         appBar: AppBar(
//           backgroundColor: lightColor2,
//           elevation: 0,
//           title: const Text(
//             'UnMute',
//             style: TextStyle(
//               color: darkColor,
//               fontSize: 24,
//             ),
//           ),
//           centerTitle: true,
//           leading: IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.sort_rounded,
//                 color: darkColor,
//                 size: 28,
//               )),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.search,
//                 color: darkColor,
//                 size: 28,
//               ),
//             ),
//             const SizedBox(width: 10),
//           ],
//         ),
        // body: 
//       ),
    
