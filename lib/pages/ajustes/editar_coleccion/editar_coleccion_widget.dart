import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'editar_coleccion_model.dart';
export 'editar_coleccion_model.dart';

class EditarColeccionWidget extends StatefulWidget {
  const EditarColeccionWidget({
    super.key,
    this.coleccion,
    this.coleccionPublica,
    this.coleccionAmigos,
    this.coleccionPrivado,
  });

  final DocumentReference? coleccion;
  final bool? coleccionPublica;
  final bool? coleccionAmigos;
  final bool? coleccionPrivado;

  @override
  State<EditarColeccionWidget> createState() => _EditarColeccionWidgetState();
}

class _EditarColeccionWidgetState extends State<EditarColeccionWidget>
    with TickerProviderStateMixin {
  late EditarColeccionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarColeccionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'editarColeccion'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDITAR_COLECCION_editarColeccion_ON_INIT');
      logFirebaseEvent('editarColeccion_update_page_state');
      _model.varPublico = widget.coleccionPublica!;
      _model.varAmigos = widget.coleccionAmigos!;
      _model.varPrivado = widget.coleccionPrivado!;
      safeSetState(() {});
    });

    _model.tituloColeccionFocusNode ??= FocusNode();

    _model.descripcionColeccionFocusNode ??= FocusNode();

    animationsMap.addAll({
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
    return StreamBuilder<CollectionsRecord>(
      stream: CollectionsRecord.getDocument(widget.coleccion!),
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

        final editarColeccionCollectionsRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        12.0, 32.0, 16.0, 16.0),
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
                                'EDITAR_COLECCION_Card_yq1k27uf_ON_TAP');
                            if (_model.uploadedFileUrl != '') {
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
                              padding: const EdgeInsets.all(5.0),
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
                            FFLocalizations.of(context).getText(
                              'zp6uri06' /* Editar colección */,
                            ),
                            textAlign: TextAlign.center,
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
                      ],
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: TextFormField(
                                controller:
                                    _model.tituloColeccionTextController ??=
                                        TextEditingController(
                                  text: editarColeccionCollectionsRecord.nombre,
                                ),
                                focusNode: _model.tituloColeccionFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.tituloColeccionTextController',
                                  const Duration(milliseconds: 300),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFLocalizations.of(context).getText(
                                    'wnkh58hr' /* Título de la colección... */,
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
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
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
                                    borderRadius: BorderRadius.only(
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
                                  'EDITAR_COLECCION_Stack_lp1n4oji_ON_TAP');
                              logFirebaseEvent(
                                  'Stack_upload_media_to_firebase');
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                imageQuality: 80,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(
                                    () => _model.isDataUploading = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
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
                                  _model.isDataUploading = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl = downloadUrls.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }
                            },
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                Container(
                                  width: 96.0,
                                  height: 76.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 2.0,
                                    ),
                                  ),
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.upload_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                ),
                                if ((editarColeccionCollectionsRecord.imagen !=
                                        '') ||
                                    (_model.uploadedFileUrl != ''))
                                  Container(
                                    width: 97.0,
                                    height: 77.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(0.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.0),
                                      child: Image.network(
                                        _model.uploadedFileUrl != ''
                                            ? _model.uploadedFileUrl
                                            : editarColeccionCollectionsRecord
                                                .imagen,
                                        width: 96.0,
                                        height: 76.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'imageOnPageLoadAnimation']!),
                                  ),
                                if (_model.isDataUploading)
                                  Container(
                                    width: 96.0,
                                    height: 76.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(4.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2.0,
                                      ),
                                    ),
                                    alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.circleNotch,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ).animateOnPageLoad(animationsMap[
                                        'iconOnPageLoadAnimation']!),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller:
                                _model.descripcionColeccionTextController ??=
                                    TextEditingController(
                              text:
                                  editarColeccionCollectionsRecord.descripcion,
                            ),
                            focusNode: _model.descripcionColeccionFocusNode,
                            autofocus: false,
                            textCapitalization: TextCapitalization.sentences,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'mkwsx15g' /* Descripción de la colección...... */,
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
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.only(
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
                      mainAxisSize: MainAxisSize.min,
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
                                    '8gphoshi' /* Privacidad de colección */,
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 8.0, 16.0, 0.0),
                    child: Container(
                      decoration: const BoxDecoration(),
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
                                  'EDITAR_COLECCION_Row_qy3q5owp_ON_TAP');
                              if (!_model.varPublico) {
                                logFirebaseEvent('Row_update_page_state');
                                _model.varPublico = true;
                                _model.varAmigos = false;
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
                                      '561zo286' /* Público */,
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
                                  'EDITAR_COLECCION_Row_3z74h2it_ON_TAP');
                              if (!_model.varAmigos) {
                                logFirebaseEvent('Row_update_page_state');
                                _model.varPublico = false;
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
                                      'bfj1zlk8' /* Amigos */,
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
                                  'EDITAR_COLECCION_Row_wjeo0d5f_ON_TAP');
                              if (!_model.varPrivado) {
                                logFirebaseEvent('Row_update_page_state');
                                _model.varPublico = false;
                                _model.varAmigos = false;
                                _model.varPrivado = true;
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
                                      'c8ndpvnn' /* Privado */,
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '1fbuxs4x' /* Lugar */,
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
                          decoration: const BoxDecoration(),
                          child: FlutterFlowPlacePicker(
                            iOSGoogleMapsApiKey:
                                'AIzaSyCh-IGEBvdvzziaujkF-QlXNHvyMlAom-U',
                            androidGoogleMapsApiKey:
                                'AIzaSyCsdwY0ZN0_MRcjhomnqjtjb8Co6QYPY8M',
                            webGoogleMapsApiKey:
                                'AIzaSyDO0cp7qjh7_-POR7Azm1RGktAjU4Wa0uo',
                            onSelect: (place) async {
                              safeSetState(
                                  () => _model.placePickerValue = place);
                            },
                            defaultText: FFLocalizations.of(context).getText(
                              'oyviut30' /* Elige un lugar en el mapa */,
                            ),
                            icon: const Icon(
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
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
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
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'kdls04iy' /* Tipo de colección */,
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
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ],
                      ),
                    ),
                  const Spacer(),
                  wrapWithModel(
                    model: _model.boton1Model,
                    updateCallback: () => safeSetState(() {}),
                    child: Boton1Widget(
                      texto: 'Editar',
                      desabilitado: false,
                      accion: () async {
                        logFirebaseEvent(
                            'EDITAR_COLECCION_Container_ts2igfmu_CALL');
                        logFirebaseEvent('boton1_backend_call');

                        await widget.coleccion!
                            .update(createCollectionsRecordData(
                          nombre: _model.tituloColeccionTextController.text,
                          modifiedAt: getCurrentTimestamp,
                          descripcion:
                              editarColeccionCollectionsRecord.descripcion,
                          coleccionPublica:
                              editarColeccionCollectionsRecord.coleccionPublica,
                          coleccionPrivada:
                              editarColeccionCollectionsRecord.coleccionPrivada,
                          coleccionAmigos:
                              editarColeccionCollectionsRecord.coleccionAmigos,
                        ));
                        if (_model.uploadedFileUrl != '') {
                          logFirebaseEvent('boton1_backend_call');

                          await widget.coleccion!
                              .update(createCollectionsRecordData(
                            imagen: _model.uploadedFileUrl,
                          ));
                        }
                        if ((editarColeccionCollectionsRecord.placeInfo.name !=
                                _model.placePickerValue.name) &&
                            (_model.placePickerValue != null)) {
                          logFirebaseEvent('boton1_backend_call');

                          await widget.coleccion!
                              .update(createCollectionsRecordData(
                            placeInfo: createPlaceInfoStruct(
                              name: _model.placePickerValue.name,
                              address: _model.placePickerValue.address,
                              city: _model.placePickerValue.city,
                              state: _model.placePickerValue.state,
                              country: _model.placePickerValue.country,
                              zipcode: _model.placePickerValue.zipCode,
                              latLng: _model.placePickerValue.latLng,
                              clearUnsetFields: false,
                            ),
                          ));
                        }
                        logFirebaseEvent('boton1_navigate_back');
                        context.pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
