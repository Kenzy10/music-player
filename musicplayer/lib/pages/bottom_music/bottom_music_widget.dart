import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_music_model.dart';
export 'bottom_music_model.dart';

class BottomMusicWidget extends StatefulWidget {
  const BottomMusicWidget({
    super.key,
    required this.image,
    required this.alliask,
  });

  final String? image;
  final List<String>? alliask;

  @override
  State<BottomMusicWidget> createState() => _BottomMusicWidgetState();
}

class _BottomMusicWidgetState extends State<BottomMusicWidget> {
  late BottomMusicModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomMusicModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 482.0,
      height: 840.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/image.jpg',
          ).image,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(-0.23, -0.68),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/ab67616d0000b273926f43e7cce571e62720fd46.jpeg',
                  width: 310.0,
                  height: 290.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.12),
            child: Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: FlutterFlowAudioPlayer(
                  audio: Audio(
                    'assets/audios/Bruno_Mars_-_When_I_Was_Your_Man.mp3',
                    metas: Metas(
                      id: 'Bruno_Mars_-_When_I_Was_Your_Man.mp3-197b7837',
                      title: 'When i was your man',
                    ),
                  ),
                  titleTextStyle:
                      FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Outfit',
                            letterSpacing: 0.0,
                          ),
                  playbackDurationTextStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                  fillColor: Color(0xFF179BAE),
                  playbackButtonColor: FlutterFlowTheme.of(context).info,
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: FlutterFlowTheme.of(context).info,
                  elevation: 4.0,
                  playInBackground: PlayInBackground.enabled,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.82, 0.92),
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed('HomePage');
              },
              text: 'Back',
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 15.0,
              ),
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFF48CFCB),
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
