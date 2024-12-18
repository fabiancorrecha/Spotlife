import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/post_desing_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feed_model.dart';
export 'feed_model.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  late FeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Feed'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FEED_PAGE_Feed_ON_INIT_STATE');
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      logFirebaseEvent('Feed_update_app_state');
      FFAppState().updateUbicationStruct(
        (e) => e..latLng = currentUserLocationValue,
      );
      FFAppState().update(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).btnText,
              size: 30.0,
            ),
            showLoadingIndicator: true,
            onPressed: () async {
              logFirebaseEvent('FEED_PAGE_chevron_left_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed(
                'mapaPrincipal',
                extra: <String, dynamic>{
                  kTransitionInfoKey:
                    const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'ggw9sxpz' /* Posteo */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: FlutterFlowTheme.of(context).btnText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: AuthUserStreamWidget(
                builder: (context) => StreamBuilder<List<UserPostsRecord>>(
                  stream: queryUserPostsRecord(
                    queryBuilder: (userPostsRecord) => userPostsRecord
                        .where(
                          'esPublico',
                          isEqualTo: true,
                        )
                        .whereIn(
                            'postUser',
                            functions.usuariosConcatenados(
                                (currentUserDocument?.listaSeguidos.toList() ??
                                        [])
                                    .toList(),
                                currentUserReference,
                                (currentUserDocument?.listaBloqueados
                                            .toList() ??
                                        [])
                                    .toList()))
                        .orderBy('timePosted', descending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 12.0,
                          height: 12.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primaryBackground,
                            ),
                          ),
                        ),
                      );
                    }
                    List<UserPostsRecord> listViewUserPostsRecordList =
                        snapshot.data!;
                    if (listViewUserPostsRecordList.isEmpty) {
                      return const Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: ComponenteVacioWidget(),
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewUserPostsRecordList.length,
                      separatorBuilder: (_, __) =>
                                    const SizedBox(height: 10.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewUserPostsRecord =
                            listViewUserPostsRecordList[listViewIndex];
                        return PostDesingWidget(
                          key: Key(
                              'Key376_${listViewIndex}_of_${listViewUserPostsRecordList.length}'),
                          post: listViewUserPostsRecord,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
