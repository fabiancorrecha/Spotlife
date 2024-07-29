import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/detalles_de_coleccion/detalles_de_coleccion_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'grid_colecciones_model.dart';
export 'grid_colecciones_model.dart';

class GridColeccionesWidget extends StatefulWidget {
  const GridColeccionesWidget({
    super.key,
    this.usuario,
    this.esCollecionTipoFavorito,
  });

  final DocumentReference? usuario;
  final bool? esCollecionTipoFavorito;

  @override
  State<GridColeccionesWidget> createState() => _GridColeccionesWidgetState();
}

class _GridColeccionesWidgetState extends State<GridColeccionesWidget> {
  late GridColeccionesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridColeccionesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: StreamBuilder<List<CollectionsRecord>>(
        stream: queryCollectionsRecord(
          queryBuilder: (collectionsRecord) => collectionsRecord
              .where(
                'createdBy',
                isEqualTo: widget.usuario,
              )
              .where(
                'coleccionFavoritos',
                isEqualTo: widget.esCollecionTipoFavorito,
              ),
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
          List<CollectionsRecord> gridViewCollectionsRecordList =
              snapshot.data!;

          return GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.14,
            ),
            scrollDirection: Axis.vertical,
            itemCount: gridViewCollectionsRecordList.length,
            itemBuilder: (context, gridViewIndex) {
              final gridViewCollectionsRecord =
                  gridViewCollectionsRecordList[gridViewIndex];
              return StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(
                    gridViewCollectionsRecord.createdBy!),
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

                  final containerIUserUsersRecord = snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 151.0,
                            height: 126.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent4,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Visibility(
                              visible: () {
                                if (gridViewCollectionsRecord
                                    .coleccionPrivada) {
                                  return (containerIUserUsersRecord.reference ==
                                      currentUserReference);
                                } else if (gridViewCollectionsRecord
                                    .coleccionAmigos) {
                                  return ((containerIUserUsersRecord
                                              .reference ==
                                          currentUserReference) ||
                                      containerIUserUsersRecord.listaSeguidos
                                          .contains(currentUserReference));
                                } else if (gridViewCollectionsRecord
                                    .coleccionPublica) {
                                  return true;
                                } else {
                                  return false;
                                }
                              }(),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'GRID_COLECCIONES_Stack_a1y4fptz_ON_TAP');
                                  logFirebaseEvent('Stack_navigate_to');

                                  context.pushNamed(
                                    'miperfilDetalleColeccion',
                                    queryParameters: {
                                      'coleccion': serializeParam(
                                        gridViewCollectionsRecord,
                                        ParamType.Document,
                                      ),
                                      'esFavorito': serializeParam(
                                        widget.esCollecionTipoFavorito,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'coleccion': gridViewCollectionsRecord,
                                    },
                                  );
                                },
                                child: Stack(
                                  children: [
                                    StreamBuilder<List<UserPostsRecord>>(
                                      stream: queryUserPostsRecord(
                                        queryBuilder: (userPostsRecord) =>
                                            userPostsRecord.where(
                                          'collections',
                                          arrayContains:
                                              gridViewCollectionsRecord
                                                  .reference,
                                        ),
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
                                        List<UserPostsRecord>
                                            imageUserPostsRecordList =
                                            snapshot.data!;
                                        final imageUserPostsRecord =
                                            imageUserPostsRecordList.isNotEmpty
                                                ? imageUserPostsRecordList.first
                                                : null;

                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              () {
                                                if (gridViewCollectionsRecord
                                                            .imagen !=
                                                        '') {
                                                  return gridViewCollectionsRecord
                                                      .imagen;
                                                } else {
                                                  return imageUserPostsRecord
                                                    ?.postPhotolist.first;
                                                }
                                              
                                              }(),
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/tk7vl1robaxz/Logo_Spotlife_Nuevo.png',
                                            ),
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(
                                            '',
                                          ).image,
                                        ),
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0x005C52E2),
                                            FlutterFlowTheme.of(context).primary
                                          ],
                                          stops: const [0.5, 1.0],
                                          begin:
                                              const AlignmentDirectional(0.0, -1.0),
                                          end: const AlignmentDirectional(0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 10.0, 8.0, 10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'GRID_COLECCIONES_Card_5zl827o1_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Card_bottom_sheet');
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: SizedBox(
                                                              height: 260.0,
                                                              child:
                                                                  DetallesDeColeccionWidget(
                                                                coleccion:
                                                                    gridViewCollectionsRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: Colors.transparent,
                                                    elevation: 0.0,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: FaIcon(
                                                        FontAwesomeIcons
                                                            .ellipsisV,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 14.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Text(
                                                      gridViewCollectionsRecord
                                                          .nombre,
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (gridViewCollectionsRecord
                                                        .coleccionPublica)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .globeEurope,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 14.0,
                                                        ),
                                                      ),
                                                    if (gridViewCollectionsRecord
                                                        .coleccionAmigos)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .userFriends,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 14.0,
                                                        ),
                                                      ),
                                                    if (gridViewCollectionsRecord
                                                        .coleccionPrivada)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .userSecret,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 14.0,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    gridViewCollectionsRecord
                                                        .descripcion,
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
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
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
