import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/favorito_a_coleccion/favorito_a_coleccion_widget.dart';
import '/components/menu_post_ajeno/menu_post_ajeno_widget.dart';
import '/components/menu_post_propio/menu_post_propio_widget.dart';
import '/components/ver_comentarios/ver_comentarios_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'post_desing_model.dart';
export 'post_desing_model.dart';

class PostDesingWidget extends StatefulWidget {
  const PostDesingWidget({
    super.key,
    required this.post,
  });

  final UserPostsRecord? post;

  @override
  State<PostDesingWidget> createState() => _PostDesingWidgetState();
}

class _PostDesingWidgetState extends State<PostDesingWidget>
    with TickerProviderStateMixin {
  late PostDesingModel _model;

  bool expandableListenerRegistered = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostDesingModel());

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
    _model.textFieldComentariosTextController ??= TextEditingController();
    _model.textFieldComentariosFocusNode ??= FocusNode();

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 300.0.ms,
            begin: const Offset(30.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

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
      stream: UsersRecord.getDocument(widget.post!.postUser!),
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

        final columnUsersRecord = snapshot.data!;

        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            StreamBuilder<UserPostsRecord>(
              stream: UserPostsRecord.getDocument(widget.post!.reference),
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

                final containerUserPostsRecord = snapshot.data!;

                return Container(
                  width: double.infinity,
                  height: 500.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Stack(
                    children: [
                      if ((widget.post?.esVideo == false) &&
                          (widget.post?.postPhotolist.length == 1))
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 500),
                            fadeOutDuration: const Duration(milliseconds: 500),
                            imageUrl: widget.post!.postPhotolist.firstOrNull!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      if (widget.post?.esVideo == true)
                        SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: custom_widgets.CustomVideoPlayer(
                            width: double.infinity,
                            height: double.infinity,
                            videoPath: widget.post!.video,
                            soundOn: Icon(
                              Icons.volume_up,
                              color: FlutterFlowTheme.of(context).btnText,
                              size: 15.0,
                            ),
                            soundOff: Icon(
                              Icons.volume_mute,
                              color: FlutterFlowTheme.of(context).btnText,
                              size: 15.0,
                            ),
                            fullscreen: Icon(
                              Icons.fullscreen_sharp,
                              color: FlutterFlowTheme.of(context).btnText,
                              size: 15.0,
                            ),
                            closeScreem: Icon(
                              Icons.fullscreen_exit,
                              color: FlutterFlowTheme.of(context).btnText,
                              size: 15.0,
                            ),
                            buttonSize: 30.0,
                          ),
                        ),
                      if ((widget.post?.esVideo == false) &&
                          (widget.post!.postPhotolist.length > 1))
                        Builder(
                          builder: (context) {
                            final imagenes =
                                widget.post?.postPhotolist.toList() ?? [];

                            return SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  PageView.builder(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage: max(0,
                                                min(0, imagenes.length - 1))),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: imagenes.length,
                                    itemBuilder: (context, imagenesIndex) {
                                      final imagenesItem =
                                          imagenes[imagenesIndex];
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    const Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    const Duration(milliseconds: 500),
                                                imageUrl: imagenesItem,
                                                width: double.infinity,
                                                height: 530.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage: max(
                                                    0,
                                                    min(0,
                                                        imagenes.length - 1))),
                                        count: imagenes.length,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) async {
                                          await _model.pageViewController!
                                              .animateToPage(
                                            i,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                          safeSetState(() {});
                                        },
                                        effect:
                                            smooth_page_indicator.SlideEffect(
                                          spacing: 6.0,
                                          radius: 8.0,
                                          dotWidth: 6.0,
                                          dotHeight: 6.0,
                                          dotColor: const Color(0xFFFAF7FA),
                                          activeDotColor:
                                              FlutterFlowTheme.of(context)
                                                  .btnText,
                                          paintStyle: PaintingStyle.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            17.0, 17.0, 17.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    widget.post!.postUser!),
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

                                  final rowUsersRecord = snapshot.data!;

                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              const Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              const Duration(milliseconds: 500),
                                          imageUrl: valueOrDefault<String>(
                                            rowUsersRecord.photoUrl,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        rowUsersRecord
                                                            .displayName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Icon(
                                                      FFIcons.kpin,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 14.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      '${widget.post?.placeInfo.address}, ${widget.post?.placeInfo.city}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
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
                                  );
                                },
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.keyboard_control,
                                color: FlutterFlowTheme.of(context).btnText,
                                size: 24.0,
                              ),
                              showLoadingIndicator: true,
                              onPressed: () async {
                                logFirebaseEvent(
                                    'POST_DESING_keyboard_control_ICN_ON_TAP');
                                if (currentUserReference ==
                                    columnUsersRecord.reference) {
                                  logFirebaseEvent('IconButton_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: 196.0,
                                            child: MenuPostPropioWidget(
                                              post: containerUserPostsRecord
                                                  .reference,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                } else {
                                  logFirebaseEvent('IconButton_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.5,
                                            child: MenuPostAjenoWidget(
                                              link: 'hhyhyh',
                                              post: containerUserPostsRecord
                                                  .reference,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              17.0, 17.0, 17.0, 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: ToggleIcon(
                                      onPressed: () async {
                                        safeSetState(
                                            () => _model.like = !_model.like!);
                                        logFirebaseEvent(
                                            'POST_DESING_ToggleIcon_ldhj6um1_ON_TOGGL');
                                        if (_model.like!) {
                                          logFirebaseEvent(
                                              'ToggleIcon_update_component_state');
                                          _model.like = true;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'ToggleIcon_backend_call');

                                          await containerUserPostsRecord
                                              .reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'likes': FieldValue.arrayUnion(
                                                    [currentUserReference]),
                                                'numeroLikes':
                                                    FieldValue.increment(1),
                                              },
                                            ),
                                          });
                                          logFirebaseEvent(
                                              'ToggleIcon_backend_call');

                                          var actividadRecordReference =
                                              ActividadRecord.collection.doc();
                                          await actividadRecordReference.set({
                                            ...createActividadRecordData(
                                              creadorActividad:
                                                  currentUserReference,
                                              recibeActividad:
                                                  columnUsersRecord.reference,
                                              sinLeer: true,
                                              meGusta: true,
                                              esComentario: false,
                                              esSeguir: false,
                                              nombreUsuarioCreador:
                                                  currentUserDisplayName,
                                              nombreUsuarioReceptor:
                                                  columnUsersRecord.displayName,
                                              fechaCreacion:
                                                  getCurrentTimestamp,
                                              postRelacionado:
                                                  containerUserPostsRecord
                                                      .reference,
                                              meGustaComentario: false,
                                              imagenUsuario: currentUserPhoto,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'imagenPostList':
                                                    containerUserPostsRecord
                                                        .postPhotolist,
                                              },
                                            ),
                                          });
                                          _model.actividad = ActividadRecord
                                              .getDocumentFromData({
                                            ...createActividadRecordData(
                                              creadorActividad:
                                                  currentUserReference,
                                              recibeActividad:
                                                  columnUsersRecord.reference,
                                              sinLeer: true,
                                              meGusta: true,
                                              esComentario: false,
                                              esSeguir: false,
                                              nombreUsuarioCreador:
                                                  currentUserDisplayName,
                                              nombreUsuarioReceptor:
                                                  columnUsersRecord.displayName,
                                              fechaCreacion:
                                                  getCurrentTimestamp,
                                              postRelacionado:
                                                  containerUserPostsRecord
                                                      .reference,
                                              meGustaComentario: false,
                                              imagenUsuario: currentUserPhoto,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'imagenPostList':
                                                    containerUserPostsRecord
                                                        .postPhotolist,
                                              },
                                            ),
                                          }, actividadRecordReference);
                                          logFirebaseEvent(
                                              'ToggleIcon_trigger_push_notification');
                                          triggerPushNotification(
                                            notificationTitle:
                                                'A ${valueOrDefault(currentUserDocument?.userName, '')}le gusto tu post',
                                            notificationText: 'Ver mas...',
                                            notificationSound: 'default',
                                            userRefs: [
                                              columnUsersRecord.reference
                                            ],
                                            initialPageName: 'notificaciones',
                                            parameterData: {},
                                          );
                                        } else {
                                          logFirebaseEvent(
                                              'ToggleIcon_update_component_state');
                                          _model.like = false;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'ToggleIcon_backend_call');

                                          await containerUserPostsRecord
                                              .reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'likes': FieldValue.arrayRemove(
                                                    [currentUserReference]),
                                                'numeroLikes':
                                                    FieldValue.increment(-1),
                                              },
                                            ),
                                          });
                                          logFirebaseEvent(
                                              'ToggleIcon_backend_call');
                                          await _model.actividad!.reference
                                              .delete();
                                        }

                                        safeSetState(() {});
                                      },
                                      value: _model.like!,
                                      onIcon: Icon(
                                        FFIcons.kheart,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 24.0,
                                      ),
                                      offIcon: Icon(
                                        FFIcons.kheartLines,
                                        color: FlutterFlowTheme.of(context)
                                            .btnText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        FFIcons.kbubble2,
                                        color: FlutterFlowTheme.of(context)
                                            .btnText,
                                        size: 24.0,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'POST_DESING_COMP_bubble2_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.5,
                                                  child: VerComentariosWidget(
                                                    post: widget.post,
                                                    postCreador:
                                                        currentUserReference,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      FFIcons.kshare2,
                                      color:
                                          FlutterFlowTheme.of(context).btnText,
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: ToggleIcon(
                                      onPressed: () async {
                                        safeSetState(() => _model.favorite =
                                            !_model.favorite!);
                                        logFirebaseEvent(
                                            'POST_DESING_ToggleIcon_0y5iv8bg_ON_TOGGL');
                                        if (_model.favorite!) {
                                          logFirebaseEvent(
                                              'ToggleIcon_haptic_feedback');
                                          HapticFeedback.lightImpact();
                                          logFirebaseEvent(
                                              'ToggleIcon_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SizedBox(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.6,
                                                    child:
                                                        FavoritoAColeccionWidget(
                                                      post:
                                                          containerUserPostsRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        } else {
                                          logFirebaseEvent(
                                              'ToggleIcon_haptic_feedback');
                                          HapticFeedback.lightImpact();
                                          logFirebaseEvent(
                                              'ToggleIcon_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SizedBox(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.6,
                                                    child:
                                                        FavoritoAColeccionWidget(
                                                      post:
                                                          containerUserPostsRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        }
                                      },
                                      value: _model.favorite!,
                                      onIcon: Icon(
                                        FFIcons.kframe168,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      offIcon: Icon(
                                        FFIcons.kstarLines,
                                        color: FlutterFlowTheme.of(context)
                                            .btnText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      FFIcons.kcompass,
                                      color:
                                          FlutterFlowTheme.of(context).btnText,
                                      size: 24.0,
                                    ),
                                    showLoadingIndicator: true,
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'POST_DESING_COMP_compass_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context.pushNamed(
                                        'mapa_ir_lugar',
                                        queryParameters: {
                                          'userPost': serializeParam(
                                            containerUserPostsRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: Text(
                          widget.post!.numeroLikes.toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'e98co92y' /* likes */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 4.0, 0.0),
                        child: Text(
                          widget.post!.numComments.toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'eh435xm4' /* Comentarios */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 4.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.post?.postTitle,
                              'titulo',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (functions
                          .lenghtCaracter(widget.post!.postDescription)! <=
                      40)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              valueOrDefault<String>(
                                widget.post?.postDescription,
                                'Descripcion',
                              ).maybeHandleOverflow(
                                maxChars: 40,
                                replacement: '…',
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (functions.lenghtCaracter(widget.post!.postDescription)! >
                      40)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Builder(builder: (_) {
                              if (!expandableListenerRegistered) {
                                expandableListenerRegistered = true;
                                _model.expandableExpandableController
                                    .addListener(
                                  () async {
                                    logFirebaseEvent(
                                        'POST_DESING_Expandable_gh0z14ey_ON_TOGGL');
                                    if (_model.expandableExpandableController
                                        .expanded) {
                                      logFirebaseEvent(
                                          'Expandable_update_component_state');
                                      _model.header = true;
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent(
                                          'Expandable_update_component_state');
                                      _model.header = false;
                                      safeSetState(() {});
                                    }
                                  },
                                );
                              }
                              return Container(
                                width: double.infinity,
                                color: const Color(0x00FFFFFF),
                                child: ExpandableNotifier(
                                  controller:
                                      _model.expandableExpandableController,
                                  child: ExpandablePanel(
                                    header: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 8.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              if (_model.header == false)
                                                Expanded(
                                                  child: Text(
                                                    widget
                                                        .post!.postDescription
                                                        .maybeHandleOverflow(
                                                      maxChars: 40,
                                                      replacement: '…',
                                                    ),
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          fontSize: 12.0,
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
                                              if (_model.header == true)
                                                FaIcon(
                                                  FontAwesomeIcons.angleUp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 20.0,
                                                ),
                                            ],
                                          ),
                                        ),
                                        if (_model.header == false)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 8.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'ifwt5nal' /* Mas */,
                                                    ),
                                                    textAlign: TextAlign.end,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w900,
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
                                          ),
                                      ],
                                    ),
                                    collapsed: Container(),
                                    expanded: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 8.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    widget
                                                        .post!.postDescription,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          fontSize: 12.0,
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
                                          ),
                                        ],
                                      ),
                                    ),
                                    theme: const ExpandableThemeData(
                                      tapHeaderToExpand: true,
                                      tapBodyToExpand: false,
                                      tapBodyToCollapse: false,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.top,
                                      hasIcon: false,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 30.0,
                            height: 30.0,
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: SizedBox(
                              width: 200.0,
                              child: TextFormField(
                                controller:
                                    _model.textFieldComentariosTextController,
                                focusNode: _model.textFieldComentariosFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textFieldComentariosTextController',
                                  const Duration(milliseconds: 0),
                                  () async {
                                    logFirebaseEvent(
                                        'POST_DESING_TextFieldComentarios_ON_TEXT');
                                    if (functions.returnSpace(_model
                                        .textFieldComentariosTextController
                                        .text)!) {
                                      logFirebaseEvent(
                                          'TextFieldComentarios_update_component_st');
                                      _model.botonSend = true;
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent(
                                          'TextFieldComentarios_update_component_st');
                                      _model.header = false;
                                      safeSetState(() {});
                                    }
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'wtkz9lj1' /* Añade un comentario... */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                maxLines: 8,
                                minLines: 1,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .textFieldComentariosTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        if (_model.botonSend == true)
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).primary,
                            icon: Icon(
                              Icons.send,
                              color: FlutterFlowTheme.of(context).fondoIcono,
                              size: 24.0,
                            ),
                            showLoadingIndicator: true,
                            onPressed: () async {
                              logFirebaseEvent(
                                  'POST_DESING_COMP_send_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_backend_call');

                              var postCommentRecordReference =
                                  PostCommentRecord.createDoc(
                                      widget.post!.reference);
                              await postCommentRecordReference
                                  .set(createPostCommentRecordData(
                                textComment: _model
                                    .textFieldComentariosTextController.text,
                                userCreator: currentUserReference,
                                post: widget.post?.reference,
                                dateCreation: getCurrentTimestamp,
                                lastEditTime: getCurrentTimestamp,
                              ));
                              _model.ultimoComentario =
                                  PostCommentRecord.getDocumentFromData(
                                      createPostCommentRecordData(
                                        textComment: _model
                                            .textFieldComentariosTextController
                                            .text,
                                        userCreator: currentUserReference,
                                        post: widget.post?.reference,
                                        dateCreation: getCurrentTimestamp,
                                        lastEditTime: getCurrentTimestamp,
                                      ),
                                      postCommentRecordReference);
                              logFirebaseEvent('IconButton_backend_call');

                              await widget.post!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'numComments': FieldValue.increment(1),
                                  },
                                ),
                              });
                              logFirebaseEvent('IconButton_backend_call');

                              var actividadRecordReference =
                                  ActividadRecord.collection.doc();
                              await actividadRecordReference.set({
                                ...createActividadRecordData(
                                  creadorActividad: currentUserReference,
                                  recibeActividad: widget.post?.postUser,
                                  sinLeer: true,
                                  meGusta: false,
                                  esComentario: true,
                                  esSeguir: false,
                                  nombreUsuarioCreador: currentUserDisplayName,
                                  nombreUsuarioReceptor:
                                      columnUsersRecord.displayName,
                                  fechaCreacion: getCurrentTimestamp,
                                  postRelacionado: widget.post?.reference,
                                  meGustaComentario: false,
                                  imagenUsuario: currentUserPhoto,
                                ),
                                ...mapToFirestore(
                                  {
                                    'imagenPostList':
                                        widget.post?.postPhotolist,
                                  },
                                ),
                              });
                              _model.nuevaActividad =
                                  ActividadRecord.getDocumentFromData({
                                ...createActividadRecordData(
                                  creadorActividad: currentUserReference,
                                  recibeActividad: widget.post?.postUser,
                                  sinLeer: true,
                                  meGusta: false,
                                  esComentario: true,
                                  esSeguir: false,
                                  nombreUsuarioCreador: currentUserDisplayName,
                                  nombreUsuarioReceptor:
                                      columnUsersRecord.displayName,
                                  fechaCreacion: getCurrentTimestamp,
                                  postRelacionado: widget.post?.reference,
                                  meGustaComentario: false,
                                  imagenUsuario: currentUserPhoto,
                                ),
                                ...mapToFirestore(
                                  {
                                    'imagenPostList':
                                        widget.post?.postPhotolist,
                                  },
                                ),
                              }, actividadRecordReference);
                              logFirebaseEvent(
                                  'IconButton_trigger_push_notification');
                              triggerPushNotification(
                                notificationTitle:
                                    '${valueOrDefault(currentUserDocument?.userName, '')} comento tu post',
                                notificationText: _model
                                    .textFieldComentariosTextController.text,
                                notificationSound: 'default',
                                userRefs: [columnUsersRecord.reference],
                                initialPageName: 'notificaciones',
                                parameterData: {},
                              );
                              logFirebaseEvent(
                                  'IconButton_clear_text_fields_pin_codes');
                              safeSetState(() {
                                _model.textFieldComentariosTextController
                                    ?.clear();
                              });

                              safeSetState(() {});
                            },
                          ).animateOnPageLoad(
                              animationsMap['iconButtonOnPageLoadAnimation']!),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 4.0, 0.0),
                          child: Text(
                            dateTimeFormat(
                              "relative",
                              widget.post!.timePosted!,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
