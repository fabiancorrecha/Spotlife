import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'etiquetar_ubicacion_model.dart';
export 'etiquetar_ubicacion_model.dart';

class EtiquetarUbicacionWidget extends StatefulWidget {
  const EtiquetarUbicacionWidget({super.key});

  @override
  State<EtiquetarUbicacionWidget> createState() =>
      _EtiquetarUbicacionWidgetState();
}

class _EtiquetarUbicacionWidgetState extends State<EtiquetarUbicacionWidget> {
  late EtiquetarUbicacionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EtiquetarUbicacionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EtiquetarUbicacion'});
    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    _model.editarUbicacionTextController ??= TextEditingController();
    _model.editarUbicacionFocusNode ??= FocusNode();

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
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: StreamBuilder<List<UserPostsRecord>>(
                      stream: queryUserPostsRecord(
                        queryBuilder: (userPostsRecord) =>
                            userPostsRecord.where(
                          'postUser',
                          isEqualTo: currentUserReference,
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
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                            ),
                          );
                        }
                        List<UserPostsRecord>
                            mapaPersonalizadoEtiquetaUserPostsRecordList =
                            snapshot.data!;

                        return SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: custom_widgets.MapaPersonalizadoEtiqueta(
                            width: double.infinity,
                            height: double.infinity,
                            ubicacionInicialLat: functions.obtenerLatLng(
                                currentUserLocationValue!, true),
                            ubicacionInicialLng: functions.obtenerLatLng(
                                currentUserLocationValue!, false),
                            zoom: 16.0,
                            listaPostMarcadores:
                                mapaPersonalizadoEtiquetaUserPostsRecordList,
                            usuarioAutenticado: currentUserReference,
                            navigateToWithProfile: (bycreate, ubication) async {
                              logFirebaseEvent(
                                  'ETIQUETAR_UBICACION_Container_ssafh26o_C');
                              if (bycreate == currentUserReference) {
                                logFirebaseEvent(
                                    'MapaPersonalizadoEtiqueta_navigate_to');

                                context.pushNamed('perfilPropio');

                                return;
                              } else {
                                logFirebaseEvent(
                                    'MapaPersonalizadoEtiqueta_navigate_to');

                                context.pushNamed(
                                  'otroPerfil',
                                  queryParameters: {
                                    'perfilAjeno': serializeParam(
                                      bycreate,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );

                                return;
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, -0.81),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 16.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 9.0, 0.0),
                                      child: TextFormField(
                                        controller: _model
                                            .editarUbicacionTextController,
                                        focusNode:
                                            _model.editarUbicacionFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.editarUbicacionTextController',
                                          const Duration(milliseconds: 0),
                                          () async {
                                            logFirebaseEvent(
                                                'ETIQUETAR_UBICACION_editarUbicacion_ON_T');
                                          },
                                        ),
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'gr1kgrtu' /* Buscar... */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(28.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(28.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(28.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(28.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
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
                                                        'ETIQUETAR_UBICACION_editarUbicacion_ON_T');
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
                                            .editarUbicacionTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if ((_model.editarUbicacionFocusNode?.hasFocus ??
                              false))
                            Align(
                              alignment: const AlignmentDirectional(0.17, -0.46),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Container(
                                    width: 340.0,
                                    height: 338.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future:
                                                  (_model.apiRequestCompleter ??=
                                                          Completer<
                                                              ApiCallResponse>()
                                                            ..complete(
                                                                GooglePlaceCall
                                                                    .call(
                                                              yourQuery: _model
                                                                  .editarUbicacionTextController
                                                                  .text,
                                                              yourInput: _model
                                                                  .editarUbicacionTextController
                                                                  .text,
                                                              yourApiKey:
                                                                  'AIzaSyDO0cp7qjh7_-POR7Azm1RGktAjU4Wa0uo',
                                                            )))
                                                      .future,
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
                                                final listViewGooglePlaceResponse =
                                                    snapshot.data!;

                                                return Builder(
                                                  builder: (context) {
                                                    final address = PlaceInfoStruct
                                                                .maybeFromMap(
                                                                    listViewGooglePlaceResponse
                                                                        .jsonBody)
                                                            ?.direccion
                                                            .toList() ??
                                                        [];

                                                    return RefreshIndicator(
                                                      onRefresh: () async {
                                                        logFirebaseEvent(
                                                            'ETIQUETAR_UBICACION_ListView_37bwbu0g_ON');
                                                        logFirebaseEvent(
                                                            'ListView_refresh_database_request');
                                                        safeSetState(() => _model
                                                                .apiRequestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForApiRequestCompleted();
                                                      },
                                                      child: ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            address.length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                height: 8.0),
                                                        itemBuilder: (context,
                                                            addressIndex) {
                                                          final addressItem =
                                                              address[
                                                                  addressIndex];
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                FFIcons.kpin,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 30.0,
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              FFAppState().ubication.address,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                PlaceInfoStruct.maybeFromMap(listViewGooglePlaceResponse.jsonBody)?.name,
                                                                                'Sin identificar',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: const Color(0xFF8B8B8B),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    Expanded(
                                                      child: FFButtonWidget(
                                                        onPressed: () {
                                                          print(
                                                              'Button pressed ...');
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '7nvl03ly' /* Ver más */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 40.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              const Color(0x00F4F176),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
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
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-0.02, 0.9),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            'wk7apzfz' /* Etiquetar */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: valueOrDefault<Color>(
                              _model.isUbication == true
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              FlutterFlowTheme.of(context).primaryBackground,
                            ),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: valueOrDefault<Color>(
                                    _model.isUbication == true
                                        ? FlutterFlowTheme.of(context)
                                            .primaryBackground
                                        : const Color(0xFFB8B8B8),
                                    const Color(0xFFB8B8B8),
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(1000.0),
                          ),
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
    );
  }
}
