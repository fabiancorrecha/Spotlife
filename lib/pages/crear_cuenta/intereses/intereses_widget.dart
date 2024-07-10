import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/intereses.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'intereses_model.dart';
export 'intereses_model.dart';

class InteresesWidget extends StatefulWidget {
  const InteresesWidget({super.key});

  @override
  State<InteresesWidget> createState() => _InteresesWidgetState();
}

class _InteresesWidgetState extends State<InteresesWidget> {
  late InteresesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InteresesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Intereses'});
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 9.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'lm4kqwit' /* Intereses */,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).displaySmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .displaySmallFamily),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 9.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'k52awe9z' /* Elige los temas que te interes... */,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, -0.74),
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
                        logFirebaseEvent('INTERESES_PAGE_help_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_start_walkthrough');
                        safeSetState(() => _model.interesesController =
                            createPageWalkthrough(context));
                        _model.interesesController?.show(context: context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxHeight: 400.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<InteresesRecord>>(
                      stream: queryInteresesRecord(),
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
                        List<InteresesRecord> wrapInteresesRecordList =
                            snapshot.data!;

                        return Wrap(
                          spacing: 12.0,
                          runSpacing: 12.0,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.center,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: List.generate(
                              wrapInteresesRecordList.length, (wrapIndex) {
                            final wrapInteresesRecord =
                                wrapInteresesRecordList[wrapIndex];
                            return FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'INTERESES_PAGE_BUTTON_BTN_ON_TAP');
                                if (_model.intereses
                                    .contains(wrapInteresesRecord.reference)) {
                                  logFirebaseEvent('Button_update_page_state');
                                  _model.removeFromIntereses(
                                      wrapInteresesRecord.reference);
                                  _model.seguidor = [];
                                  setState(() {});
                                } else {
                                  logFirebaseEvent('Button_update_page_state');
                                  _model.addToIntereses(
                                      wrapInteresesRecord.reference);
                                  setState(() {});
                                }
                              },
                              text: wrapInteresesRecord.interes,
                              icon: const Icon(
                                Icons.add,
                                size: 20.0,
                              ),
                              options: FFButtonOptions(
                                height: 30.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: valueOrDefault<Color>(
                                  _model.intereses.contains(
                                              wrapInteresesRecord.reference) ==
                                          true
                                      ? FlutterFlowTheme.of(context).secondary
                                      : const Color(0xFF333333),
                                  const Color(0xFF333333),
                                ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                            ).addWalkthrough(
                              buttonUnunxjml,
                              _model.interesesController,
                              listIndex: wrapIndex,
                            );
                          }),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: wrapWithModel(
                model: _model.boton1Model,
                updateCallback: () => setState(() {}),
                child: Boton1Widget(
                  texto: 'Continuar',
                  desabilitado: false,
                  accion: () async {
                    logFirebaseEvent('INTERESES_Container_ycmylxk5_CALLBACK');
                    logFirebaseEvent('boton1_backend_call');

                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'MisIntereses': _model.intereses,
                        },
                      ),
                    });
                    logFirebaseEvent('boton1_update_page_state');
                    _model.intereses = [];
                    setState(() {});
                    logFirebaseEvent('boton1_navigate_to');

                    context.pushNamed('primerosSeguidos');
                  },
                ),
              ).addWalkthrough(
                containerYcmylxk5,
                _model.interesesController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.interesesController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
