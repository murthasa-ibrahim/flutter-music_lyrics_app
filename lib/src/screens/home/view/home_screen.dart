

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_music_player/const/constants.dart';
import 'package:online_music_player/src/screens/home/controller/home_controller.dart';
import 'package:online_music_player/src/screens/lyric_screen/view/lyric_screen.dart';
import 'package:online_music_player/src/screens/search/view/search.dart';

class HomeScreen extends GetView {
  HomeScreen({Key? key}) : super(key: key);
  final hController = Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      appBar: AppBar(
        backgroundColor: kblack,
        title: const Text(
          "My Music",
          style: TextStyle(
              color: kwhight, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const SearchScreen());
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
          const SizedBox(
            width: 10,
          )
        ],
        elevation: 0,
      ),
      body: Obx(
        () => Column(
          children: [
            hController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: GetBuilder<HomeController>(
                      builder: (controller) => GridView.builder(
                        controller: hController.scrollController,
                        // physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                childAspectRatio: 1),
                        itemBuilder: (context, index) {
                          final track = hController.songsList[index].track;
                          return InkWell(
                            onTap: () {
                              hController.setTrackId(track.trackId);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LyricScreen(),
                              ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.all(kDefaultPadding / 2),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Colors.amber,
                                    Colors.deepOrange
                                  ]),
                                  borderRadius: BorderRadius.circular(
                                      kDefaultPadding / 2)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: kDefaultPadding,
                                  ),
                                  Text(
                                    track.trackName,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: kwhight,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const Icon(
                                    Icons.headphones,
                                    size: 40,
                                  ),
                                  Text(
                                    track.albumName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: hController.songsList.length,
                      ),
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            hController.isMoreLoading.value == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox(
                    height: 10,
                  )
          ],
        ),
      ),
    );
  }
}
