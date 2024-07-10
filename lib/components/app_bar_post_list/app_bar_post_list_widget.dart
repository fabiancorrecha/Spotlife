import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_bar_post_list_model.dart';
export 'app_bar_post_list_model.dart';

class AppBarPostListWidget extends StatefulWidget {
  const AppBarPostListWidget({
    super.key,
    this.userPost,
  });

  final UserPostsRecord? userPost;

  @override
  State<AppBarPostListWidget> createState() => _AppBarPostListWidgetState();
}

class _AppBarPostListWidgetState extends State<AppBarPostListWidget> {
  late AppBarPostListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarPostListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('APP_BAR_POST_LIST_Card_5bt0a489_ON_TAP');
                logFirebaseEvent('Card_navigate_back');
                context.pop();
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).fondoIcono,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).icono,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 40.0,
            height: 40.0,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              widget.userPost!.postPhotolist.first,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                  child: Icon(
                    FFIcons.kpinLines,
                    color: FlutterFlowTheme.of(context).icono,
                    size: 18.0,
                  ),
                ),
                Text(
                  widget.userPost!.placeInfo.city,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
