import '/backend/backend.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/menu02/menu02_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'buscar_spots_model.dart';
export 'buscar_spots_model.dart';

class BuscarSpotsWidget extends StatefulWidget {
  const BuscarSpotsWidget({super.key});

  @override
  State<BuscarSpotsWidget> createState() => _BuscarSpotsWidgetState();
}

class _BuscarSpotsWidgetState extends State<BuscarSpotsWidget>
    with TickerProviderStateMixin {
  late BuscarSpotsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuscarSpotsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'buscarSpots'});
    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.textFieldBuscarTextController ??= TextEditingController();
    _model.textFieldBuscarFocusNode ??= FocusNode();

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 32.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'BUSCAR_SPOTS_Container_wq4j6xzc_ON_TAP');
                            logFirebaseEvent('Container_navigate_back');
                            context.pop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).fondoIcono,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                FFIcons.karrowBack,
                                color: FlutterFlowTheme.of(context).icono,
                                size: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: TextFormField(
                            controller: _model.textFieldBuscarTextController,
                            focusNode: _model.textFieldBuscarFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textFieldBuscarTextController',
                              const Duration(milliseconds: 0),
                              () async {
                                logFirebaseEvent(
                                    'BUSCAR_SPOTS_TextFieldBuscar_ON_TEXTFIEL');
                                logFirebaseEvent(
                                    'TextFieldBuscar_simple_search');
                                await queryUserPostsRecordOnce()
                                    .then(
                                      (records) => _model.simpleSearchResults =
                                          TextSearch(
                                        records
                                            .map(
                                              (record) =>
                                                  TextSearchItem.fromTerms(
                                                      record, [
                                                record.postTitle,
                                                record.postDescription
                                              ]),
                                            )
                                            .toList(),
                                      )
                                              .search(_model
                                                  .textFieldBuscarTextController
                                                  .text)
                                              .map((r) => r.object)
                                              .toList(),
                                    )
                                    .onError((_, __) =>
                                        _model.simpleSearchResults = [])
                                    .whenComplete(() => setState(() {}));
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                '6leulu8q' /* Buscar */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
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
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).fondoIcono,
                              suffixIcon: const Icon(
                                FFIcons.ksearch,
                                color: Color(0xFF757575),
                                size: 22.0,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            validator: _model
                                .textFieldBuscarTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'BUSCAR_SPOTS_Container_o3dszcpb_ON_TAP');
                          logFirebaseEvent('Container_update_page_state');
                          _model.verLista = !_model.verLista;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).fondoIcono,
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            children: [
                              if (_model.verLista)
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    FFIcons.kgrid,
                                    color: FlutterFlowTheme.of(context).icono,
                                    size: 18.0,
                                  ),
                                ),
                              if (!_model.verLista)
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    FFIcons.kframe169,
                                    color: FlutterFlowTheme.of(context).icono,
                                    size: 18.0,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.menu02Model,
                updateCallback: () => setState(() {}),
                child: const Menu02Widget(
                  seccion: 1,
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    if (_model.verLista &&
                        (_model.textFieldBuscarTextController.text != ''))
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final postResultado =
                                _model.simpleSearchResults.toList();
                            if (postResultado.isEmpty) {
                              return const Center(
                                child: ComponenteVacioWidget(),
                              );
                            }

                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                                childAspectRatio: 0.72,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: postResultado.length,
                              itemBuilder: (context, postResultadoIndex) {
                                final postResultadoItem =
                                    postResultado[postResultadoIndex];
                                return StreamBuilder<UserPostsRecord>(
                                  stream: UserPostsRecord.getDocument(
                                      postResultadoItem.reference),
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

                                    final stackUserPostsRecord = snapshot.data!;

                                    return Stack(
                                      children: [
                                        if (stackUserPostsRecord.esVideo)
                                          FlutterFlowVideoPlayer(
                                            path: stackUserPostsRecord.video,
                                            videoType: VideoType.network,
                                            width: 216.0,
                                            height: 300.0,
                                            autoPlay: false,
                                            looping: true,
                                            showControls: true,
                                            allowFullScreen: true,
                                            allowPlaybackSpeedMenu: false,
                                          ),
                                        if (!stackUserPostsRecord.esVideo)
                                          Builder(
                                            builder: (context) {
                                              final listaImagenes =
                                                  postResultadoItem
                                                      .postPhotolist
                                                      .toList();

                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      listaImagenes.length,
                                                      (listaImagenesIndex) {
                                                    final listaImagenesItem =
                                                        listaImagenes[
                                                            listaImagenesIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.437,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.278,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Visibility(
                                                          visible:
                                                              !stackUserPostsRecord
                                                                  .esVideo,
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'BUSCAR_SPOTS_PAGE_Image_2zjczlgg_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Image_navigate_to');

                                                              context.pushNamed(
                                                                'detallePost',
                                                                pathParameters:
                                                                    {
                                                                  'post':
                                                                      serializeParam(
                                                                    stackUserPostsRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'post':
                                                                      stackUserPostsRecord,
                                                                },
                                                              );
                                                            },
                                                            onLongPress:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'BUSCAR_SPOTS_Image_2zjczlgg_ON_LONG_PRES');
                                                              logFirebaseEvent(
                                                                  'Image_haptic_feedback');
                                                              HapticFeedback
                                                                  .lightImpact();
                                                              logFirebaseEvent(
                                                                  'Image_expand_image');
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .network(
                                                                      listaImagenesItem,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag:
                                                                        listaImagenesItem,
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag:
                                                                  listaImagenesItem,
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                                child: Image
                                                                    .network(
                                                                  listaImagenesItem,
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'imageOnPageLoadAnimation']!),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    if (!_model.verLista)
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.MapaPerzonalizado(
                          width: double.infinity,
                          height: double.infinity,
                          ubicacionInicialLat: valueOrDefault<double>(
                            functions.obtenerLatLng(
                                currentUserLocationValue!, true),
                            51.5389535,
                          ),
                          ubicacionInicialLng: valueOrDefault<double>(
                            functions.obtenerLatLng(
                                currentUserLocationValue!, false),
                            5.1719404,
                          ),
                          zoom: 16.0,
                          listaPostMarcadores: _model.simpleSearchResults,
                        ),
                      ),
                  ],
                ),
              ),
              wrapWithModel(
                model: _model.navBar1Model,
                updateCallback: () => setState(() {}),
                child: const NavBar1Widget(
                  tabActiva: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
