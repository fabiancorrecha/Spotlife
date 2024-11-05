import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'test_new_video_model.dart';
export 'test_new_video_model.dart';

class TestNewVideoWidget extends StatefulWidget {
  const TestNewVideoWidget({super.key});

  @override
  State<TestNewVideoWidget> createState() => _TestNewVideoWidgetState();
}

class _TestNewVideoWidgetState extends State<TestNewVideoWidget> {
  late TestNewVideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestNewVideoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'testNewVideo'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: double.infinity,
              height: 700.0,
              child: custom_widgets.CustomVideoPlayer(
                width: double.infinity,
                height: 700.0,
                videoPath:
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/iz3f91dgtf17/Grabaci%C3%B3n_2024-09-14_135527.mp4',
                soundOn: FaIcon(
                  FontAwesomeIcons.volumeUp,
                  color: FlutterFlowTheme.of(context).white,
                  size: 20.0,
                ),
                soundOff: FaIcon(
                  FontAwesomeIcons.volumeMute,
                  color: FlutterFlowTheme.of(context).white,
                  size: 20.0,
                ),
                fullscreen: Icon(
                  Icons.fullscreen_sharp,
                  color: FlutterFlowTheme.of(context).white,
                  size: 24.0,
                ),
                closeScreem: Icon(
                  Icons.fullscreen_exit,
                  color: FlutterFlowTheme.of(context).white,
                  size: 24.0,
                ),
                buttonSize: 40.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
