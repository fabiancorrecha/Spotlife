import '/backend/backend.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/menu02/menu02_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/walkthroughs/buscar_lugares.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'buscar_lugares_model.dart';
export 'buscar_lugares_model.dart';

class BuscarLugaresWidget extends StatefulWidget {
  const BuscarLugaresWidget({super.key});

  @override
  State<BuscarLugaresWidget> createState() => _BuscarLugaresWidgetState();
}

class _BuscarLugaresWidgetState extends State<BuscarLugaresWidget>
    with TickerProviderStateMixin {
  late BuscarLugaresModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuscarLugaresModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'buscarLugares'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.textFieldBuscarTextController ??= TextEditingController();
    _model.textFieldBuscarFocusNode ??= FocusNode();

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 40.0, 16.0, 32.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'BUSCAR_LUGARES_Container_m8iidosn_ON_TAP');
                                logFirebaseEvent('Container_navigate_back');
                                context.pop();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).fondoIcono,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    FFIcons.karrowBack,
                                    color: FlutterFlowTheme.of(context).icono,
                                    size: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: TextFormField(
                                controller:
                                    _model.textFieldBuscarTextController,
                                focusNode: _model.textFieldBuscarFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textFieldBuscarTextController',
                                  Duration(milliseconds: 1500),
                                  () => setState(() {}),
                                ),
                                onFieldSubmitted: (_) async {
                                  logFirebaseEvent(
                                      'BUSCAR_LUGARES_TextFieldBuscar_ON_TEXTFI');
                                  logFirebaseEvent(
                                      'TextFieldBuscar_algolia_search');
                                  safeSetState(
                                      () => _model.algoliaSearchResults = null);
                                  await UserPostsRecord.search(
                                    term: _model
                                        .textFieldBuscarTextController.text,
                                    maxResults: 12,
                                  )
                                      .then((r) =>
                                          _model.algoliaSearchResults = r)
                                      .onError((_, __) =>
                                          _model.algoliaSearchResults = [])
                                      .whenComplete(() => setState(() {}));
                                },
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFLocalizations.of(context).getText(
                                    '22q8tumg' /* Buscar */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
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
                                  fillColor:
                                      FlutterFlowTheme.of(context).fondoIcono,
                                  suffixIcon: Icon(
                                    FFIcons.ksearch,
                                    color: Color(0xFF757575),
                                    size: 22.0,
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
                                    .textFieldBuscarTextControllerValidator
                                    .asValidator(context),
                              ).addWalkthrough(
                                textFieldVo7chw27,
                                _model.buscarLugaresController,
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
                                  'BUSCAR_LUGARES_Container_hj9dhjph_ON_TAP');
                              logFirebaseEvent('Container_update_page_state');
                              _model.verLista = !_model.verLista!;
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).fondoIcono,
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  if (!_model.verLista!)
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        FFIcons.kframe169,
                                        color:
                                            FlutterFlowTheme.of(context).icono,
                                        size: 18.0,
                                      ),
                                    ),
                                  if (_model.verLista ?? true)
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        FFIcons.kmenu,
                                        color:
                                            FlutterFlowTheme.of(context).icono,
                                        size: 18.0,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.menu02Model,
                    updateCallback: () => setState(() {}),
                    child: Menu02Widget(
                      seccion: 3,
                    ),
                  ).addWalkthrough(
                    container9ncdwzx1,
                    _model.buscarLugaresController,
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              if (_model.algoliaSearchResults == null) {
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
                              final postResultado =
                                  _model.algoliaSearchResults?.toList() ?? [];
                              if (postResultado.isEmpty) {
                                return Center(
                                  child: ComponenteVacioWidget(),
                                );
                              }
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                  childAspectRatio: 0.72,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: postResultado.length,
                                itemBuilder: (context, postResultadoIndex) {
                                  final postResultadoItem =
                                      postResultado[postResultadoIndex];
                                  return Builder(
                                    builder: (context) {
                                      final listImage = postResultadoItem
                                          .postPhotolist
                                          .toList();
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            listImage.length, (listImageIndex) {
                                          final listImageItem =
                                              listImage[listImageIndex];
                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.436,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.278,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                child: Image.network(
                                                  listImageItem,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'imageOnPageLoadAnimation']!),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        if (_model.verLista ?? true)
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.MapaPerzonalizado(
                              width: double.infinity,
                              height: double.infinity,
                              ubicacionInicialLat: valueOrDefault<double>(
                                functions.obtenerLatLng(
                                    currentUserLocationValue!, true),
                                51.5389535,
                              ),
                              ubicacionInicialLng: valueOrDefault<double>(
                                functions.obtenerLatLng(
                                    currentUserLocationValue!, false),
                                5.1719404,
                              ),
                              zoom: 16.0,
                              listaPostMarcadores: _model.algoliaSearchResults,
                            ),
                          ),
                      ],
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navBar1Model,
                    updateCallback: () => setState(() {}),
                    child: NavBar1Widget(
                      tabActiva: 4,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -0.79),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
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
          safeSetState(() => _model.buscarLugaresController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
