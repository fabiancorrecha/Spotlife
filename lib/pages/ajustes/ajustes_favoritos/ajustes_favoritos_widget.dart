import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/buscador_colecciones/buscador_colecciones_widget.dart';
import '/components/cabecera/cabecera_widget.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/grid_colecciones/grid_colecciones_widget.dart';
import '/components/post_imagen_v2/post_imagen_v2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/walkthroughs/mis_favoritos.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ajustes_favoritos_model.dart';
export 'ajustes_favoritos_model.dart';

class AjustesFavoritosWidget extends StatefulWidget {
  const AjustesFavoritosWidget({super.key});

  @override
  State<AjustesFavoritosWidget> createState() => _AjustesFavoritosWidgetState();
}

class _AjustesFavoritosWidgetState extends State<AjustesFavoritosWidget>
    with TickerProviderStateMixin {
  late AjustesFavoritosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AjustesFavoritosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ajustes_Favoritos'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
          child: Stack(
            children: [
              StreamBuilder<List<CollectionsRecord>>(
                stream: queryCollectionsRecord(
                  queryBuilder: (collectionsRecord) => collectionsRecord
                      .where(
                        'createdBy',
                        isEqualTo: currentUserReference,
                      )
                      .where(
                        'coleccionFavoritos',
                        isEqualTo: true,
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
                  List<CollectionsRecord> containerCollectionsRecordList =
                      snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.cabeceraModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const CabeceraWidget(
                                seccion: 0,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: const Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            fontSize: 0.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      unselectedLabelStyle: const TextStyle(),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      padding: const EdgeInsets.all(4.0),
                                      tabs: [
                                        const Tab(
                                          icon: Icon(
                                            FFIcons.kcollection,
                                            size: 32.0,
                                          ),
                                        ).addWalkthrough(
                                          tabY38cfb8b,
                                          _model.misFavoritosController,
                                        ),
                                        const Tab(
                                          icon: Icon(
                                            FFIcons.kpageFill,
                                            size: 32.0,
                                          ),
                                        ).addWalkthrough(
                                          tabS43zaii5,
                                          _model.misFavoritosController,
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [() async {}, () async {}][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        Stack(
                                          children: [
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Builder(
                                                      builder: (context) {
                                                        final listadoPostFavoritos =
                                                            (currentUserDocument
                                                                        ?.listaPostFavoritos
                                                                        .toList() ??
                                                                    [])
                                                                .toList();
                                                        if (listadoPostFavoritos
                                                            .isEmpty) {
                                                          return const Center(
                                                            child:
                                                                ComponenteVacioWidget(),
                                                          );
                                                        }

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listadoPostFavoritos
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listadoPostFavoritosIndex) {
                                                            final listadoPostFavoritosItem =
                                                                listadoPostFavoritos[
                                                                    listadoPostFavoritosIndex];
                                                            return StreamBuilder<
                                                                UserPostsRecord>(
                                                              stream: UserPostsRecord
                                                                  .getDocument(
                                                                      listadoPostFavoritosItem),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          12.0,
                                                                      height:
                                                                          12.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }

                                                                final containerUserPostsRecord =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .postImagenV2Models
                                                                        .getModel(
                                                                      listadoPostFavoritosItem
                                                                          .id,
                                                                      listadoPostFavoritosIndex,
                                                                    ),
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        PostImagenV2Widget(
                                                                      key: Key(
                                                                        'Key4h9_${listadoPostFavoritosItem.id}',
                                                                      ),
                                                                      post:
                                                                          containerUserPostsRecord,
                                                                      verIconoCompartir:
                                                                          false,
                                                                      verComentarios:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
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
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model
                                                  .buscadorColeccionesModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: BuscadorColeccionesWidget(
                                                coleccionesLista:
                                                    containerCollectionsRecordList,
                                                puedeCrearColeccion: true,
                                                esColeccionFavorito: true,
                                              ),
                                            ),
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .gridColeccionesModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        GridColeccionesWidget(
                                                      usuario:
                                                          currentUserReference,
                                                      esCollecionTipoFavorito:
                                                          true,
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    34.0),
                                                        child: Container(
                                                          width: 60.0,
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    10.0),
                                                            child: Icon(
                                                              FFIcons.kadd,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .icono,
                                                              size: 28.0,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              Align(
                alignment: const AlignmentDirectional(0.87, -0.92),
                child: FlutterFlowIconButton(
                  borderColor: const Color(0x00F4F176),
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: const Color(0x00EEEEEE),
                  icon: Icon(
                    Icons.help,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('AJUSTES_FAVORITOS_PAGE_help_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_start_walkthrough');
                    safeSetState(() => _model.misFavoritosController =
                        createPageWalkthrough(context));
                    _model.misFavoritosController?.show(context: context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.misFavoritosController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
