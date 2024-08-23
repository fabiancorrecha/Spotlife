import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar7_usuario/app_bar7_usuario_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar2/nav_bar2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'otro_perfil_mapa_model.dart';
export 'otro_perfil_mapa_model.dart';

class OtroPerfilMapaWidget extends StatefulWidget {
  const OtroPerfilMapaWidget({
    super.key,
    this.usuario,
  });

  final DocumentReference? usuario;

  @override
  State<OtroPerfilMapaWidget> createState() => _OtroPerfilMapaWidgetState();
}

class _OtroPerfilMapaWidgetState extends State<OtroPerfilMapaWidget> {
  late OtroPerfilMapaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtroPerfilMapaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'otroPerfilMapa'});
    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return StreamBuilder<List<UserPostsRecord>>(
      stream: queryUserPostsRecord(
        queryBuilder: (userPostsRecord) => userPostsRecord
            .where(
              'postUser',
              isEqualTo: widget.usuario,
            )
            .where(
              'esPrivado',
              isEqualTo: false,
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
        List<UserPostsRecord> otroPerfilMapaUserPostsRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.appBar7UsuarioModel,
                    updateCallback: () => setState(() {}),
                    child: AppBar7UsuarioWidget(
                      usuario: widget.usuario,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('ButtonSeguir pressed ...');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'soca7s95' /* Seguir */,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 35.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    elevation: 2.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('ButtonSiguiendo pressed ...');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '951vu24q' /* Siguiendo */,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 35.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).fondoIcono,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    elevation: 2.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        StreamBuilder<List<ChatsRecord>>(
                          stream: queryChatsRecord(
                            queryBuilder: (chatsRecord) =>
                                chatsRecord.where(Filter.or(
                              Filter(
                                'user_a',
                                isEqualTo: currentUserReference,
                              ),
                              Filter(
                                'user_b',
                                isEqualTo: widget.usuario,
                              ),
                              Filter(
                                'user_a',
                                isEqualTo: widget.usuario,
                              ),
                              Filter(
                                'user_b',
                                isEqualTo: currentUserReference,
                              ),
                            )),
                            singleRecord: true,
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
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<ChatsRecord> buttonChatsRecordList =
                                snapshot.data!;
                            final buttonChatsRecord =
                                buttonChatsRecordList.isNotEmpty
                                    ? buttonChatsRecordList.first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'OTRO_PERFIL_MAPA_ENVIAR_MENSAJE_BTN_ON_T');
                                var shouldSetState = false;
                                if (buttonChatsRecord != null) {
                                  logFirebaseEvent('Button_navigate_to');

                                  context.goNamed(
                                    'ChatPage',
                                    queryParameters: {
                                      'receiveChat': serializeParam(
                                        buttonChatsRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );

                                  if (shouldSetState) setState(() {});
                                  return;
                                } else {
                                  logFirebaseEvent('Button_backend_call');
                                  _model.readUsuario =
                                      await UsersRecord.getDocumentOnce(
                                          widget.usuario!);
                                  shouldSetState = true;
                                  logFirebaseEvent('Button_backend_call');

                                  var chatsRecordReference =
                                      ChatsRecord.collection.doc();
                                  await chatsRecordReference.set({
                                    ...createChatsRecordData(
                                      timeStamp: getCurrentTimestamp,
                                      userA: currentUserReference,
                                      userB: widget.usuario,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'userIds':
                                            functions.generateListOfUsers(
                                                currentUserReference!,
                                                widget.usuario!),
                                        'userNames':
                                            functions.generateListOfNames(
                                                currentUserDisplayName,
                                                _model
                                                    .readUsuario!.displayName),
                                      },
                                    ),
                                  });
                                  _model.refChats =
                                      ChatsRecord.getDocumentFromData({
                                    ...createChatsRecordData(
                                      timeStamp: getCurrentTimestamp,
                                      userA: currentUserReference,
                                      userB: widget.usuario,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'userIds':
                                            functions.generateListOfUsers(
                                                currentUserReference!,
                                                widget.usuario!),
                                        'userNames':
                                            functions.generateListOfNames(
                                                currentUserDisplayName,
                                                _model
                                                    .readUsuario!.displayName),
                                      },
                                    ),
                                  }, chatsRecordReference);
                                  shouldSetState = true;
                                  logFirebaseEvent('Button_navigate_to');

                                  context.goNamed(
                                    'ChatPage',
                                    queryParameters: {
                                      'receiveChat': serializeParam(
                                        _model.refChats?.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );

                                  if (shouldSetState) setState(() {});
                                  return;
                                }

                                if (shouldSetState) setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'eqcg9rl7' /* Enviar mensaje */,
                              ),
                              options: FFButtonOptions(
                                width: 150.0,
                                height: 35.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).fondoIcono,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 2.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(80.0),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navBar2Model,
                    updateCallback: () => setState(() {}),
                    child: NavBar2Widget(
                      tab: 1,
                      otroUsuario: widget.usuario,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.MapaPerzonalizado(
                          width: double.infinity,
                          height: double.infinity,
                          ubicacionInicialLat: functions.obtenerLatLng(
                              currentUserLocationValue!, true),
                          ubicacionInicialLng: functions.obtenerLatLng(
                              currentUserLocationValue!, false),
                          zoom: 16.0,
                          listaPostMarcadores:
                              otroPerfilMapaUserPostsRecordList,
                        ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navBar1Model,
                    updateCallback: () => setState(() {}),
                    child: const NavBar1Widget(
                      tabActiva: 0,
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
