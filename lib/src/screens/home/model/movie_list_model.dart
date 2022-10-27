

import 'dart:convert';

List<MovieListModel> movieListModelFromJson(String str) => List<MovieListModel>.from(json.decode(str).map((x) => MovieListModel.fromJson(x)));


class MovieListModel {
    MovieListModel({
      required this.track,
    });

    final Track track;

    factory MovieListModel.fromJson(Map<String, dynamic> json) => MovieListModel(
        track: Track.fromJson(json["track"]),
    );

    Map<String, dynamic> toJson() => {
        "track": track.toJson(),
    };
}

class Track {
    Track({
        required this.trackId,
        required this.trackName,
        required this.trackNameTranslationList,
        required this.trackRating,
        required this.commontrackId,
        required this.instrumental,
        required this.explicit,
        required this.hasLyrics,
        required this.hasSubtitles,
        required this.hasRichsync,
        required this.numFavourite,
        required this.albumId,
        required this.albumName,
        required this.artistId,
        required this.artistName,
        required this.trackShareUrl,
        required this.trackEditUrl,
        required this.restricted,
        required this.updatedTime,
        required this.primaryGenres,
    });

    final int trackId;
    final String trackName;
    final List<TrackNameTranslationList> trackNameTranslationList;
    final int trackRating;
    final int commontrackId;
    final int instrumental;
    final int explicit;
    final int hasLyrics;
    final int hasSubtitles;
    final int hasRichsync;
    final int numFavourite;
    final int albumId;
    final String albumName;
    final int artistId;
    final String artistName;
    final String trackShareUrl;
    final String trackEditUrl;
    final int restricted;
    final DateTime updatedTime;
    final PrimaryGenres primaryGenres;

    factory Track.fromJson(Map<String, dynamic> json) => Track(
        trackId: json["track_id"],
        trackName: json["track_name"],
        trackNameTranslationList: List<TrackNameTranslationList>.from(json["track_name_translation_list"].map((x) => TrackNameTranslationList.fromJson(x))),
        trackRating: json["track_rating"],
        commontrackId: json["commontrack_id"],
        instrumental: json["instrumental"],
        explicit: json["explicit"],
        hasLyrics: json["has_lyrics"],
        hasSubtitles: json["has_subtitles"],
        hasRichsync: json["has_richsync"],
        numFavourite: json["num_favourite"],
        albumId: json["album_id"],
        albumName: json["album_name"],
        artistId: json["artist_id"],
        artistName: json["artist_name"],
        trackShareUrl: json["track_share_url"],
        trackEditUrl: json["track_edit_url"],
        restricted: json["restricted"],
        updatedTime: DateTime.parse(json["updated_time"]),
        primaryGenres: PrimaryGenres.fromJson(json["primary_genres"]),
    );

    Map<String, dynamic> toJson() => {
        "track_id": trackId,
        "track_name": trackName,
        "track_name_translation_list": List<dynamic>.from(trackNameTranslationList.map((x) => x.toJson())),
        "track_rating": trackRating,
        "commontrack_id": commontrackId,
        "instrumental": instrumental,
        "explicit": explicit,
        "has_lyrics": hasLyrics,
        "has_subtitles": hasSubtitles,
        "has_richsync": hasRichsync,
        "num_favourite": numFavourite,
        "album_id": albumId,
        "album_name": albumName,
        "artist_id": artistId,
        "artist_name": artistName,
        "track_share_url": trackShareUrl,
        "track_edit_url": trackEditUrl,
        "restricted": restricted,
        "updated_time": updatedTime.toIso8601String(),
        "primary_genres": primaryGenres.toJson(),
    };
}

class PrimaryGenres {
    PrimaryGenres({
        required this.musicGenreList,
    });

    final List<MusicGenreList> musicGenreList;

    factory PrimaryGenres.fromJson(Map<String, dynamic> json) => PrimaryGenres(
        musicGenreList: List<MusicGenreList>.from(json["music_genre_list"].map((x) => MusicGenreList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "music_genre_list": List<dynamic>.from(musicGenreList.map((x) => x.toJson())),
    };
}

class MusicGenreList {
    MusicGenreList({
        required this.musicGenre,
    });

    final MusicGenre musicGenre;

    factory MusicGenreList.fromJson(Map<String, dynamic> json) => MusicGenreList(
        musicGenre: MusicGenre.fromJson(json["music_genre"]),
    );

    Map<String, dynamic> toJson() => {
        "music_genre": musicGenre.toJson(),
    };
}

class MusicGenre {
    MusicGenre({
        required this.musicGenreId,
        required this.musicGenreParentId,
        required this.musicGenreName,
        required this.musicGenreNameExtended,
        required this.musicGenreVanity,
    });

    final int musicGenreId;
    final int musicGenreParentId;
    final String musicGenreName;
    final String musicGenreNameExtended;
    final String musicGenreVanity;

    factory MusicGenre.fromJson(Map<String, dynamic> json) => MusicGenre(
        musicGenreId: json["music_genre_id"],
        musicGenreParentId: json["music_genre_parent_id"],
        musicGenreName: json["music_genre_name"],
        musicGenreNameExtended: json["music_genre_name_extended"],
        musicGenreVanity: json["music_genre_vanity"],
    );

    Map<String, dynamic> toJson() => {
        "music_genre_id": musicGenreId,
        "music_genre_parent_id": musicGenreParentId,
        "music_genre_name": musicGenreName,
        "music_genre_name_extended": musicGenreNameExtended,
        "music_genre_vanity": musicGenreVanity,
    };
}

class TrackNameTranslationList {
    TrackNameTranslationList({
        required this.trackNameTranslation,
    });

    final TrackNameTranslation trackNameTranslation;

    factory TrackNameTranslationList.fromJson(Map<String, dynamic> json) => TrackNameTranslationList(
        trackNameTranslation: TrackNameTranslation.fromJson(json["track_name_translation"]),
    );

    Map<String, dynamic> toJson() => {
        "track_name_translation": trackNameTranslation.toJson(),
    };
}

class TrackNameTranslation {
    TrackNameTranslation({
        required this.language,
        required this.translation,
    });

    final String language;
    final String translation;

    factory TrackNameTranslation.fromJson(Map<String, dynamic> json) => TrackNameTranslation(
        language: json["language"],
        translation: json["translation"],
    );

    Map<String, dynamic> toJson() => {
        "language": language,
        "translation": translation,
    };
}
