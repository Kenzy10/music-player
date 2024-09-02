import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<MusicCreateStruct> _music = [
    MusicCreateStruct.fromSerializableMap(jsonDecode(
        '{\"urlsong\":\"https://pvqbuoazqvburghucjru.supabase.co/storage/v1/object/public/MusicPlayer/Adele_-_All_I_Ask.mp3\",\"title\":\"All I Ask\",\"arturl\":\"hello word\",\"artistname\":\"Adele\"}'))
  ];
  List<MusicCreateStruct> get music => _music;
  set music(List<MusicCreateStruct> value) {
    _music = value;
  }

  void addToMusic(MusicCreateStruct value) {
    music.add(value);
  }

  void removeFromMusic(MusicCreateStruct value) {
    music.remove(value);
  }

  void removeAtIndexFromMusic(int index) {
    music.removeAt(index);
  }

  void updateMusicAtIndex(
    int index,
    MusicCreateStruct Function(MusicCreateStruct) updateFn,
  ) {
    music[index] = updateFn(_music[index]);
  }

  void insertAtIndexInMusic(int index, MusicCreateStruct value) {
    music.insert(index, value);
  }
}
