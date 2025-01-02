import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar4/app_bar4_widget.dart';
import '/components/post_desing_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'vista_postlist_model.dart';
export 'vista_postlist_model.dart';

class VistaPostlistWidget extends StatefulWidget {
  const VistaPostlistWidget({
    super.key,
    required this.user,
    bool? verCometarios,
    required this.index,
  }) : verCometarios = verCometarios ?? false;

  final DocumentReference? user;
  final bool verCometarios;
  final DocumentReference? index;

  @override
  State<VistaPostlistWidget> createState() => _VistaPostlistWidgetState();
}

class _VistaPostlistWidgetState extends State<VistaPostlistWidget> {
  late VistaPostlistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VistaPostlistModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VistaPostlist'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserPostsRecord>>(
      stream: queryUserPostsRecord(
        queryBuilder: (userPostsRecord) => userPostsRecord.where(
          'postUser',
          isEqualTo: widget.user,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 12.0,
                height: 12.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
              ),
            ),
          );
        }
        List<UserPostsRecord> vistaPostlistUserPostsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
                    child: wrapWithModel(
                      model: _model.appBar4Model,
                      updateCallback: () => safeSetState(() {}),
                      child: const AppBar4Widget(
                        textValue: 'Spot',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final refpost = functions
                                      .sortItem(
                                          functions
                                              .filterHiddenPosts(
                                                  vistaPostlistUserPostsRecordList
                                                      .toList(),
                                                  currentUserReference)
                                              ?.toList(),
                                          widget.index)
                                      ?.toList() ??
                                  [];

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: refpost.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 10.0),
                                itemBuilder: (context, refpostIndex) {
                                  final refpostItem = refpost[refpostIndex];
                                  return SizedBox(
                                    width: double.infinity,
                                    child: PostDesingWidget(
                                      key: Key(
                                          'Keyrgl_${refpostIndex}_of_${refpost.length}'),
                                      post: refpostItem,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
