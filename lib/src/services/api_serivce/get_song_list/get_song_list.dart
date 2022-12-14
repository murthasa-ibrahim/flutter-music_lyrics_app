import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:online_music_player/src/screens/home/controller/home_controller.dart';
import 'package:online_music_player/src/screens/home/model/movie_list_model.dart';
import 'package:online_music_player/src/services/api_serivce/api_urls/api_urls.dart';
import 'package:online_music_player/src/services/apikey/api_key.dart';

class GetSongListApi {
  Future<List<MovieListModel>> getSongList(int size) async {
    log('sdhhdhdhdhd');
    final url = '${ApiUrl.movieList}?apikey=${ApiKey.apiKey1}&page=$size';
    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);
        // log(json.toString());
        log('succdss');
        // log(json.toString());
        var s = json['message']['body']['track_list'];
        // log(s.toString());
        return movieListModelFromJson(jsonEncode(s));
      }
    } catch (e) {
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
    throw "Something went wrong !!";
  }
}
