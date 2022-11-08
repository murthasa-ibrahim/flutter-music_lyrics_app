import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_music_player/src/screens/home/model/movie_list_model.dart';
import 'package:online_music_player/src/services/api_serivce/get_song_list/get_song_list.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  List<MovieListModel> songsList = [];
  RxBool isLoading = false.obs;
  RxBool isMoreLoading = false.obs;
  String errorMsg = '';
  int pageSize = 1;
  fetchSongs() async {
    isLoading.value = true;
    await GetSongListApi()
        .getSongList(pageSize)
        .whenComplete(() => isLoading.value = false)
        .then((value) {
      songsList.addAll(value);
    }).onError((error, stackTrace) {
      Get.snackbar('Message', error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  int trackId = 0;
  setTrackId(int id) {
    trackId = id;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    fetchSongs();
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        if (isMoreLoading.value == false && pageSize <2) {
          isMoreLoading.value = true;
          log('loooooiiiiiii');
          pageSize += 1;
          log('page count $pageSize');
          await GetSongListApi()
              .getSongList(pageSize)
              .whenComplete(() => isMoreLoading.value = false)
              .then((value) => songsList.addAll(value));
          log('lengthtthththththth${songsList.length.toString()}');
          update();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
