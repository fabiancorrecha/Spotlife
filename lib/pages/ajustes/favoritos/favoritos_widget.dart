import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/ajustes_usuario_principal/ajustes_usuario_principal_widget.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/detalles_de_coleccion/detalles_de_coleccion_widget.dart';
import '/components/menu_post_ajeno/menu_post_ajeno_widget.dart';
import '/components/menu_post_propio/menu_post_propio_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar_perfil_propio/nav_bar_perfil_propio_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'favoritos_model.dart';
export 'favoritos_model.dart';

class FavoritosWidget extends StatefulWidget {
  const FavoritosWidget({super.key});

  @override
  State<FavoritosWidget> createState() => _FavoritosWidgetState();
}

class _FavoritosWidgetState extends State<FavoritosWidget>
    with TickerProviderStateMixin {
  late FavoritosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritosModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'favoritos'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 73.0,
                    decoration: const BoxDecoration(),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.chevron_left,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 40.0,
                            height: 40.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 500),
                              fadeOutDuration: const Duration(milliseconds: 500),
                              imageUrl: valueOrDefault<String>(
                                currentUserPhoto,
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color:
                                      FlutterFlowTheme.of(context).fondoIcono,
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 28.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).fondoIcono,
                                    icon: Icon(
                                      FFIcons.kbubble2,
                                      color: FlutterFlowTheme.of(context).icono,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'FAVORITOS_PAGE_bubble2_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context.pushNamed('TodosLosChats');
                                    },
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 28.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).fondoIcono,
                                  icon: Icon(
                                    FFIcons.ksettings,
                                    color: FlutterFlowTheme.of(context).icono,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'FAVORITOS_PAGE_settings_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      barrierColor: const Color(0x331A1A1A),
                                      isDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: const SizedBox(
                                                height: 667.0,
                                                child:
                                                    AjustesUsuarioPrincipalWidget(),
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
                      ],
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navBarPerfilPropioModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const NavBarPerfilPropioWidget(
                      tab: 3,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: TabBar(
                            isScrollable: true,
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                            indicatorColor:
                                FlutterFlowTheme.of(context).alternate,
                            indicatorWeight: 0.1,
                            tabs: [
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  '7kouip33' /* Post */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'ye0x904b' /* Colecciónes */,
                                ),
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
                              Container(
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 70.0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child:
                                          StreamBuilder<List<UserPostsRecord>>(
                                        stream: queryUserPostsRecord(
                                          queryBuilder: (userPostsRecord) =>
                                              userPostsRecord.where(
                                            'FavoritoUser',
                                            arrayContains: currentUserReference,
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
                                          List<UserPostsRecord>
                                              gridViewUserPostsRecordList =
                                              snapshot.data!;
                                          if (gridViewUserPostsRecordList
                                              .isEmpty) {
                                            return const Center(
                                              child: SizedBox(
                                                width: 200.0,
                                                child: ComponenteVacioWidget(),
                                              ),
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
                                            itemCount:
                                                gridViewUserPostsRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, gridViewIndex) {
                                              final gridViewUserPostsRecord =
                                                  gridViewUserPostsRecordList[
                                                      gridViewIndex];
                                              return Stack(
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final listaImagenes =
                                                          gridViewUserPostsRecord
                                                              .postPhotolist
                                                              .toList();

                                                      return SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              listaImagenes
                                                                  .length,
                                                              (listaImagenesIndex) {
                                                            final listaImagenesItem =
                                                                listaImagenes[
                                                                    listaImagenesIndex];
                                                            return InkWell(
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
                                                                    'FAVORITOS_PAGE_Container_m7jo7m7y_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Container_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'VistaPostlist',
                                                                  queryParameters:
                                                                      {
                                                                    'user':
                                                                        serializeParam(
                                                                      gridViewUserPostsRecord
                                                                          .postUser,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                    'index':
                                                                        serializeParam(
                                                                      gridViewUserPostsRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    kTransitionInfoKey:
                                                                        const TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .fade,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              0),
                                                                    ),
                                                                  },
                                                                );

                                                                logFirebaseEvent(
                                                                    'Container_update_app_state');
                                                                FFAppState()
                                                                        .verCajaComentariosActualizados =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.446,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.323,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child:
                                                                    Visibility(
                                                                  visible:
                                                                      gridViewUserPostsRecord
                                                                          .esVideo,
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'FAVORITOS_PAGE_Image_aoqly1kl_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Image_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'VistaPostlist',
                                                                        queryParameters:
                                                                            {
                                                                          'user':
                                                                              serializeParam(
                                                                            gridViewUserPostsRecord.postUser,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                          'index':
                                                                              serializeParam(
                                                                            gridViewUserPostsRecord.reference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          kTransitionInfoKey:
                                                                              const TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.fade,
                                                                            duration:
                                                                                Duration(milliseconds: 0),
                                                                          ),
                                                                        },
                                                                      );

                                                                      logFirebaseEvent(
                                                                          'Image_update_app_state');
                                                                      FFAppState()
                                                                              .verCajaComentariosActualizados =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    onLongPress:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'FAVORITOS_Image_aoqly1kl_ON_LONG_PRESS');
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
                                                                              PageTransitionType.fade,
                                                                          child:
                                                                              FlutterFlowExpandedImageView(
                                                                            image:
                                                                                CachedNetworkImage(
                                                                              fadeInDuration: const Duration(milliseconds: 500),
                                                                              fadeOutDuration: const Duration(milliseconds: 500),
                                                                              imageUrl: listaImagenesItem,
                                                                              fit: BoxFit.contain,
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
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          fadeInDuration:
                                                                              const Duration(milliseconds: 500),
                                                                          fadeOutDuration:
                                                                              const Duration(milliseconds: 500),
                                                                          imageUrl:
                                                                              listaImagenesItem,
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
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
                                                  if (gridViewUserPostsRecord
                                                      .esVideo)
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 300.0,
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
                                                        child: SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          child: custom_widgets
                                                              .CustomVideoPlayerMiniture(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            videoPath:
                                                                gridViewUserPostsRecord
                                                                    .video,
                                                            soundOn: Icon(
                                                              Icons.fourteen_mp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 10.0,
                                                            ),
                                                            soundOff: Icon(
                                                              Icons
                                                                  .sixteen_mp_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 10.0,
                                                            ),
                                                            fullscreen: Icon(
                                                              Icons
                                                                  .thirteen_mp_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 10.0,
                                                            ),
                                                            closeScreem: Icon(
                                                              Icons
                                                                  .onetwothree_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 10.0,
                                                            ),
                                                            buttonSize: 40.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (gridViewUserPostsRecord
                                                          .postPhotolist
                                                          .length >=
                                                      2)
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.84, -0.79),
                                                      child: Icon(
                                                        FFIcons.kcopy,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -0.85, -0.87),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.keyboard_control,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .icono,
                                                        size: 24.0,
                                                      ),
                                                      showLoadingIndicator:
                                                          true,
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'FAVORITOS_keyboard_control_ICN_ON_TAP');
                                                        if (currentUserReference ==
                                                            gridViewUserPostsRecord
                                                                .postUser) {
                                                          logFirebaseEvent(
                                                              'IconButton_bottom_sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          196.0,
                                                                      child:
                                                                          MenuPostPropioWidget(
                                                                        post: gridViewUserPostsRecord
                                                                            .reference,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        } else {
                                                          logFirebaseEvent(
                                                              'IconButton_bottom_sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.5,
                                                                      child:
                                                                          MenuPostAjenoWidget(
                                                                        link:
                                                                            'hhyhyh',
                                                                        post: gridViewUserPostsRecord
                                                                            .reference,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child:
                                        StreamBuilder<List<CollectionsRecord>>(
                                      stream: queryCollectionsRecord(
                                        queryBuilder: (collectionsRecord) =>
                                            collectionsRecord
                                                .where(
                                                  'createdBy',
                                                  isEqualTo:
                                                      currentUserReference,
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
                                        List<CollectionsRecord>
                                            gripgeneralCollectionsRecordList =
                                            snapshot.data!;
                                        if (gripgeneralCollectionsRecordList
                                            .isEmpty) {
                                          return const Center(
                                            child: ComponenteVacioWidget(),
                                          );
                                        }

                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                            childAspectRatio: 1.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              gripgeneralCollectionsRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, gripgeneralIndex) {
                                            final gripgeneralCollectionsRecord =
                                                gripgeneralCollectionsRecordList[
                                                    gripgeneralIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    gripgeneralCollectionsRecord
                                                        .createdBy!),
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  final containerIUserUsersRecord =
                                                      snapshot.data!;

                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 151.0,
                                                            height: 126.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            child: Visibility(
                                                              visible: () {
                                                                if (gripgeneralCollectionsRecord
                                                                    .coleccionPrivada) {
                                                                  return (containerIUserUsersRecord
                                                                          .reference ==
                                                                      currentUserReference);
                                                                } else if (gripgeneralCollectionsRecord
                                                                    .coleccionAmigos) {
                                                                  return ((containerIUserUsersRecord
                                                                              .reference ==
                                                                          currentUserReference) ||
                                                                      containerIUserUsersRecord
                                                                          .listaSeguidos
                                                                          .contains(
                                                                              currentUserReference));
                                                                } else if (gripgeneralCollectionsRecord
                                                                    .coleccionPublica) {
                                                                  return true;
                                                                } else {
                                                                  return false;
                                                                }
                                                              }(),
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'FAVORITOS_PAGE_Stack_1hvvsybb_ON_TAP');
                                                                  currentUserLocationValue = await getCurrentUserLocation(
                                                                      defaultLocation:
                                                                          const LatLng(
                                                                              0.0,
                                                                              0.0));
                                                                  logFirebaseEvent(
                                                                      'Stack_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'miperfilDetalleColeccion',
                                                                    queryParameters:
                                                                        {
                                                                      'coleccion':
                                                                          serializeParam(
                                                                        gripgeneralCollectionsRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'esFavorito':
                                                                          serializeParam(
                                                                        false,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'usuario':
                                                                          serializeParam(
                                                                        currentUserReference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'refColeccion':
                                                                          serializeParam(
                                                                        gripgeneralCollectionsRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'ubicationCollection':
                                                                          serializeParam(
                                                                        gripgeneralCollectionsRecord.placeInfo.latLng ?? currentUserLocationValue,
                                                                        ParamType
                                                                            .LatLng,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'coleccion':
                                                                          gripgeneralCollectionsRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child: Stack(
                                                                  children: [
                                                                    StreamBuilder<
                                                                        List<
                                                                            UserPostsRecord>>(
                                                                      stream:
                                                                          queryUserPostsRecord(
                                                                        queryBuilder:
                                                                            (userPostsRecord) =>
                                                                                userPostsRecord.where(
                                                                          'collections',
                                                                          arrayContains:
                                                                              gripgeneralCollectionsRecord.reference,
                                                                        ),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        List<UserPostsRecord>
                                                                            imageUserPostsRecordList =
                                                                            snapshot.data!;
                                                                        final imageUserPostsRecord = imageUserPostsRecordList.isNotEmpty
                                                                            ? imageUserPostsRecordList.first
                                                                            : null;

                                                                        return ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                valueOrDefault<String>(
                                                                              () {
                                                                                if (gripgeneralCollectionsRecord.imagen != '') {
                                                                                  return gripgeneralCollectionsRecord.imagen;
                                                                                } else {
                                                                                  return imageUserPostsRecord?.postPhotolist.firstOrNull;
                                                                                }
                                                                              
                                                                              }(),
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/tk7vl1robaxz/Logo_Spotlife_Nuevo.png',
                                                                            ),
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              Image.network(
                                                                            '',
                                                                          ).image,
                                                                        ),
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            const Color(0x005C52E2),
                                                                            FlutterFlowTheme.of(context).primary
                                                                          ],
                                                                          stops: const [
                                                                            0.5,
                                                                            1.0
                                                                          ],
                                                                          begin: const AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          end: const AlignmentDirectional(
                                                                              0,
                                                                              1.0),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            10.0,
                                                                            8.0,
                                                                            10.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 8.0,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: const Color(0x00F4F176),
                                                                                  icon: FaIcon(
                                                                                    FontAwesomeIcons.ellipsisV,
                                                                                    color: FlutterFlowTheme.of(context).btnText,
                                                                                    size: 16.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('FAVORITOS_PAGE_ellipsisV_ICN_ON_TAP');
                                                                                    logFirebaseEvent('IconButton_bottom_sheet');
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return WebViewAware(
                                                                                          child: GestureDetector(
                                                                                            onTap: () {
                                                                                              FocusScope.of(context).unfocus();
                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                            },
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: SizedBox(
                                                                                                height: 260.0,
                                                                                                child: DetallesDeColeccionWidget(
                                                                                                  coleccion: gripgeneralCollectionsRecord.reference,
                                                                                                ),
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
                                                                            const Spacer(),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                    child: Text(
                                                                                      gripgeneralCollectionsRecord.nombre,
                                                                                      maxLines: 1,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (gripgeneralCollectionsRecord.coleccionPublica)
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.globeEurope,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 14.0,
                                                                                        ),
                                                                                      ),
                                                                                    if (gripgeneralCollectionsRecord.coleccionAmigos)
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.userFriends,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 14.0,
                                                                                        ),
                                                                                      ),
                                                                                    if (gripgeneralCollectionsRecord.coleccionPrivada)
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.userSecret,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
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
                                                                                    gripgeneralCollectionsRecord.descripcion,
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                              ),
                                            );
                                          },
                                        );
                                      },
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
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: wrapWithModel(
                  model: _model.navBar1Model,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavBar1Widget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
