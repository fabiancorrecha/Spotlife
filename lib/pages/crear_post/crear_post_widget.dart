import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/walkthroughs/crear_post.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'crear_post_model.dart';
export 'crear_post_model.dart';

class CrearPostWidget extends StatefulWidget {
  const CrearPostWidget({
    super.key,
    this.esImagen,
  });

  final bool? esImagen;

  @override
  State<CrearPostWidget> createState() => _CrearPostWidgetState();
}

class _CrearPostWidgetState extends State<CrearPostWidget>
    with TickerProviderStateMixin {
  late CrearPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearPostModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'CrearPost'});
    _model.tituloColeccionTextController ??= TextEditingController();
    _model.tituloColeccionFocusNode ??= FocusNode();

    _model.descripcionColeccionTextController ??= TextEditingController();
    _model.descripcionColeccionFocusNode ??= FocusNode();

    _model.editarUbicacionTextController ??= TextEditingController();

    _model.switchValue1 = false;
    _model.switchValue2 = false;
    _model.switchValue3 = false;
    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 32.0),
          child: Stack(
            children: [
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: const BoxDecoration(),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'kt6uqv7e' /* Nuevo spot */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CREAR_POST_PAGE_Card_0r0m8dy6_ON_TAP');
                                      logFirebaseEvent('Card_navigate_back');
                                      context.pop();
                                    },
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .fondoIcono,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(80.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.arrow_back_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .icono,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CREAR_POST_PAGE_PUBLICAR_BTN_ON_TAP');
                                      var shouldSetState = false;
                                      logFirebaseEvent('Button_validate_form');
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (widget.esImagen!) {
                                        if ((_model.checkboxPublicoValue1 ==
                                                true) ||
                                            (_model.checkboxPrivadoValue ==
                                                true)) {
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          var userPostsRecordReference1 =
                                              UserPostsRecord.collection
                                                  .doc();
                                          await userPostsRecordReference1
                                              .set({
                                            ...createUserPostsRecordData(
                                              postTitle: _model
                                                  .tituloColeccionTextController
                                                  .text,
                                              postUser:
                                                  currentUserReference,
                                              timePosted:
                                                  getCurrentTimestamp,
                                              toFacebook:
                                                  _model.switchValue1,
                                              toInstagram:
                                                  _model.switchValue2,
                                              toTwitter:
                                                  _model.switchValue3,
                                              placeInfo:
                                                  updatePlaceInfoStruct(
                                                PlaceInfoStruct(
                                                  address: FFAppState()
                                                      .ubication
                                                      .address,
                                                  latLng: FFAppState()
                                                      .ubication
                                                      .latLng,
                                                ),
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                              postDescription: _model
                                                  .descripcionColeccionTextController
                                                  .text,
                                              esVideo: false,
                                              esPublico: _model
                                                  .checkboxPublicoValue1,
                                              esAmigos: _model.varAmigos,
                                              esPrivado: _model
                                                  .checkboxPrivadoValue,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'collections': _model
                                                    .listaColeccionesSeleccionadas,
                                                'PostPhotolist': _model
                                                    .uploadedFileUrls1,
                                              },
                                            ),
                                          });
                                          _model.refPost = UserPostsRecord
                                              .getDocumentFromData({
                                            ...createUserPostsRecordData(
                                              postTitle: _model
                                                  .tituloColeccionTextController
                                                  .text,
                                              postUser:
                                                  currentUserReference,
                                              timePosted:
                                                  getCurrentTimestamp,
                                              toFacebook:
                                                  _model.switchValue1,
                                              toInstagram:
                                                  _model.switchValue2,
                                              toTwitter:
                                                  _model.switchValue3,
                                              placeInfo:
                                                  updatePlaceInfoStruct(
                                                PlaceInfoStruct(
                                                  address: FFAppState()
                                                      .ubication
                                                      .address,
                                                  latLng: FFAppState()
                                                      .ubication
                                                      .latLng,
                                                ),
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                              postDescription: _model
                                                  .descripcionColeccionTextController
                                                  .text,
                                              esVideo: false,
                                              esPublico: _model
                                                  .checkboxPublicoValue1,
                                              esAmigos: _model.varAmigos,
                                              esPrivado: _model
                                                  .checkboxPrivadoValue,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'collections': _model
                                                    .listaColeccionesSeleccionadas,
                                                'PostPhotolist': _model
                                                    .uploadedFileUrls1,
                                              },
                                            ),
                                          }, userPostsRecordReference1);
                                          shouldSetState = true;
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed('perfilPropio');

                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                          return;
                                        } else {
                                          logFirebaseEvent(
                                              'Button_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Recuerda seleccionar la privacidad de tu post',
                                                style: TextStyle(
                                                  color:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              ),
                                              duration: const Duration(
                                                  milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                            ),
                                          );
                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                          return;
                                        }
                                                                            } else {
                                        if (_model.uploadedFileUrl2 != '') {
                                          if ((_model.checkboxPublicoValue1 ==
                                                  true) ||
                                              (_model.checkboxPrivadoValue ==
                                                  true)) {
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await UserPostsRecord.collection
                                                .doc()
                                                .set({
                                              ...createUserPostsRecordData(
                                                postTitle: _model
                                                    .tituloColeccionTextController
                                                    .text,
                                                postUser:
                                                    currentUserReference,
                                                timePosted:
                                                    getCurrentTimestamp,
                                                toFacebook:
                                                    _model.switchValue1,
                                                toInstagram:
                                                    _model.switchValue2,
                                                toTwitter:
                                                    _model.switchValue3,
                                                placeInfo:
                                                    updatePlaceInfoStruct(
                                                  PlaceInfoStruct(
                                                    address: FFAppState()
                                                        .ubication
                                                        .address,
                                                    latLng: FFAppState()
                                                        .ubication
                                                        .latLng,
                                                  ),
                                                  clearUnsetFields: false,
                                                  create: true,
                                                ),
                                                postDescription: _model
                                                    .descripcionColeccionTextController
                                                    .text,
                                                video:
                                                    _model.uploadedFileUrl2,
                                                esVideo: true,
                                                esPublico: _model
                                                    .checkboxPublicoValue1,
                                                esAmigos: _model.varAmigos,
                                                esPrivado: _model
                                                    .checkboxPrivadoValue,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'collections': _model
                                                      .listaColeccionesSeleccionadas,
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.pushNamed('perfilPropio');

                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                            return;
                                          } else {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Recuerda seleccionar la privacidad de tu post',
                                                  style: TextStyle(
                                                    color:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                              ),
                                            );
                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                            return;
                                          }
                                        } else {
                                          logFirebaseEvent(
                                              'Button_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Antes sube un videos',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration: const Duration(
                                                  milliseconds: 2000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                          );
                                        }
                                      }
                                    
                                      if (shouldSetState) safeSetState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'iegyvusu' /* Publicar */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 100.0,
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      elevation: 0.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ).addWalkthrough(
                                    buttonHxyj0gn7,
                                    _model.crearPostController,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (widget.esImagen ?? true)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CREAR_POST_PAGE_StackImagen_ON_TAP');
                                  logFirebaseEvent(
                                      'StackImagen_upload_media_to_firebase');
                                  final selectedMedia = await selectMedia(
                                    imageQuality: 50,
                                    mediaSource: MediaSource.photoGallery,
                                    multiImage: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(
                                        () => _model.isDataUploading1 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      _model.isDataUploading1 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFiles1 =
                                            selectedUploadedFiles;
                                        _model.uploadedFileUrls1 = downloadUrls;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }
                                },
                                child: SizedBox(
                                  width: 216.0,
                                  height: 300.0,
                                  child: Stack(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      if (!(_model
                                          .uploadedFileUrls1.isNotEmpty))
                                        Container(
                                          width: 216.0,
                                          height: 300.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .icono,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.upload_outlined,
                                            color: Color(0xFFD8D8D8),
                                            size: 70.0,
                                          ),
                                        ),
                                      if (_model.uploadedFileUrls1.isNotEmpty)
                                        Container(
                                          width: 216.0,
                                          height: 300.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 0.0,
                                            ),
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final imagenCarrusel = _model
                                                  .uploadedFileUrls1
                                                  .map((e) => e)
                                                  .toList();

                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      imagenCarrusel.length,
                                                      (imagenCarruselIndex) {
                                                    final imagenCarruselItem =
                                                        imagenCarrusel[
                                                            imagenCarruselIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl:
                                                              imagenCarruselItem,
                                                          width: 190.0,
                                                          height: 297.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            if (!widget.esImagen!)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CREAR_POST_PAGE_StackVideo_ON_TAP');
                                  logFirebaseEvent(
                                      'StackVideo_upload_media_to_firebase');
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: false,
                                    allowVideo: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(
                                        () => _model.isDataUploading2 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      _model.isDataUploading2 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile2 =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl2 =
                                            downloadUrls.first;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }
                                },
                                child: SizedBox(
                                  width: 216.0,
                                  height: 300.0,
                                  child: Stack(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Container(
                                        width: 216.0,
                                        height: 300.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .icono,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.upload_outlined,
                                          color: Color(0xFFD8D8D8),
                                          size: 70.0,
                                        ),
                                      ),
                                      if (_model.isDataUploading2)
                                        Container(
                                          width: 216.0,
                                          height: 300.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .icono,
                                              width: 2.0,
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: const FaIcon(
                                            FontAwesomeIcons.circleNotch,
                                            color: Color(0xFFD8D8D8),
                                            size: 60.0,
                                          ).animateOnPageLoad(animationsMap[
                                              'iconOnPageLoadAnimation']!),
                                        ),
                                      if (_model.uploadedFileUrl2 != '')
                                        Container(
                                          height: 300.0,
                                          constraints: const BoxConstraints(
                                            minWidth: 216.0,
                                            maxWidth: 218.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 0.0,
                                            ),
                                          ),
                                          child: FlutterFlowVideoPlayer(
                                            path: _model.uploadedFileUrl2,
                                            videoType: VideoType.network,
                                            width: 216.0,
                                            height: 300.0,
                                            aspectRatio: 0.72,
                                            autoPlay: false,
                                            looping: true,
                                            showControls: true,
                                            allowFullScreen: true,
                                            allowPlaybackSpeedMenu: false,
                                            lazyLoad: true,
                                          ).addWalkthrough(
                                            videoPlayerLhmi3cxm,
                                            _model.crearPostController,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 26.0, 0.0, 0.0),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Container(
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
                                              currentUserPhoto,
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 9.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .tituloColeccionTextController,
                                            focusNode:
                                                _model.tituloColeccionFocusNode,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'kp6cc43j' /* Escriba el titulo de la public... */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                            maxLines: 3,
                                            minLines: 1,
                                            validator: _model
                                                .tituloColeccionTextControllerValidator
                                                .asValidator(context),
                                          ).addWalkthrough(
                                            textFieldWxqpt3ez,
                                            _model.crearPostController,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            48.0, 0.0, 9.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .descripcionColeccionTextController,
                                          focusNode: _model
                                              .descripcionColeccionFocusNode,
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'ovd4wkrt' /* Info... */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            enabledBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            errorBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          maxLines: 3,
                                          minLines: 1,
                                          validator: _model
                                              .descripcionColeccionTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      FFAppState().ubication.address,
                                      style: FlutterFlowTheme.of(context)
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
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: const Color(0x00F4F176),
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).fondoIcono,
                                    icon: Icon(
                                      Icons.refresh_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    showLoadingIndicator: true,
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CREAR_POST_PAGE_refresh_sharp_ICN_ON_TAP');
                                      currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                                  const LatLng(0.0, 0.0));
                                      logFirebaseEvent(
                                          'IconButton_backend_call');
                                      _model.apiResulth5l =
                                          await GoogleMapsLocationConverterCall
                                              .call(
                                        lat: functions
                                            .converLatLongToDouble(
                                                currentUserLocationValue)
                                            .first,
                                        lng: functions
                                            .converLatLongToDouble(
                                                currentUserLocationValue)
                                            .last,
                                      );

                                      if ((_model.apiResulth5l?.succeeded ??
                                          true)) {
                                        logFirebaseEvent(
                                            'IconButton_update_app_state');
                                        FFAppState().ubication =
                                            PlaceInfoStruct(
                                          latLng: currentUserLocationValue,
                                          address:
                                              GoogleMapsLocationConverterCall
                                                  .longAddress(
                                            (_model.apiResulth5l?.jsonBody ??
                                                ''),
                                          ),
                                        );
                                        FFAppState().update(() {});
                                      } else {
                                        logFirebaseEvent(
                                            'IconButton_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Error no se pudo registrar tu direccion actual',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                          ),
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'w9ro86pp' /* ¿Deseas editar tu ubicacion ac... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
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
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: const Color(0x00F4F176),
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).fondoIcono,
                                    icon: Icon(
                                      Icons.edit,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    showLoadingIndicator: true,
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CREAR_POST_PAGE_edit_ICN_ON_TAP');
                                      if (_model.editarDireccion!) {
                                        logFirebaseEvent(
                                            'IconButton_update_page_state');
                                        _model.editarDireccion = false;
                                        safeSetState(() {});
                                      } else {
                                        logFirebaseEvent(
                                            'IconButton_update_page_state');
                                        _model.editarDireccion = true;
                                        safeSetState(() {});
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            if (_model.editarDireccion == true)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 10.0, 16.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 9.0, 0.0),
                                        child: Autocomplete<String>(
                                          initialValue: const TextEditingValue(),
                                          optionsBuilder: (textEditingValue) {
                                            if (textEditingValue.text == '') {
                                              return const Iterable<
                                                  String>.empty();
                                            }
                                            return GooglePlaceCall.direccion(
                                              (_model.apiResultpbi?.jsonBody ??
                                                  ''),
                                            )!
                                                .where((option) {
                                              final lowercaseOption =
                                                  option.toLowerCase();
                                              return lowercaseOption.contains(
                                                  textEditingValue.text
                                                      .toLowerCase());
                                            });
                                          },
                                          optionsViewBuilder:
                                              (context, onSelected, options) {
                                            return AutocompleteOptionsList(
                                              textFieldKey:
                                                  _model.editarUbicacionKey,
                                              textController: _model
                                                  .editarUbicacionTextController!,
                                              options: options.toList(),
                                              onSelected: onSelected,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              textHighlightStyle: const TextStyle(),
                                              elevation: 4.0,
                                              optionBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              optionHighlightColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              maxHeight: 200.0,
                                            );
                                          },
                                          onSelected: (String selection) {
                                            safeSetState(() => _model
                                                    .editarUbicacionSelectedOption =
                                                selection);
                                            FocusScope.of(context).unfocus();
                                          },
                                          fieldViewBuilder: (
                                            context,
                                            textEditingController,
                                            focusNode,
                                            onEditingComplete,
                                          ) {
                                            _model.editarUbicacionFocusNode =
                                                focusNode;

                                            _model.editarUbicacionTextController =
                                                textEditingController;
                                            return TextFormField(
                                              key: _model.editarUbicacionKey,
                                              controller: textEditingController,
                                              focusNode: focusNode,
                                              onEditingComplete:
                                                  onEditingComplete,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.editarUbicacionTextController',
                                                const Duration(milliseconds: 0),
                                                () async {
                                                  logFirebaseEvent(
                                                      'CREAR_POST_editarUbicacion_ON_TEXTFIELD_');
                                                  logFirebaseEvent(
                                                      'editarUbicacion_backend_call');
                                                  _model.apiResultpbi =
                                                      await GooglePlaceCall
                                                          .call(
                                                    yourQuery: _model
                                                        .editarUbicacionTextController
                                                        .text,
                                                  );

                                                  if ((_model.apiResultpbi
                                                          ?.succeeded ??
                                                      true)) {
                                                    logFirebaseEvent(
                                                        'editarUbicacion_update_app_state');
                                                    FFAppState()
                                                        .updateUbicationStruct(
                                                      (e) => e
                                                        ..address =
                                                            GooglePlaceCall
                                                                .direccion(
                                                          (_model.apiResultpbi
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.first
                                                        ..latLng = functions
                                                            .converDoubleToLatLong(
                                                                GooglePlaceCall
                                                                    .latitud(
                                                                  (_model.apiResultpbi
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                GooglePlaceCall
                                                                    .longitud(
                                                                  (_model.apiResultpbi
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )),
                                                    );
                                                    FFAppState().update(() {});
                                                  } else {
                                                    logFirebaseEvent(
                                                        'editarUbicacion_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Error al encontrar tu ubicacion!',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                          ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                      ),
                                                    );
                                                  }

                                                  safeSetState(() {});
                                                },
                                              ),
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.sentences,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'a62jq0dn' /* Editar nueva ubicacion */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          28.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          28.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          28.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          28.0),
                                                ),
                                                filled: true,
                                                suffixIcon: _model
                                                        .editarUbicacionTextController!
                                                        .text
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          _model
                                                              .editarUbicacionTextController
                                                              ?.clear();
                                                          logFirebaseEvent(
                                                              'CREAR_POST_editarUbicacion_ON_TEXTFIELD_');
                                                          logFirebaseEvent(
                                                              'editarUbicacion_backend_call');
                                                          _model.apiResultpbi =
                                                              await GooglePlaceCall
                                                                  .call(
                                                            yourQuery: _model
                                                                .editarUbicacionTextController
                                                                .text,
                                                          );

                                                          if ((_model
                                                                  .apiResultpbi
                                                                  ?.succeeded ??
                                                              true)) {
                                                            logFirebaseEvent(
                                                                'editarUbicacion_update_app_state');
                                                            FFAppState()
                                                                .updateUbicationStruct(
                                                              (e) => e
                                                                ..address =
                                                                    GooglePlaceCall
                                                                        .direccion(
                                                                  (_model.apiResultpbi
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.first
                                                                ..latLng = functions
                                                                    .converDoubleToLatLong(
                                                                        GooglePlaceCall
                                                                            .latitud(
                                                                          (_model.apiResultpbi?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        GooglePlaceCall
                                                                            .longitud(
                                                                          (_model.apiResultpbi?.jsonBody ??
                                                                              ''),
                                                                        )),
                                                            );
                                                            FFAppState()
                                                                .update(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'editarUbicacion_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Error al encontrar tu ubicacion!',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                              ),
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                          safeSetState(() {});
                                                        },
                                                        child: const Icon(
                                                          Icons.clear,
                                                          color:
                                                              Color(0xFF757575),
                                                          size: 22.0,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              maxLines: 3,
                                              minLines: 1,
                                              validator: _model
                                                  .editarUbicacionTextControllerValidator
                                                  .asValidator(context),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              const Divider(
                                height: 32.0,
                                thickness: 1.0,
                                indent: 16.0,
                                endIndent: 16.0,
                                color: Color(0x27FAF7FA),
                              ),
                            Container(
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'v42yu7m9' /* Privacidad del spot */,
                                                  ),
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ).addWalkthrough(
                                                  textA4wqjt8j,
                                                  _model.crearPostController,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkboxPublicoValue1 ??=
                                                    false,
                                                onChanged: (newValue) async {
                                                  safeSetState(() => _model
                                                          .checkboxPublicoValue1 =
                                                      newValue!);
                                                  if (newValue!) {
                                                    logFirebaseEvent(
                                                        'CREAR_POST_CheckboxPublico_ON_TOGGLE_ON');
                                                    logFirebaseEvent(
                                                        'CheckboxPublico_custom_action');
                                                    await actions
                                                        .hideSoftKeyboard();
                                                    logFirebaseEvent(
                                                        'CheckboxPublico_set_form_field');
                                                    safeSetState(() {
                                                      _model.checkboxPublicoValue1 =
                                                          true;
                                                    });
                                                    logFirebaseEvent(
                                                        'CheckboxPublico_set_form_field');
                                                    safeSetState(() {
                                                      _model.checkboxPrivadoValue =
                                                          false;
                                                    });
                                                  }
                                                },
                                                side: BorderSide(
                                                  width: 2,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'sdnl893t' /* Público */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
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

                                        // Se ocultó el estado de privacidad "Amigos" por solicitud de Nahuel. Dijo que ahora no es necesario
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'CREAR_POST_PAGE_Row_tyclf6fz_ON_TAP');
                                              if (!_model.varAmigos) {
                                                logFirebaseEvent(
                                                    'Row_update_page_state');
                                                _model.varPublico = true;
                                                _model.varAmigos = true;
                                                _model.varPrivado = false;
                                                safeSetState(() {});
                                              }
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Stack(
                                                    children: [
                                                      if (!_model.varAmigos)
                                                        Icon(
                                                          Icons
                                                              .check_box_outline_blank,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                      if (_model.varAmigos)
                                                        Icon(
                                                          Icons
                                                              .check_box_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'latkqwqu' /* Amigos */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkboxPrivadoValue ??=
                                                    false,
                                                onChanged: (newValue) async {
                                                  safeSetState(() => _model
                                                          .checkboxPrivadoValue =
                                                      newValue!);
                                                  if (newValue!) {
                                                    logFirebaseEvent(
                                                        'CREAR_POST_CheckboxPrivado_ON_TOGGLE_ON');
                                                    logFirebaseEvent(
                                                        'CheckboxPrivado_custom_action');
                                                    await actions
                                                        .hideSoftKeyboard();
                                                    logFirebaseEvent(
                                                        'CheckboxPrivado_set_form_field');
                                                    safeSetState(() {
                                                      _model.checkboxPublicoValue1 =
                                                          false;
                                                    });
                                                    logFirebaseEvent(
                                                        'CheckboxPrivado_set_form_field');
                                                    safeSetState(() {
                                                      _model.checkboxPrivadoValue =
                                                          true;
                                                    });
                                                  }
                                                },
                                                side: BorderSide(
                                                  width: 2,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'a3mt3ft3' /* Privado */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 32.0,
                              thickness: 1.0,
                              indent: 16.0,
                              endIndent: 16.0,
                              color: Color(0x27FAF7FA),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '38yeg5jl' /* Mis colecciones en Bio */,
                                            ),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
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

                                  // Enviaremos un valor de 0 para una colección propia
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CREAR_POST_PAGE_Row_1b6e79tc_ON_TAP');
                                        logFirebaseEvent('Row_navigate_to');

                                        context.pushNamed(
                                          'CrearColeccionSinPost',
                                          queryParameters: {
                                            'esColeccionFavorito':
                                                serializeParam(
                                              false,
                                              ParamType.bool,
                                            ),
                                            'image': serializeParam(
                                              _model.uploadedFileUrls1,
                                              ParamType.String,
                                              isList: true,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.add_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 32.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'kpult3tq' /* Crear una colección en Bio */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ).addWalkthrough(
                                      row1b6e79tc,
                                      _model.crearPostController,
                                    ),
                                  ),
                                  FutureBuilder<List<CollectionsRecord>>(
                                    future: queryCollectionsRecordOnce(
                                      queryBuilder: (collectionsRecord) =>
                                          collectionsRecord
                                              .where(
                                                'createdBy',
                                                isEqualTo: currentUserReference,
                                              )
                                              .where(
                                                'coleccionFavoritos',
                                                isEqualTo: false,
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
                                        itemCount: listViewCollectionsRecordList
                                            .length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewCollectionsRecord =
                                              listViewCollectionsRecordList[
                                                  listViewIndex];
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                              .checkboxPublicoValueMap2[
                                                          listViewCollectionsRecord] ??=
                                                      _model
                                                          .listaColeccionesSeleccionadas
                                                          .contains(
                                                              listViewCollectionsRecord
                                                                  .reference),
                                                  onChanged: (newValue) async {
                                                    safeSetState(() => _model
                                                                .checkboxPublicoValueMap2[
                                                            listViewCollectionsRecord] =
                                                        newValue!);
                                                    if (newValue!) {
                                                      logFirebaseEvent(
                                                          'CREAR_POST_CheckboxPublico_ON_TOGGLE_ON');
                                                      logFirebaseEvent(
                                                          'CheckboxPublico_custom_action');
                                                      await actions
                                                          .hideSoftKeyboard();
                                                      if (_model
                                                          .listaColeccionesSeleccionadas
                                                          .contains(
                                                              listViewCollectionsRecord
                                                                  .reference)) {
                                                        logFirebaseEvent(
                                                            'CheckboxPublico_update_page_state');
                                                        _model.removeFromListaColeccionesSeleccionadas(
                                                            listViewCollectionsRecord
                                                                .reference);
                                                        safeSetState(() {});
                                                      } else {
                                                        logFirebaseEvent(
                                                            'CheckboxPublico_update_page_state');
                                                        _model.addToListaColeccionesSeleccionadas(
                                                            listViewCollectionsRecord
                                                                .reference);
                                                        safeSetState(() {});
                                                      }
                                                    }
                                                  },
                                                  side: BorderSide(
                                                    width: 2,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                              ),
                                              Text(
                                                listViewCollectionsRecord
                                                    .nombre,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              if (listViewCollectionsRecord
                                                  .coleccionPublica)
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .globeEurope,
                                                    color: Color(0x81FFFFFF),
                                                    size: 18.0,
                                                  ),
                                                ),
                                              if (listViewCollectionsRecord
                                                  .coleccionAmigos)
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .userFriends,
                                                    color: Color(0x81FFFFFF),
                                                    size: 18.0,
                                                  ),
                                                ),
                                              if (listViewCollectionsRecord
                                                  .coleccionPrivada)
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.userSecret,
                                                    color: Color(0x81FFFFFF),
                                                    size: 18.0,
                                                  ),
                                                ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 32.0,
                              thickness: 1.0,
                              indent: 16.0,
                              endIndent: 16.0,
                              color: Color(0x27FAF7FA),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 32.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'd5xk8jtj' /* Facebook */,
                                              ),
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                          Switch(
                                            value: _model.switchValue1!,
                                            onChanged: (newValue) async {
                                              safeSetState(() => _model
                                                  .switchValue1 = newValue);
                                            },
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .fondoIcono,
                                            inactiveThumbColor:
                                                FlutterFlowTheme.of(context)
                                                    .icono,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      height: 32.0,
                                      thickness: 1.0,
                                      color: Color(0x27FAF7FA),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'rxehug9g' /* Instagram */,
                                              ),
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                          Switch(
                                            value: _model.switchValue2!,
                                            onChanged: (newValue) async {
                                              safeSetState(() => _model
                                                  .switchValue2 = newValue);
                                            },
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .fondoIcono,
                                            inactiveThumbColor:
                                                FlutterFlowTheme.of(context)
                                                    .icono,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      height: 32.0,
                                      thickness: 1.0,
                                      color: Color(0x27FAF7FA),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '6z087o5l' /* Twitter */,
                                              ),
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                          Switch(
                                            value: _model.switchValue3!,
                                            onChanged: (newValue) async {
                                              safeSetState(() => _model
                                                  .switchValue3 = newValue);
                                            },
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .fondoIcono,
                                            inactiveThumbColor:
                                                FlutterFlowTheme.of(context)
                                                    .icono,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      height: 32.0,
                                      thickness: 1.0,
                                      color: Color(0x27FAF7FA),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -0.85),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
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
                          logFirebaseEvent('CREAR_POST_PAGE_help_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_start_walkthrough');
                          safeSetState(() => _model.crearPostController =
                              createPageWalkthrough(context));
                          _model.crearPostController?.show(context: context);
                        },
                      ),
                    ],
                  ),
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
          safeSetState(() => _model.crearPostController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
