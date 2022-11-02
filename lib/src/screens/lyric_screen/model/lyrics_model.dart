import 'dart:convert';

LyricsModel lyricsModelFromJson(String str) =>
    LyricsModel.fromJson(json.decode(str));

class LyricsModel {
  LyricsModel({
    required this.lyrics,
  });

  final Lyrics lyrics;

  factory LyricsModel.fromJson(Map<String, dynamic> json) => LyricsModel(
        lyrics: Lyrics.fromJson(json["lyrics"]),
      );
}

class Lyrics {
  Lyrics({
    required this.lyricsId,
    required this.explicit,
    required this.lyricsBody,
    required this.scriptTrackingUrl,
    required this.pixelTrackingUrl,
    required this.lyricsCopyright,
    required this.updatedTime,
  });

  final int lyricsId;
  final int explicit;
  final String lyricsBody;
  final String scriptTrackingUrl;
  final String pixelTrackingUrl;
  final String lyricsCopyright;
  final DateTime updatedTime;

  factory Lyrics.fromJson(Map<String, dynamic> json) => Lyrics(
        lyricsId: json["lyrics_id"],
        explicit: json["explicit"],
        lyricsBody: json["lyrics_body"],
        scriptTrackingUrl: json["script_tracking_url"],
        pixelTrackingUrl: json["pixel_tracking_url"],
        lyricsCopyright: json["lyrics_copyright"],
        updatedTime: DateTime.parse(json["updated_time"]),
      );
}
