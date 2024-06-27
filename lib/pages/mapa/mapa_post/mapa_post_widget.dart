import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post_grid_mapa_global/post_grid_mapa_global_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mapa_post_model.dart';
export 'mapa_post_model.dart';

class MapaPostWidget extends StatefulWidget {
  const MapaPostWidget({super.key});

  @override
  State<MapaPostWidget> createState() => _MapaPostWidgetState();
}

class _MapaPostWidgetState extends State<MapaPostWidget> {
  late MapaPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapaPostModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'mapaPost'});
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.textFieldBuscarTextController,
                        focusNode: _model.textFieldBuscarFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: FFLocalizations.of(context).getText(
                            'uwi4f8ys' /* Dj Techno */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).fondoIcono,
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: Color(0xFF757575),
                            size: 22.0,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        validator: _model.textFieldBuscarTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).fondoIcono,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.location_pin,
                          color: FlutterFlowTheme.of(context).icono,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.postGridMapaGlobalModel,
                  updateCallback: () => setState(() {}),
                  child: PostGridMapaGlobalWidget(),
                ),
              ),
            ),
            wrapWithModel(
              model: _model.navBar1Model,
              updateCallback: () => setState(() {}),
              child: NavBar1Widget(
                tabActiva: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
