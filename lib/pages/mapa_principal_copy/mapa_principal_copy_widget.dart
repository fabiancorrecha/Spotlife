import '/backend/backend.dart';
import '/components/filtrar_spots/filtrar_spots_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post_grid_mapa_amigos/post_grid_mapa_amigos_widget.dart';
import '/components/post_grid_mapa_global/post_grid_mapa_global_widget.dart';
import '/components/tipo_de_post/tipo_de_post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
// ignore: unused_import
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'mapa_principal_copy_model.dart';
export 'mapa_principal_copy_model.dart';

class MapaPrincipalCopyWidget extends StatefulWidget {
  const MapaPrincipalCopyWidget({super.key});

  @override
  State<MapaPrincipalCopyWidget> createState() =>
      _MapaPrincipalCopyWidgetState();
}

class _MapaPrincipalCopyWidgetState extends State<MapaPrincipalCopyWidget> {
  late MapaPrincipalCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapaPrincipalCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'mapaPrincipalCopy'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.textFieldBuscarTextController ??= TextEditingController();
    _model.textFieldBuscarFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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

    return StreamBuilder<List<UserPostsRecord>>(
      stream: queryUserPostsRecord(
        queryBuilder: (userPostsRecord) => userPostsRecord.where(
          'esPrivado',
          isNotEqualTo: true,
        ),
      ),
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
        List<UserPostsRecord> mapaPrincipalCopyUserPostsRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Stack(
                          children: [
                            if (FFAppState().MapaGlobal == true)
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: custom_widgets.MapaPerzonalizado(
                                  width: double.infinity,
                                  height: double.infinity,
                                  ubicacionInicialLat: functions.obtenerLatLng(
                                      currentUserLocationValue!, true),
                                  ubicacionInicialLng: functions.obtenerLatLng(
                                      currentUserLocationValue!, false),
                                  zoom: 16.0,
                                  listaPostMarcadores:
                                      functions.getPlacesMaximumDistance(
                                          mapaPrincipalCopyUserPostsRecordList
                                              .toList(),
                                          currentUserLocationValue!,
                                          5000.0),
                                ),
                              ),
                            if (FFAppState().PostGlobal == true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 100.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.postGridGlobalModel,
                                  updateCallback: () => setState(() {}),
                                  child: PostGridMapaGlobalWidget(),
                                ),
                              ),
                            if (FFAppState().MapaAmigo == true)
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: custom_widgets.MapaPerzonalizado(
                                  width: double.infinity,
                                  height: double.infinity,
                                  ubicacionInicialLat: functions.obtenerLatLng(
                                      currentUserLocationValue!, true),
                                  ubicacionInicialLng: functions.obtenerLatLng(
                                      currentUserLocationValue!, false),
                                  zoom: 16.0,
                                  listaPostMarcadores:
                                      functions.getPlacesMaximumDistance(
                                          mapaPrincipalCopyUserPostsRecordList
                                              .where((e) => e.esAmigos)
                                              .toList(),
                                          currentUserLocationValue!,
                                          5000.0),
                                ),
                              ),
                            if (FFAppState().PostAmigo == true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 100.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.postGridAmigosModel,
                                  updateCallback: () => setState(() {}),
                                  child: PostGridMapaAmigosWidget(),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navBar1Model,
                    updateCallback: () => setState(() {}),
                    child: NavBar1Widget(
                      tabActiva: 2,
                    ),
                  ),
                ),
                if (((FFAppState().MapaGlobal == true) ||
                        (FFAppState().MapaAmigo == true)) &&
                    (FFAppState().PostGlobal == false) &&
                    (FFAppState().PostAmigo == false))
                  Align(
                    alignment: AlignmentDirectional(-0.03, 0.6),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'MAPA_PRINCIPAL_COPY_Card_mgq8qvqy_ON_TAP');
                          logFirebaseEvent('Card_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height: 225.0,
                                      child: TipoDePostWidget(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              FFIcons.kadd,
                              color: FlutterFlowTheme.of(context).icono,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    height: 100.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: TextFormField(
                                      controller:
                                          _model.textFieldBuscarTextController,
                                      focusNode:
                                          _model.textFieldBuscarFocusNode,
                                      autofocus: false,
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'muxn7ir1' /* Buscar */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.black,
                                        suffixIcon: Icon(
                                          Icons.search_rounded,
                                          color: Color(0xFF757575),
                                          size: 22.0,
                                        ),
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
                                      validator: _model
                                          .textFieldBuscarTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'MAPA_PRINCIPAL_COPY_Container_mujigrg7_O');
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed('buscarSpots');
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 0.0,
                                      child: Container(
                                        width: 300.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'MAPA_PRINCIPAL_COPY_Card_szhjes6n_ON_TAP');
                                logFirebaseEvent('Card_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Color(0x00000000),
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: 480.0,
                                            child: FiltrarSpotsWidget(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 8.0, 4.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.chevronDown,
                                          color: FlutterFlowTheme.of(context)
                                              .icono,
                                          size: 8.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(
                                          FFIcons.kframe169,
                                          color: FlutterFlowTheme.of(context)
                                              .icono,
                                          size: 18.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(
                                          FFIcons.kusers,
                                          color: FlutterFlowTheme.of(context)
                                              .icono,
                                          size: 20.0,
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
