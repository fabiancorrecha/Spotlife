import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/menu_otro_perfil/menu_otro_perfil_widget.dart';
import '/components/seccion_cambiar_foto/seccion_cambiar_foto_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'tarjeta_otro_perfil_model.dart';
export 'tarjeta_otro_perfil_model.dart';

class TarjetaOtroPerfilWidget extends StatefulWidget {
  const TarjetaOtroPerfilWidget({
    super.key,
    required this.perfilAjeno,
    this.pageLink,
  });

  final DocumentReference? perfilAjeno;
  final String? pageLink;

  @override
  State<TarjetaOtroPerfilWidget> createState() =>
      _TarjetaOtroPerfilWidgetState();
}

class _TarjetaOtroPerfilWidgetState extends State<TarjetaOtroPerfilWidget> {
  late TarjetaOtroPerfilModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TarjetaOtroPerfilModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.perfilAjeno!),
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

        final stackUsersRecord = snapshot.data!;

        return SizedBox(
          width: double.infinity,
          height: 315.0,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      stackUsersRecord.bgURL,
                    ).image,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0x7F1A1A1A), Color(0xFF1A1A1A)],
                    stops: [0.4, 0.7],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 94.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TARJETA_OTRO_PERFIL_CircleImage_uqrjyads');
                            logFirebaseEvent('CircleImage_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SizedBox(
                                      height: 260.0,
                                      child: SeccionCambiarFotoWidget(
                                        usuario: stackUsersRecord,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 500),
                              fadeOutDuration: const Duration(milliseconds: 500),
                              imageUrl: valueOrDefault<String>(
                                stackUsersRecord.photoUrl,
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              stackUsersRecord.displayName,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            100.0, 0.0, 100.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  stackUsersRecord.bio,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            100.0, 0.0, 100.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 10.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'TARJETA_OTRO_PERFIL_Text_v402e10s_ON_TAP');
                                    logFirebaseEvent('Text_launch_u_r_l');
                                    await launchURL(valueOrDefault(
                                        currentUserDocument?.web, ''));
                                  },
                                  child: Text(
                                    stackUsersRecord.web,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 2.0, 0.0),
                                child: Container(
                                  width: 50.0,
                                  height: 100.0,
                                  constraints: const BoxConstraints(
                                    maxHeight: 40.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FutureBuilder<int>(
                                        future: queryUserPostsRecordCount(
                                          queryBuilder: (userPostsRecord) =>
                                              userPostsRecord.where(
                                            'postUser',
                                            isEqualTo: widget.perfilAjeno,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 12.0,
                                                height: 12.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          int textCount = snapshot.data!;

                                          return Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                textCount,
                                                formatType: FormatType.compact,
                                              ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily),
                                                ),
                                          );
                                        },
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'mvkdi9wi' /* Posts */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 2.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'TARJETA_OTRO_PERFIL_Container_hrj3nf2z_O');
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                      'seguidores',
                                      queryParameters: {
                                        'usuario': serializeParam(
                                          widget.perfilAjeno,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: 50.0,
                                    height: 100.0,
                                    constraints: const BoxConstraints(
                                      maxHeight: 40.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                              stackUsersRecord
                                                  .listaSeguidores.length,
                                              formatType: FormatType.compact,
                                            ),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'm6pbxs80' /* Seguidores */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 2.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'TARJETA_OTRO_PERFIL_Container_abmug5lk_O');
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                      'seguidos',
                                      queryParameters: {
                                        'usuario': serializeParam(
                                          widget.perfilAjeno,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: 50.0,
                                    height: 100.0,
                                    constraints: const BoxConstraints(
                                      maxHeight: 40.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                              stackUsersRecord
                                                  .listaSeguidos.length,
                                              formatType: FormatType.compact,
                                            ),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'kovcaxh3' /* Seguidos */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: StreamBuilder<List<ChatsRecord>>(
                          stream: queryChatsRecord(
                            queryBuilder: (chatsRecord) =>
                                chatsRecord.where(Filter.or(
                              Filter(
                                'user_a',
                                isEqualTo: currentUserReference,
                              ),
                              Filter(
                                'user_b',
                                isEqualTo: widget.perfilAjeno,
                              ),
                              Filter(
                                'user_a',
                                isEqualTo: widget.perfilAjeno,
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
                            List<ChatsRecord> iconButtonChatsRecordList =
                                snapshot.data!;
                            final iconButtonChatsRecord =
                                iconButtonChatsRecordList.isNotEmpty
                                    ? iconButtonChatsRecordList.first
                                    : null;

                            return FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 28.0,
                              buttonSize: 40.0,
                              fillColor:
                                  FlutterFlowTheme.of(context).fondoIcono,
                              icon: Icon(
                                FFIcons.kaddMessageSvgrepoCom,
                                color: FlutterFlowTheme.of(context).icono,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'TARJETA_OTRO_PERFIL_addMessageSvgrepoCom');
                                var shouldSetState = false;
                                if (iconButtonChatsRecord != null) {
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.goNamed(
                                    'ChatPage',
                                    queryParameters: {
                                      'receiveChat': serializeParam(
                                        iconButtonChatsRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );

                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  logFirebaseEvent('IconButton_backend_call');

                                  var chatsRecordReference =
                                      ChatsRecord.collection.doc();
                                  await chatsRecordReference.set({
                                    ...createChatsRecordData(
                                      timeStamp: getCurrentTimestamp,
                                      userA: currentUserReference,
                                      userB: widget.perfilAjeno,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'userIds':
                                            functions.generateListOfUsers(
                                                currentUserReference!,
                                                widget.perfilAjeno!),
                                        'userNames':
                                            functions.generateListOfNames(
                                                currentUserDisplayName,
                                                stackUsersRecord.displayName),
                                      },
                                    ),
                                  });
                                  _model.refChats =
                                      ChatsRecord.getDocumentFromData({
                                    ...createChatsRecordData(
                                      timeStamp: getCurrentTimestamp,
                                      userA: currentUserReference,
                                      userB: widget.perfilAjeno,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'userIds':
                                            functions.generateListOfUsers(
                                                currentUserReference!,
                                                widget.perfilAjeno!),
                                        'userNames':
                                            functions.generateListOfNames(
                                                currentUserDisplayName,
                                                stackUsersRecord.displayName),
                                      },
                                    ),
                                  }, chatsRecordReference);
                                  shouldSetState = true;
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.goNamed(
                                    'ChatPage',
                                    queryParameters: {
                                      'receiveChat': serializeParam(
                                        _model.refChats?.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );

                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                }

                                if (shouldSetState) safeSetState(() {});
                              },
                            );
                          },
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 28.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).fondoIcono,
                        icon: Icon(
                          Icons.keyboard_control,
                          color: FlutterFlowTheme.of(context).icono,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'TARJETA_OTRO_PERFIL_keyboard_control_ICN');
                          logFirebaseEvent('IconButton_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            barrierColor: const Color(0x331A1A1A),
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SizedBox(
                                    height: 250.0,
                                    child: MenuOtroPerfilWidget(
                                      user: widget.perfilAjeno,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.88, -0.62),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 28.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).fondoIcono,
                  icon: Icon(
                    Icons.chevron_left_sharp,
                    color: FlutterFlowTheme.of(context).icono,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'TARJETA_OTRO_PERFIL_chevron_left_sharp_I');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.safePop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
