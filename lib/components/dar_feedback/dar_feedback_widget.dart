import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dar_feedback_model.dart';
export 'dar_feedback_model.dart';

class DarFeedbackWidget extends StatefulWidget {
  const DarFeedbackWidget({super.key});

  @override
  State<DarFeedbackWidget> createState() => _DarFeedbackWidgetState();
}

class _DarFeedbackWidgetState extends State<DarFeedbackWidget> {
  late DarFeedbackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DarFeedbackModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(37.0, 24.0, 37.0, 34.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
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
                          'DAR_FEEDBACK_COMP_Card_47qxxvky_ON_TAP');
                      logFirebaseEvent('Card_bottom_sheet');
                      Navigator.pop(context);
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
                        'wjbydoou' /* Feedback */,
                      ),
                      textAlign: TextAlign.center,
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
                  Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 30.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'hsrvjj62' /* Por que tu opinion nos importa... */,
                              ),
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
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '92icv3lm' /* Dejar una puntuacion a Spotlif... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w200,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RatingBar.builder(
                            onRatingUpdate: (newValue) => setState(
                                () => _model.ratingBarValue = newValue),
                            itemBuilder: (context, index) => Icon(
                              Icons.star_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            direction: Axis.horizontal,
                            initialRating: _model.ratingBarValue ??= 2.0,
                            unratedColor: FlutterFlowTheme.of(context).accent3,
                            itemCount: 5,
                            itemSize: 30.0,
                            glowColor: FlutterFlowTheme.of(context).primary,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'xpjlk5zi' /* Escribe aquí... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).fondoIcono,
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
                            maxLines: 6,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                    StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord.where(
                          'rol',
                          isEqualTo: 'Spotlife',
                        ),
                        singleRecord: true,
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
                        List<UsersRecord> boton1UsersRecordList =
                            snapshot.data!;

                        final boton1UsersRecord =
                            boton1UsersRecordList.isNotEmpty
                                ? boton1UsersRecordList.first
                                : null;
                        return wrapWithModel(
                          model: _model.boton1Model,
                          updateCallback: () => setState(() {}),
                          child: Boton1Widget(
                            texto: 'Dar Feedback',
                            desabilitado: false,
                            accion: () async {
                              logFirebaseEvent(
                                  'DAR_FEEDBACK_Container_8rpfecao_CALLBACK');
                              logFirebaseEvent('boton1_backend_call');

                              await FeedbackRecord.collection
                                  .doc()
                                  .set(createFeedbackRecordData(
                                    usuario: currentUserReference,
                                    rating: _model.ratingBarValue,
                                    coment: _model.textController.text,
                                    spotlife: boton1UsersRecord?.reference,
                                  ));
                              logFirebaseEvent('boton1_custom_action');
                              _model.ratingBar = await actions.calculateRating(
                                boton1UsersRecord!.rating,
                                boton1UsersRecord.numberOfRating,
                                _model.ratingBarValue!,
                              );
                              logFirebaseEvent('boton1_backend_call');

                              await boton1UsersRecord.reference.update({
                                ...createUsersRecordData(
                                  rating: _model.ratingBar,
                                ),
                                ...mapToFirestore(
                                  {
                                    'numberOfRating': FieldValue.increment(1),
                                  },
                                ),
                              });

                              setState(() {});
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
