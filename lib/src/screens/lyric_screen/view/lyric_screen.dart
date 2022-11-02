import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_music_player/const/constants.dart';
import 'package:online_music_player/src/screens/lyric_screen/model/lyrics_model.dart';

import '../../../services/api_serivce/get_track_details.dart/get_details.dart';

class LyricScreen extends GetView {
  const LyricScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GetTrackDetailsApi().getTrackDetails();
    return Scaffold(
      backgroundColor:const  Color(0xffa490b3),
      body: SafeArea(
        child: FutureBuilder<LyricsModel>(
            future: GetTrackDetailsApi().getTrackDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String lyrc = snapshot.data!.lyrics.lyricsBody.replaceAll(
                    '******* This Lyrics is NOT for Commercial use *******\n(1409622857493)',
                    '');
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Text(
                        lyrc,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kwhight),
                      ),
                      Image.asset('assets/images/songhit.jpg')
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
