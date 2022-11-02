import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:online_music_player/src/screens/home/controller/home_controller.dart';
import 'package:online_music_player/src/screens/lyric_screen/model/lyrics_model.dart';
import 'package:online_music_player/src/services/api_serivce/api_urls/api_urls.dart';
import 'package:online_music_player/src/services/apikey/api_key.dart';

class GetTrackDetailsApi{
    Future<LyricsModel> getTrackDetails()async{
        
       final url = '${ApiUrl.trackLyrics}?track_id=${Get.find<HomeController>().trackId}&apikey=${ApiKey.apiKey}';
        try{
          final response = await Dio().get(url);
          if(response.statusCode == 200){
            log('success');
            var json = jsonDecode(response.data);

            // log(s['message']['body']['lyrics']['lyrics_body'].toString().replaceAll('******* This Lyrics is NOT for Commercial use *******\n(1409622857493)', ''));
            log(json['message'].toString());
            var s = json['message']['body'];
            return lyricsModelFromJson(jsonEncode(s));
          }
          else{
             throw "Something went wrong!";
          }
          
        }
        catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          if (e.response?.data == null) {
            throw 'Something went wrong';
          }
          throw 'Something went wrong !';
        }
        throw 'No internet';
      } else {
        log('222222');
        log(e.toString());
        throw e.toString();
      }
    }
    }
}