// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MusicCreateStruct extends BaseStruct {
  MusicCreateStruct({
    String? urlsong,
    String? title,
    String? arturl,
    String? artistname,
  })  : _urlsong = urlsong,
        _title = title,
        _arturl = arturl,
        _artistname = artistname;

  // "urlsong" field.
  String? _urlsong;
  String get urlsong => _urlsong ?? '';
  set urlsong(String? val) => _urlsong = val;

  bool hasUrlsong() => _urlsong != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "arturl" field.
  String? _arturl;
  String get arturl => _arturl ?? '';
  set arturl(String? val) => _arturl = val;

  bool hasArturl() => _arturl != null;

  // "artistname" field.
  String? _artistname;
  String get artistname => _artistname ?? '';
  set artistname(String? val) => _artistname = val;

  bool hasArtistname() => _artistname != null;

  static MusicCreateStruct fromMap(Map<String, dynamic> data) =>
      MusicCreateStruct(
        urlsong: data['urlsong'] as String?,
        title: data['title'] as String?,
        arturl: data['arturl'] as String?,
        artistname: data['artistname'] as String?,
      );

  static MusicCreateStruct? maybeFromMap(dynamic data) => data is Map
      ? MusicCreateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'urlsong': _urlsong,
        'title': _title,
        'arturl': _arturl,
        'artistname': _artistname,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'urlsong': serializeParam(
          _urlsong,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'arturl': serializeParam(
          _arturl,
          ParamType.String,
        ),
        'artistname': serializeParam(
          _artistname,
          ParamType.String,
        ),
      }.withoutNulls;

  static MusicCreateStruct fromSerializableMap(Map<String, dynamic> data) =>
      MusicCreateStruct(
        urlsong: deserializeParam(
          data['urlsong'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        arturl: deserializeParam(
          data['arturl'],
          ParamType.String,
          false,
        ),
        artistname: deserializeParam(
          data['artistname'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MusicCreateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MusicCreateStruct &&
        urlsong == other.urlsong &&
        title == other.title &&
        arturl == other.arturl &&
        artistname == other.artistname;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([urlsong, title, arturl, artistname]);
}

MusicCreateStruct createMusicCreateStruct({
  String? urlsong,
  String? title,
  String? arturl,
  String? artistname,
}) =>
    MusicCreateStruct(
      urlsong: urlsong,
      title: title,
      arturl: arturl,
      artistname: artistname,
    );
