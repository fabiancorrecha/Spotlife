import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/walkthroughs/crear_coleccion.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
// ignore: unnecessary_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'crear_coleccion_con_post_model.dart';
export 'crear_coleccion_con_post_model.dart';

class CrearColeccionConPostWidget extends StatefulWidget {
  const CrearColeccionConPostWidget({
    super.key,
    this.post,
    bool? esColeccionFavorito,
    this.imagenes,
  }) : this.esColeccionFavorito = esColeccionFavorito ?? false;

  final DocumentReference? post;
  final bool esColeccionFavorito;
  final List<String>? imagenes;

  @override
  State<CrearColeccionConPostWidget> createState() =>
      _CrearColeccionConPostWidgetState();
}

class _CrearColeccionConPostWidgetState
    extends State<CrearColeccionConPostWidget> with TickerProviderStateMixin {
  late CrearColeccionConPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearColeccionConPostModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CrearColeccionConPost'});
    _model.tituloColeccionTextController ??= TextEditingController();
    _model.tituloColeccionFocusNode ??= FocusNode();

    _model.descripcionColeccionTextController ??= TextEditingController();
    _model.descripcionColeccionFocusNode ??= FocusNode();

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
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
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
    return StreamBuilder<UserPostsRecord>(
      stream: UserPostsRecord.getDocument(widget.post!),
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
        final crearColeccionConPostUserPostsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 32.0, 16.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CREAR_COLECCION_CON_POST_Card_k8x162zn_O');
                            if (_model.uploadedFileUrl != null &&
                                _model.uploadedFileUrl != '') {
                              logFirebaseEvent('Card_delete_data');
                              await FirebaseStorage.instance
                                  .refFromURL(_model.uploadedFileUrl)
                                  .delete();
                            }
                            logFirebaseEvent('Card_navigate_back');
                            context.pop();
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).fondoIcono,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).icono,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            valueOrDefault<String>(
                              widget.esColeccionFavorito
                                  ? 'Crear colección de favoritos'
                                  : 'Crear colección en Bio',
                              'Crear colección en Bio',
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displaySmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displaySmallFamily),
                                ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Color(0x00F4F176),
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: Color(0x00EEEEEE),
                          icon: Icon(
                            Icons.help,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 40.0,
                              height: 40.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                valueOrDefault<String>(
                                  currentUserPhoto,
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: TextFormField(
                                controller:
                                    _model.tituloColeccionTextController,
                                focusNode: _model.tituloColeccionFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.tituloColeccionTextController',
                                  Duration(milliseconds: 300),
                                  () => setState(() {}),
                                ),
                                autofocus: false,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFLocalizations.of(context).getText(
                                    'cmu6wjnm' /* Título de la colección... */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
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
                                validator: _model
                                    .tituloColeccionTextControllerValidator
                                    .asValidator(context),
                              ).addWalkthrough(
                                textFieldIhvh44c9,
                                _model.crearColeccionController,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                final imagenes =
                                    (widget.imagenes?.toList() ?? [])
                                        .take(1)
                                        .toList();
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(imagenes.length,
                                        (imagenesIndex) {
                                      final imagenesItem =
                                          imagenes[imagenesIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'CREAR_COLECCION_CON_POST_Stack_vhj4v59t_');
                                          logFirebaseEvent(
                                              'Stack_upload_media_to_firebase');
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            imageQuality: 80,
                                            allowPhoto: true,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            setState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
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
                                              _model.isDataUploading = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              setState(() {
                                                _model.uploadedLocalFile =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              setState(() {});
                                              return;
                                            }
                                          }
                                        },
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            Container(
                                              width: 96.0,
                                              height: 76.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 2.0,
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.upload_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 30.0,
                                              ),
                                            ),
                                            if (_model.isDataUploading)
                                              Container(
                                                width: 96.0,
                                                height: 76.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.circleNotch,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ).animateOnPageLoad(animationsMap[
                                                    'iconOnPageLoadAnimation']!),
                                              ),
                                            if (_model.uploadedFileUrl !=
                                                    null &&
                                                _model.uploadedFileUrl != '')
                                              Container(
                                                width: 97.0,
                                                height: 77.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                ),
                                                child: Visibility(
                                                  visible: (_model.uploadedFileUrl !=
                                                              null &&
                                                          _model.uploadedFileUrl !=
                                                              '') ||
                                                      (crearColeccionConPostUserPostsRecord
                                                                  .postPhotolist
                                                                  .first !=
                                                              null &&
                                                          crearColeccionConPostUserPostsRecord
                                                                  .postPhotolist
                                                                  .first !=
                                                              ''),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                    child: Image.network(
                                                      _model.uploadedFileUrl !=
                                                                  null &&
                                                              _model.uploadedFileUrl !=
                                                                  ''
                                                          ? _model
                                                              .uploadedFileUrl
                                                          : crearColeccionConPostUserPostsRecord
                                                              .postPhotolist
                                                              .first,
                                                      width: 96.0,
                                                      height: 76.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                      .addWalkthrough(
                                                        imageP2pxjmem,
                                                        _model
                                                            .crearColeccionController,
                                                      )
                                                      .animateOnPageLoad(
                                                          animationsMap[
                                                              'imageOnPageLoadAnimation']!),
                                                ),
                                              ),
                                          ],
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller:
                                _model.descripcionColeccionTextController,
                            focusNode: _model.descripcionColeccionFocusNode,
                            autofocus: false,
                            textCapitalization: TextCapitalization.sentences,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'lsddpjoi' /* Descripción de la colección...... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
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
                            maxLines: 3,
                            minLines: 1,
                            keyboardType: TextInputType.multiline,
                            validator: _model
                                .descripcionColeccionTextControllerValidator
                                .asValidator(context),
                          ).addWalkthrough(
                            textField477ul6ox,
                            _model.crearColeccionController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 32.0,
                    thickness: 1.0,
                    indent: 16.0,
                    endIndent: 16.0,
                    color: Color(0x27FAF7FA),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '1w8tghe0' /* Privacidad de colección */,
                                  ),
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ).addWalkthrough(
                                  textBwi1xhqn,
                                  _model.crearColeccionController,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
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
                                  'CREAR_COLECCION_CON_POST_Row_js7gs1pp_ON');
                              if (!_model.varPublico) {
                                logFirebaseEvent('Row_update_page_state');
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
                                  padding: EdgeInsets.all(4.0),
                                  child: Stack(
                                    children: [
                                      if (!_model.varPublico)
                                        Icon(
                                          Icons.check_box_outline_blank,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      if (_model.varPublico)
                                        Icon(
                                          Icons.check_box_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'vw30nknp' /* Público */,
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
                                  'CREAR_COLECCION_CON_POST_Row_166af8u9_ON');
                              if (!_model.varAmigos) {
                                logFirebaseEvent('Row_update_page_state');
                                _model.varPublico = false;
                                _model.varAmigos = true;
                                _model.varPrivado = false;
                                setState(() {});
                              }
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Stack(
                                    children: [
                                      if (!_model.varAmigos)
                                        Icon(
                                          Icons.check_box_outline_blank,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      if (_model.varAmigos)
                                        Icon(
                                          Icons.check_box_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'g80j6eyc' /* Amigos */,
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
                                  'CREAR_COLECCION_CON_POST_Row_5ywwyxzl_ON');
                              if (!_model.varPrivado) {
                                logFirebaseEvent('Row_update_page_state');
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
                                  padding: EdgeInsets.all(4.0),
                                  child: Stack(
                                    children: [
                                      if (!_model.varPrivado)
                                        Icon(
                                          Icons.check_box_outline_blank,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      if (_model.varPrivado)
                                        Icon(
                                          Icons.check_box_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'br1f053s' /* Privado */,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 32.0,
                    thickness: 1.0,
                    indent: 16.0,
                    endIndent: 16.0,
                    color: Color(0x27FAF7FA),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'nzfca8yy' /* Lugar */,
                                ),
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          child: FlutterFlowPlacePicker(
                            iOSGoogleMapsApiKey:
                                'AIzaSyBPFPY-wOg7x310w7aVGhp1gpRpo_9TVz4',
                            androidGoogleMapsApiKey:
                                'AIzaSyBXd-oSPKfc85tvGTa9nvkmw7yurBxR5og',
                            webGoogleMapsApiKey:
                                'AIzaSyAHskm2jbC5FxoT9DoOhIcq2xKwl2zEYNQ',
                            onSelect: (place) async {
                              setState(() => _model.placePickerValue = place);
                            },
                            defaultText: FFLocalizations.of(context).getText(
                              'v3munns3' /* Elige un lugar en el mapa */,
                            ),
                            icon: Icon(
                              Icons.place,
                              color: Colors.white,
                              size: 16.0,
                            ),
                            buttonOptions: FFButtonOptions(
                              width: double.infinity,
                              height: 55.0,
                              color: FlutterFlowTheme.of(context).alternate,
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
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ).addWalkthrough(
                            placePickerL72i2r1d,
                            _model.crearColeccionController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  wrapWithModel(
                    model: _model.boton1Model,
                    updateCallback: () => setState(() {}),
                    child: Boton1Widget(
                      texto: 'Crear',
                      desabilitado:
                          _model.tituloColeccionTextController.text == null ||
                              _model.tituloColeccionTextController.text == '',
                      accion: () async {
                        logFirebaseEvent(
                            'CREAR_COLECCION_CON_POST_Container_1oz0k');
                        logFirebaseEvent('boton1_backend_call');

                        var collectionsRecordReference =
                            CollectionsRecord.collection.doc();
                        await collectionsRecordReference
                            .set(createCollectionsRecordData(
                          nombre: _model.tituloColeccionTextController.text,
                          createdAt: getCurrentTimestamp,
                          createdBy: currentUserReference,
                          modifiedAt: getCurrentTimestamp,
                          descripcion:
                              _model.descripcionColeccionTextController.text,
                          imagen: _model.uploadedFileUrl != null &&
                                  _model.uploadedFileUrl != ''
                              ? _model.uploadedFileUrl
                              : crearColeccionConPostUserPostsRecord
                                  .postPhotolist.first,
                          coleccionFavoritos: widget.esColeccionFavorito,
                          coleccionPublica: _model.varPublico,
                          coleccionPrivada: _model.varPrivado,
                          coleccionAmigos: _model.varAmigos,
                          placeInfo: createPlaceInfoStruct(
                            name: _model.placePickerValue.name,
                            address: _model.placePickerValue.address,
                            city: _model.placePickerValue.city,
                            state: _model.placePickerValue.state,
                            country: _model.placePickerValue.country,
                            zipcode: _model.placePickerValue.zipCode,
                            latLng: _model.placePickerValue.latLng,
                            clearUnsetFields: false,
                            create: true,
                          ),
                        ));
                        _model.nuevaColeccion =
                            CollectionsRecord.getDocumentFromData(
                                createCollectionsRecordData(
                                  nombre:
                                      _model.tituloColeccionTextController.text,
                                  createdAt: getCurrentTimestamp,
                                  createdBy: currentUserReference,
                                  modifiedAt: getCurrentTimestamp,
                                  descripcion: _model
                                      .descripcionColeccionTextController.text,
                                  imagen: _model.uploadedFileUrl != null &&
                                          _model.uploadedFileUrl != ''
                                      ? _model.uploadedFileUrl
                                      : crearColeccionConPostUserPostsRecord
                                          .postPhotolist.first,
                                  coleccionFavoritos:
                                      widget.esColeccionFavorito,
                                  coleccionPublica: _model.varPublico,
                                  coleccionPrivada: _model.varPrivado,
                                  coleccionAmigos: _model.varAmigos,
                                  placeInfo: createPlaceInfoStruct(
                                    name: _model.placePickerValue.name,
                                    address: _model.placePickerValue.address,
                                    city: _model.placePickerValue.city,
                                    state: _model.placePickerValue.state,
                                    country: _model.placePickerValue.country,
                                    zipcode: _model.placePickerValue.zipCode,
                                    latLng: _model.placePickerValue.latLng,
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                ),
                                collectionsRecordReference);
                        if (widget.post != null) {
                          logFirebaseEvent('boton1_backend_call');

                          await _model.nuevaColeccion!.reference.update({
                            ...createCollectionsRecordData(
                              imagen: '',
                            ),
                            ...mapToFirestore(
                              {
                                'postuUserList':
                                    FieldValue.arrayUnion([widget.post]),
                              },
                            ),
                          });
                        }
                        logFirebaseEvent('boton1_navigate_back');
                        context.pop();

                        setState(() {});
                      },
                    ),
                  ).addWalkthrough(
                    container1oz0keva,
                    _model.crearColeccionController,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.crearColeccionController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
