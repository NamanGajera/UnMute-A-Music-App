import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PlayerController extends GetxController {
  final audioPlayer = AudioPlayer();
  int playIndex = -1;
  RxBool isPlaying = false.obs;
  playSong(String? uri, index) {
    playIndex = index;
    try {
      audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(uri!)),
      );
      if (isPlaying.value) {
        audioPlayer.stop();
      } else {
        audioPlayer.play();
        isPlaying.value = !isPlaying.value;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
