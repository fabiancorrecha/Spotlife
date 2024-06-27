import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar6/app_bar6_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/notificacion_post/notificacion_post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notificaciones_model.dart';
export 'notificaciones_model.dart';

class NotificacionesWidget extends StatefulWidget {
  const NotificacionesWidget({super.key});

  @override
  State<NotificacionesWidget> createState() => _NotificacionesWidgetState();
}

class _NotificacionesWidgetState extends State<NotificacionesWidget> {
  late NotificacionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificacionesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'notificaciones'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ActividadRecord>>(
      stream: queryActividadRecord(
        queryBuilder: (actividadRecord) => actividadRecord
            .where(
              'recibeActividad',
              isEqualTo: currentUserReference,
            )
            .where(
              'creadorActividad',
              isNotEqualTo: currentUserReference,
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
        List<ActividadRecord> notificacionesActividadRecordList =
            snapshot.data!;
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 48.0),
                    child: wrapWithModel(
                      model: _model.appBar6Model,
                      updateCallback: () => setState(() {}),
                      child: AppBar6Widget(),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  final actividadesHoy =
                                      notificacionesActividadRecordList
                                          .where((e) =>
                                              dateTimeFormat(
                                                'yMd',
                                                e.fechaCreacion,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ) ==
                                              dateTimeFormat(
                                                'yMd',
                                                getCurrentTimestamp,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ))
                                          .toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: actividadesHoy.length,
                                    itemBuilder:
                                        (context, actividadesHoyIndex) {
                                      final actividadesHoyItem =
                                          actividadesHoy[actividadesHoyIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (actividadesHoyIndex == 0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'jt5buyxo' /* Hoy */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .fondoIcono,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 8.0),
                                            child: NotificacionPostWidget(
                                              key: Key(
                                                  'Key86a_${actividadesHoyIndex}_of_${actividadesHoy.length}'),
                                              actividad: actividadesHoyItem,
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  final actividadesAyer =
                                      notificacionesActividadRecordList
                                          .where((e) =>
                                              dateTimeFormat(
                                                'yMd',
                                                e.fechaCreacion,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ) ==
                                              dateTimeFormat(
                                                'yMd',
                                                functions.diaDeAyer(),
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ))
                                          .toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: actividadesAyer.length,
                                    itemBuilder:
                                        (context, actividadesAyerIndex) {
                                      final actividadesAyerItem =
                                          actividadesAyer[actividadesAyerIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (actividadesAyerIndex == 0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'fzk0kagy' /* Ayer */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .fondoIcono,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 8.0),
                                            child: NotificacionPostWidget(
                                              key: Key(
                                                  'Keyozc_${actividadesAyerIndex}_of_${actividadesAyer.length}'),
                                              actividad: actividadesAyerItem,
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  final actividadesSemana =
                                      notificacionesActividadRecordList
                                          .where((e) =>
                                              (functions
                                                      .semanaSinHoyYAyer()
                                                      .start <=
                                                  e.fechaCreacion!) &&
                                              (functions
                                                      .semanaSinHoyYAyer()
                                                      .end >=
                                                  e.fechaCreacion!))
                                          .toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: actividadesSemana.length,
                                    itemBuilder:
                                        (context, actividadesSemanaIndex) {
                                      final actividadesSemanaItem =
                                          actividadesSemana[
                                              actividadesSemanaIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (actividadesSemanaIndex == 0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'fd2a6df5' /* Esta semana */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .fondoIcono,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 8.0),
                                            child: NotificacionPostWidget(
                                              key: Key(
                                                  'Keykg1_${actividadesSemanaIndex}_of_${actividadesSemana.length}'),
                                              actividad: actividadesSemanaItem,
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  final actividadesMes =
                                      notificacionesActividadRecordList
                                          .where((e) =>
                                              (functions
                                                      .ultimos30DiasSinUltimaSemana()
                                                      .start <=
                                                  e.fechaCreacion!) &&
                                              (functions
                                                      .ultimos30DiasSinUltimaSemana()
                                                      .end >=
                                                  e.fechaCreacion!))
                                          .toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: actividadesMes.length,
                                    itemBuilder:
                                        (context, actividadesMesIndex) {
                                      final actividadesMesItem =
                                          actividadesMes[actividadesMesIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (actividadesMesIndex == 0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '9hnwefie' /* Este mes */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .fondoIcono,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 8.0),
                                            child: NotificacionPostWidget(
                                              key: Key(
                                                  'Keykyi_${actividadesMesIndex}_of_${actividadesMes.length}'),
                                              actividad: actividadesMesItem,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 32.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Builder(
                                  builder: (context) {
                                    final actividadeAntesDeMes =
                                        notificacionesActividadRecordList
                                            .where((e) =>
                                                functions
                                                    .ultimos30DiasSinUltimaSemana()
                                                    .start >
                                                e.fechaCreacion!)
                                            .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: actividadeAntesDeMes.length,
                                      itemBuilder:
                                          (context, actividadeAntesDeMesIndex) {
                                        final actividadeAntesDeMesItem =
                                            actividadeAntesDeMes[
                                                actividadeAntesDeMesIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (actividadeAntesDeMesIndex == 0)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 32.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'g48oc7t5' /* Mas de un mes */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .fondoIcono,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 8.0, 16.0, 8.0),
                                              child: NotificacionPostWidget(
                                                key: Key(
                                                    'Keyde2_${actividadeAntesDeMesIndex}_of_${actividadeAntesDeMes.length}'),
                                                actividad:
                                                    actividadeAntesDeMesItem,
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
                        ],
                      ),
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    wrapWithModel(
                      model: _model.navBar1Model,
                      updateCallback: () => setState(() {}),
                      child: NavBar1Widget(
                        tabActiva: 1,
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
