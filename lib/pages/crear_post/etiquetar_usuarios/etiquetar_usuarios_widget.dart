import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'etiquetar_usuarios_model.dart';
export 'etiquetar_usuarios_model.dart';

class EtiquetarUsuariosWidget extends StatefulWidget {
  const EtiquetarUsuariosWidget({
    super.key,
    bool? esimagen,
    this.imagenes,
    this.video,
  }) : esimagen = esimagen ?? false;

  final bool esimagen;
  final List<String>? imagenes;
  final String? video;

  @override
  State<EtiquetarUsuariosWidget> createState() =>
      _EtiquetarUsuariosWidgetState();
}

class _EtiquetarUsuariosWidgetState extends State<EtiquetarUsuariosWidget> {
  late EtiquetarUsuariosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EtiquetarUsuariosModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ETIQUETAR_USUARIOS_EtiquetarUsuarios_ON_');
      logFirebaseEvent('EtiquetarUsuarios_update_component_state');
      _model.buscarPersonas = false;
      safeSetState(() {});
    });

    _model.buscarusuarioTextController ??= TextEditingController();
    _model.buscarusuarioFocusNode ??= FocusNode();

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
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 54.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 100.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).btnText,
                      size: 30.0,
                    ),
                    showLoadingIndicator: true,
                    onPressed: () async {
                      logFirebaseEvent(
                          'ETIQUETAR_USUARIOS_chevron_left_ICN_ON_T');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.safePop();
                    },
                  ),
                  Expanded(
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '3a82wqdh' /* Etiquetar Personas */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'ETIQUETAR_USUARIOS_SIGUIENTE_BTN_ON_TAP');
                      logFirebaseEvent('Button_update_app_state');
                      FFAppState().selectedUser = _model.selectedUser
                          .toList()
                          .cast<DocumentReference>();
                      FFAppState().update(() {});
                      logFirebaseEvent('Button_bottom_sheet');
                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context).getText(
                      'hv6h9kpo' /* Siguiente */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0x00F4F176),
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ),
            if (_model.buscarPersonas == false)
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (widget.esimagen == true)
                    Builder(
                      builder: (context) {
                        final imageList = widget.imagenes?.toList() ?? [];

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(imageList.length,
                                (imageListIndex) {
                              final imageListItem = imageList[imageListIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'ETIQUETAR_USUARIOS_Image_jqokk904_ON_TAP');
                                    logFirebaseEvent(
                                        'Image_update_component_state');
                                    _model.buscarPersonas = true;
                                    safeSetState(() {});
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: CachedNetworkImage(
                                      fadeInDuration: const Duration(milliseconds: 0),
                                      fadeOutDuration:
                                          const Duration(milliseconds: 0),
                                      imageUrl: imageListItem,
                                      width: 350.0,
                                      height: 344.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (widget.esimagen != true)
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'ETIQUETAR_USUARIOS_Container03_ON_TAP');
                              logFirebaseEvent(
                                  'Container03_update_component_state');
                              _model.buscarPersonas = true;
                              safeSetState(() {});
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Container(
                                width: 360.0,
                                height: 310.0,
                                constraints: const BoxConstraints(
                                  minWidth: 216.0,
                                  maxWidth: 218.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(0.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 0.0,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ETIQUETAR_USUARIOS_Container_vizfgrtx_ON');
                                        logFirebaseEvent(
                                            'CustomVideoPlayerCopy_update_component_s');
                                        _model.buscarPersonas = true;
                                        safeSetState(() {});
                                      },
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: custom_widgets
                                            .CustomVideoPlayerCopy(
                                          width: double.infinity,
                                          height: double.infinity,
                                          videoPath: widget.video!,
                                          soundOn: Icon(
                                            Icons.volume_up,
                                            color: FlutterFlowTheme.of(context)
                                                .btnText,
                                            size: 20.0,
                                          ),
                                          soundOff: Icon(
                                            Icons.volume_mute,
                                            color: FlutterFlowTheme.of(context)
                                                .btnText,
                                            size: 20.0,
                                          ),
                                          fullscreen: Icon(
                                            Icons.fullscreen_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .btnText,
                                            size: 20.0,
                                          ),
                                          closeScreem: Icon(
                                            Icons.fullscreen_exit,
                                            color: FlutterFlowTheme.of(context)
                                                .btnText,
                                            size: 20.0,
                                          ),
                                          buttonSize: 40.0,
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
                                            'ETIQUETAR_USUARIOS_Container_y5rz15dg_ON');
                                        logFirebaseEvent(
                                            'Container_update_component_state');
                                        _model.buscarPersonas = true;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: const BoxDecoration(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 20.0, 12.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Container(
                            width: double.infinity,
                            height: 41.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              'Toca ${valueOrDefault<String>(
                                widget.esimagen == true
                                    ? 'la imagen'
                                    : 'el video',
                                'la imagen',
                              )} para etiquetar personas',
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
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: FlutterFlowTheme.of(context).accent4,
                        ),
                        if (_model.selectedUser.isNotEmpty)
                          Container(
                            width: double.infinity,
                            height: 41.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'eds92nm3' /* Etiquetas */,
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
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final selectedUsers =
                                  _model.selectedUser.toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: selectedUsers.length,
                                itemBuilder: (context, selectedUsersIndex) {
                                  final selectedUsersItem =
                                      selectedUsers[selectedUsersIndex];
                                  return StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        selectedUsersItem),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 30.0,
                                            height: 30.0,
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          rowUsersRecord
                                                              .displayName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          rowUsersRecord
                                                              .userName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: const Color(
                                                                    0xFF8B8B8B),
                                                                fontSize: 14.0,
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
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 8.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.close,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .btnText,
                                              size: 16.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ETIQUETAR_USUARIOS_COMP_close_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_update_component_state');
                                              _model.removeFromSelectedUser(
                                                  selectedUsersItem);
                                              safeSetState(() {});
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
                        if (_model.selectedUser.isNotEmpty)
                          Divider(
                            thickness: 0.5,
                            color: FlutterFlowTheme.of(context).accent4,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            if (_model.buscarPersonas == true)
              Align(
                alignment: const AlignmentDirectional(0.0, -0.81),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 9.0, 0.0),
                          child: TextFormField(
                            controller: _model.buscarusuarioTextController,
                            focusNode: _model.buscarusuarioFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.buscarusuarioTextController',
                              const Duration(milliseconds: 0),
                              () async {
                                logFirebaseEvent(
                                    'ETIQUETAR_USUARIOS_buscarusuario_ON_TEXT');
                                logFirebaseEvent('buscarusuario_simple_search');
                                await queryUsersRecordOnce()
                                    .then(
                                      (records) => _model.simpleSearchResults =
                                          TextSearch(
                                        records
                                            .map(
                                              (record) =>
                                                  TextSearchItem.fromTerms(
                                                      record, [
                                                record.displayName,
                                                record.email,
                                                record.userName
                                              ]),
                                            )
                                            .toList(),
                                      )
                                              .search(_model
                                                  .buscarusuarioTextController
                                                  .text)
                                              .map((r) => r.object)
                                              .toList(),
                                    )
                                    .onError((_, __) =>
                                        _model.simpleSearchResults = [])
                                    .whenComplete(() => safeSetState(() {}));
                              },
                            ),
                            autofocus: false,
                            textCapitalization: TextCapitalization.sentences,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'asarl4zo' /* Buscar... */,
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
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              suffixIcon: _model.buscarusuarioTextController!
                                      .text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.buscarusuarioTextController
                                            ?.clear();
                                        logFirebaseEvent(
                                            'ETIQUETAR_USUARIOS_buscarusuario_ON_TEXT');
                                        logFirebaseEvent(
                                            'buscarusuario_simple_search');
                                        await queryUsersRecordOnce()
                                            .then(
                                              (records) => _model
                                                      .simpleSearchResults =
                                                  TextSearch(
                                                records
                                                    .map(
                                                      (record) => TextSearchItem
                                                          .fromTerms(record, [
                                                        record.displayName,
                                                        record.email,
                                                        record.userName
                                                      ]),
                                                    )
                                                    .toList(),
                                              )
                                                      .search(_model
                                                          .buscarusuarioTextController
                                                          .text)
                                                      .map((r) => r.object)
                                                      .toList(),
                                            )
                                            .onError((_, __) =>
                                                _model.simpleSearchResults = [])
                                            .whenComplete(
                                                () => safeSetState(() {}));

                                        safeSetState(() {});
                                      },
                                      child: const Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 22.0,
                                      ),
                                    )
                                  : null,
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
                            validator: _model
                                .buscarusuarioTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (_model.buscarusuarioTextController.text != '')
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final resultUser = _model.simpleSearchResults.toList();

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: resultUser.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                      itemBuilder: (context, resultUserIndex) {
                        final resultUserItem = resultUser[resultUserIndex];
                        return StreamBuilder<UsersRecord>(
                          stream:
                              UsersRecord.getDocument(resultUserItem.reference),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 12.0,
                                  height: 12.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                ),
                              );
                            }

                            final rowUsersRecord = snapshot.data!;

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'ETIQUETAR_USUARIOS_Row_0icfs5w2_ON_TAP');
                                logFirebaseEvent('Row_update_component_state');
                                _model.buscarPersonas = false;
                                _model.addToSelectedUser(
                                    resultUserItem.reference);
                                safeSetState(() {});
                                logFirebaseEvent(
                                    'Row_clear_text_fields_pin_codes');
                                safeSetState(() {
                                  _model.buscarusuarioTextController?.clear();
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 30.0,
                                    height: 30.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      fadeInDuration: const Duration(milliseconds: 0),
                                      fadeOutDuration:
                                          const Duration(milliseconds: 0),
                                      imageUrl: valueOrDefault<String>(
                                        rowUsersRecord.photoUrl,
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  rowUsersRecord.displayName,
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  rowUsersRecord.userName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            const Color(0xFF8B8B8B),
                                                        fontSize: 14.0,
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
                                  ),
                                ],
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
    );
  }
}
