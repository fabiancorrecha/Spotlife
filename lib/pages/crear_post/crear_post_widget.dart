import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/walkthroughs/crear_post.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
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

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearPostModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'CrearPost'});
    _model.tituloColeccionTextController ??= TextEditingController();
    _model.tituloColeccionFocusNode ??= FocusNode();

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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
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
                                      logFirebaseEvent('Button_validate_form');
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.placePickerValue ==
                                          const FFPlace()) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: const Text('Recordatorio'),
                                                content: const Text(
                                                    'recuerda elegir una ubicacion'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        return;
                                      }
                                      if (widget.esImagen!) {
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
                                            postUser: currentUserReference,
                                            timePosted: getCurrentTimestamp,
                                            toFacebook: _model.switchValue1,
                                            toInstagram:
                                                _model.switchValue2,
                                            toTwitter: _model.switchValue3,
                                            placeInfo:
                                                createPlaceInfoStruct(
                                              name: _model
                                                  .placePickerValue.name,
                                              address: _model
                                                  .placePickerValue.address,
                                              city: _model
                                                  .placePickerValue.city,
                                              state: _model
                                                  .placePickerValue.state,
                                              country: _model
                                                  .placePickerValue.country,
                                              zipcode: _model
                                                  .placePickerValue.zipCode,
                                              latLng: _model
                                                  .placePickerValue.latLng,
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                            postDescription: '',
                                            esVideo: false,
                                            esPublico: _model.varPublico,
                                            esAmigos: _model.varAmigos,
                                            esPrivado: _model.varPrivado,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'collections': _model
                                                  .listaColeccionesSeleccionadas,
                                              'PostPhotolist':
                                                  _model.uploadedFileUrls1,
                                            },
                                          ),
                                        });
                                        _model.refPost = UserPostsRecord
                                            .getDocumentFromData({
                                          ...createUserPostsRecordData(
                                            postTitle: _model
                                                .tituloColeccionTextController
                                                .text,
                                            postUser: currentUserReference,
                                            timePosted: getCurrentTimestamp,
                                            toFacebook: _model.switchValue1,
                                            toInstagram:
                                                _model.switchValue2,
                                            toTwitter: _model.switchValue3,
                                            placeInfo:
                                                createPlaceInfoStruct(
                                              name: _model
                                                  .placePickerValue.name,
                                              address: _model
                                                  .placePickerValue.address,
                                              city: _model
                                                  .placePickerValue.city,
                                              state: _model
                                                  .placePickerValue.state,
                                              country: _model
                                                  .placePickerValue.country,
                                              zipcode: _model
                                                  .placePickerValue.zipCode,
                                              latLng: _model
                                                  .placePickerValue.latLng,
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                            postDescription: '',
                                            esVideo: false,
                                            esPublico: _model.varPublico,
                                            esAmigos: _model.varAmigos,
                                            esPrivado: _model.varPrivado,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'collections': _model
                                                  .listaColeccionesSeleccionadas,
                                              'PostPhotolist':
                                                  _model.uploadedFileUrls1,
                                            },
                                          ),
                                        }, userPostsRecordReference1);
                                        logFirebaseEvent(
                                            'Button_navigate_to');

                                        context.pushNamed('perfilPropio');
                                                                            } else {
                                        if (_model.uploadedFileUrl2 != '') {
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await UserPostsRecord.collection
                                              .doc()
                                              .set({
                                            ...createUserPostsRecordData(
                                              postTitle: _model
                                                  .tituloColeccionTextController
                                                  .text,
                                              postUser: currentUserReference,
                                              timePosted: getCurrentTimestamp,
                                              toFacebook: _model.switchValue1,
                                              toInstagram:
                                                  _model.switchValue2,
                                              toTwitter: _model.switchValue3,
                                              placeInfo:
                                                  createPlaceInfoStruct(
                                                name: _model
                                                    .placePickerValue.name,
                                                address: _model
                                                    .placePickerValue.address,
                                                city: _model
                                                    .placePickerValue.city,
                                                state: _model
                                                    .placePickerValue.state,
                                                country: _model
                                                    .placePickerValue.country,
                                                zipcode: _model
                                                    .placePickerValue.zipCode,
                                                latLng: _model
                                                    .placePickerValue.latLng,
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                              postDescription: '',
                                              video: _model.uploadedFileUrl2,
                                              esVideo: true,
                                              esPublico: _model.varPublico,
                                              esAmigos: _model.varAmigos,
                                              esPrivado: _model.varPrivado,
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
                                    
                                      setState(() {});
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
                                    setState(
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
                                      setState(() {
                                        _model.uploadedLocalFiles1 =
                                            selectedUploadedFiles;
                                        _model.uploadedFileUrls1 = downloadUrls;
                                      });
                                    } else {
                                      setState(() {});
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
                                    setState(
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
                                      setState(() {
                                        _model.uploadedLocalFile2 =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl2 =
                                            downloadUrls.first;
                                      });
                                    } else {
                                      setState(() {});
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
                                      16.0, 0.0, 16.0, 16.0),
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
                                                'kp6cc43j' /* Escribe la descripción... */,
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 24.0),
                                      child: FlutterFlowPlacePicker(
                                        iOSGoogleMapsApiKey:
                                            'AIzaSyCh-IGEBvdvzziaujkF-QlXNHvyMlAom-U',
                                        androidGoogleMapsApiKey:
                                            'AIzaSyCsdwY0ZN0_MRcjhomnqjtjb8Co6QYPY8M',
                                        webGoogleMapsApiKey:
                                            'AIzaSyDO0cp7qjh7_-POR7Azm1RGktAjU4Wa0uo',
                                        onSelect: (place) async {
                                          setState(() =>
                                              _model.placePickerValue = place);
                                        },
                                        defaultText:
                                            FFLocalizations.of(context).getText(
                                          's6k6yknv' /* Etiqueta la ubicación */,
                                        ),
                                        icon: const Icon(
                                          FFIcons.kpinFilled,
                                          color: Colors.white,
                                          size: 16.0,
                                        ),
                                        buttonOptions: FFButtonOptions(
                                          width: 200.0,
                                          height: 40.0,
                                          color: FlutterFlowTheme.of(context)
                                              .fondoIcono,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
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
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ).addWalkthrough(
                                        placePickerQ7demwmw,
                                        _model.crearPostController,
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'CREAR_POST_PAGE_Row_q1mp5e13_ON_TAP');
                                            if (!_model.varPublico) {
                                              logFirebaseEvent(
                                                  'Row_update_page_state');
                                              _model.varPublico = true;
                                              _model.varAmigos = false;
                                              _model.varPrivado = false;
                                              setState(() {});
                                            }
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Stack(
                                                  children: [
                                                    if (!_model.varPublico)
                                                      Icon(
                                                        Icons
                                                            .check_box_outline_blank,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    if (_model.varPublico)
                                                      Icon(
                                                        Icons.check_box_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    'sdnl893t' /* Público */,
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
                                                setState(() {});
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'CREAR_POST_PAGE_Row_71ejdfxd_ON_TAP');
                                            if (!_model.varPrivado) {
                                              logFirebaseEvent(
                                                  'Row_update_page_state');
                                              _model.varPublico = false;
                                              _model.varAmigos = false;
                                              _model.varPrivado = true;
                                              setState(() {});
                                            }
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Stack(
                                                  children: [
                                                    if (!_model.varPrivado)
                                                      Icon(
                                                        Icons
                                                            .check_box_outline_blank,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    if (_model.varPrivado)
                                                      Icon(
                                                        Icons.check_box_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    'a3mt3ft3' /* Privado */,
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
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'CREAR_POST_PAGE_Row_uqbh545x_ON_TAP');
                                              if (_model
                                                  .listaColeccionesSeleccionadas
                                                  .contains(
                                                      listViewCollectionsRecord
                                                          .reference)) {
                                                logFirebaseEvent(
                                                    'Row_update_page_state');
                                                _model
                                                    .removeFromListaColeccionesSeleccionadas(
                                                        listViewCollectionsRecord
                                                            .reference);
                                                setState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'Row_update_page_state');
                                                _model
                                                    .addToListaColeccionesSeleccionadas(
                                                        listViewCollectionsRecord
                                                            .reference);
                                                setState(() {});
                                              }
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Stack(
                                                    children: [
                                                      if (!_model
                                                          .listaColeccionesSeleccionadas
                                                          .contains(
                                                              listViewCollectionsRecord
                                                                  .reference))
                                                        Icon(
                                                          Icons
                                                              .check_box_outline_blank,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                      if (_model
                                                          .listaColeccionesSeleccionadas
                                                          .contains(
                                                              listViewCollectionsRecord
                                                                  .reference))
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
                                                Text(
                                                  listViewCollectionsRecord
                                                      .nombre,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .userSecret,
                                                      color: Color(0x81FFFFFF),
                                                      size: 18.0,
                                                    ),
                                                  ),
                                              ],
                                            ),
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
                                              setState(() => _model
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
                                              setState(() => _model
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
                                              setState(() => _model
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
