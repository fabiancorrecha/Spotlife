import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'favorito_a_coleccion_model.dart';
export 'favorito_a_coleccion_model.dart';

class FavoritoAColeccionWidget extends StatefulWidget {
  const FavoritoAColeccionWidget({
    super.key,
    this.post,
  });

  final DocumentReference? post;

  @override
  State<FavoritoAColeccionWidget> createState() =>
      _FavoritoAColeccionWidgetState();
}

class _FavoritoAColeccionWidgetState extends State<FavoritoAColeccionWidget> {
  late FavoritoAColeccionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritoAColeccionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
            child: Container(
              width: 52.0,
              height: 5.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).fondoIcono,
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
          Text(
            FFLocalizations.of(context).getText(
              'pvzklx2d' /* Añadir favorito a colección */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 50.0, 16.0, 0.0),
              child: Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'FAVORITO_A_COLECCION_Row_nu3sltk1_ON_TAP');
                            logFirebaseEvent('Row_navigate_to');

                            context.pushNamed(
                              'CrearColeccionConPost',
                              queryParameters: {
                                'post': serializeParam(
                                  widget.post,
                                  ParamType.DocumentReference,
                                ),
                                'esColeccionFavorito': serializeParam(
                                  true,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.add_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 32.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'm970bwtb' /* Crear una nueva colección */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 150.0,
                            decoration: const BoxDecoration(),
                            child: StreamBuilder<List<CollectionsRecord>>(
                              stream: queryCollectionsRecord(
                                queryBuilder: (collectionsRecord) =>
                                    collectionsRecord
                                        .where(
                                          'createdBy',
                                          isEqualTo: currentUserReference,
                                        )
                                        .where(
                                          'coleccionFavoritos',
                                          isEqualTo: true,
                                        )
                                        .orderBy('modified_at'),
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
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CollectionsRecord>
                                    listViewCollectionsRecordList =
                                    snapshot.data!;

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewCollectionsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewCollectionsRecord =
                                        listViewCollectionsRecordList[
                                            listViewIndex];
                                    return Container(
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Stack(
                                              children: [
                                                if (listViewCollectionsRecord
                                                    .postuUserList
                                                    .contains(widget.post))
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
                                                          'FAVORITO_A_COLECCION_ContainerRelleno_ON');
                                                      logFirebaseEvent(
                                                          'ContainerRelleno_backend_call');

                                                      await listViewCollectionsRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'postuUserList':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              widget.post
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    },
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Stack(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          Container(
                                                            width: 20.0,
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.check_box,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 32.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                if (!listViewCollectionsRecord
                                                    .postuUserList
                                                    .contains(widget.post))
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
                                                          'FAVORITO_A_COLECCION_IconSinRelleno_ON_T');
                                                      logFirebaseEvent(
                                                          'IconSinRelleno_backend_call');

                                                      await listViewCollectionsRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'postuUserList':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              widget.post
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                      logFirebaseEvent(
                                                          'IconSinRelleno_backend_call');

                                                      await widget.post!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'FavoritoUser':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.crop_square,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 32.0,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                listViewCollectionsRecord
                                                    .nombre,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
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
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.boton1Model,
                              updateCallback: () => safeSetState(() {}),
                              child: Boton1Widget(
                                texto: 'Listo',
                                desabilitado: false,
                                accion: () async {
                                  logFirebaseEvent(
                                      'FAVORITO_A_COLECCION_Container_7x54u338_');
                                  logFirebaseEvent('boton1_bottom_sheet');
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
