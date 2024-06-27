import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/boton_add/boton_add_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar2/nav_bar2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'miperfil_mapa_model.dart';
export 'miperfil_mapa_model.dart';

class MiperfilMapaWidget extends StatefulWidget {
  const MiperfilMapaWidget({super.key});

  @override
  State<MiperfilMapaWidget> createState() => _MiperfilMapaWidgetState();
}

class _MiperfilMapaWidgetState extends State<MiperfilMapaWidget> {
  late MiperfilMapaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiperfilMapaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'miperfilMapa'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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

    return StreamBuilder<List<UserPostsRecord>>(
      stream: queryUserPostsRecord(
        queryBuilder: (userPostsRecord) => userPostsRecord.where(
          'postUser',
          isEqualTo: currentUserReference,
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
        List<UserPostsRecord> miperfilMapaUserPostsRecordList = snapshot.data!;
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
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                                  'MIPERFIL_MAPA_PAGE_Card_u7pz02ca_ON_TAP');
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
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 40.0,
                            height: 40.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              currentUserPhoto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              currentUserDisplayName,
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navBar2Model,
                    updateCallback: () => setState(() {}),
                    child: NavBar2Widget(
                      tab: 1,
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.MapaPerzonalizado(
                              width: double.infinity,
                              height: double.infinity,
                              ubicacionInicialLat: functions.obtenerLatLng(
                                  currentUserLocationValue!, true),
                              ubicacionInicialLng: functions.obtenerLatLng(
                                  currentUserLocationValue!, false),
                              zoom: 18.0,
                              listaPostMarcadores:
                                  miperfilMapaUserPostsRecordList,
                            ),
                          ),
                        ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                        ))
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: wrapWithModel(
                                model: _model.botonAddModel,
                                updateCallback: () => setState(() {}),
                                child: BotonAddWidget(
                                  accion: () async {},
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navBar1Model,
                    updateCallback: () => setState(() {}),
                    child: NavBar1Widget(
                      tabActiva: 3,
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
