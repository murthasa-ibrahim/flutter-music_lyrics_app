import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_music_player/src/services/api_serivce/get_song_list/get_song_list.dart';

class HomeController extends GetxController{
  final scrollController = ScrollController();

   fetchMoreSong(){

  

    scrollController.addListener(()async {
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent){
        log('loooooiiiiiii');
      await  GetSongListApi().getSongList();
      update();
      }
     });
   }  


     int trackId =0;
  setTrackId(int id){
    trackId =id;
    update();
  }
  
  @override
  void onInit() {
    super.onInit();
    
  }


   @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }



}