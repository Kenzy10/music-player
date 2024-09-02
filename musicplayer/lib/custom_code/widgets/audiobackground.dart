// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async'; // Import for StreamController
import 'package:just_audio/just_audio.dart'; // Import just_audio package
import 'package:cached_network_image/cached_network_image.dart'; // Import cached_network_image package
import 'package:flutter_cache_manager/flutter_cache_manager.dart'; // Import cache manager package

class Audiobackground extends StatefulWidget {
  const Audiobackground({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<Audiobackground> createState() => _AudiobackgroundState();
}

class _AudiobackgroundState extends State<Audiobackground> {
  late AudioPlayer _audioPlayer;
  final StreamController<DurationState> _durationController =
      StreamController<DurationState>();

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initializeAudio();
    _setupAudioStreams();
  }

  Future<void> _initializeAudio() async {
    try {
      final audioSource = AudioSource.uri(Uri.parse('https://foo.com/bar.mp3'));
      await _audioPlayer.setAudioSource(audioSource);
      _audioPlayer.play();
    } catch (e) {
      print("Error initializing audio: $e");
    }
  }

  void _setupAudioStreams() {
    _audioPlayer.positionStream.listen((position) {
      final buffered = _audioPlayer.bufferedPosition;
      final duration = _audioPlayer.duration ?? Duration.zero;
      _durationController.add(DurationState(
        progress: position,
        buffered: buffered,
        total: duration,
      ));
    });
  }

  Future<void> _clearCache() async {
    try {
      await DefaultCacheManager().emptyCache();
      print("Cache cleared successfully.");
    } catch (e) {
      print("Error clearing cache: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _durationController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Cached Network Image Widget
          CachedNetworkImage(
            imageUrl: "http://via.placeholder.com/200x150",
            imageBuilder: (context, imageProvider) => Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),

          // Linear Progress Bar Widget
          StreamBuilder<DurationState>(
            stream: _durationController.stream,
            builder: (context, snapshot) {
              final durationState = snapshot.data;
              final progress = durationState?.progress ?? Duration.zero;
              final buffered = durationState?.buffered ?? Duration.zero;
              final total = durationState?.total ?? Duration.zero;

              return Column(
                children: [
                  LinearProgressIndicator(
                    value: total.inMilliseconds > 0
                        ? progress.inMilliseconds / total.inMilliseconds
                        : 0.0,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${progress.toString().split('.').first} / ${total.toString().split('.').first}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              );
            },
          ),

          // Audio Control Buttons
          ElevatedButton(
            onPressed: () {
              _audioPlayer.play();
            },
            child: Text('Play Audio'),
          ),
          ElevatedButton(
            onPressed: () {
              _audioPlayer.pause();
            },
            child: Text('Pause Audio'),
          ),
          ElevatedButton(
            onPressed: () {
              _audioPlayer.stop();
            },
            child: Text('Stop Audio'),
          ),
          ElevatedButton(
            onPressed: _clearCache,
            child: Text('Clear Audio Cache'),
          ),
        ],
      ),
    );
  }
}

class DurationState {
  const DurationState({
    required this.progress,
    required this.buffered,
    required this.total,
  });

  final Duration progress;
  final Duration buffered;
  final Duration total;
}
