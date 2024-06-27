import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'cambio_contrasena_model.dart';
export 'cambio_contrasena_model.dart';

class CambioContrasenaWidget extends StatefulWidget {
  const CambioContrasenaWidget({super.key});

  @override
  State<CambioContrasenaWidget> createState() => _CambioContrasenaWidgetState();
}

class _CambioContrasenaWidgetState extends State<CambioContrasenaWidget> {
  late CambioContrasenaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CambioContrasenaModel());

    _model.contrasenaActualTextController ??= TextEditingController();
    _model.contrasenaActualFocusNode ??= FocusNode();

    _model.nuevaContrasenaTextController ??= TextEditingController();
    _model.nuevaContrasenaFocusNode ??= FocusNode();

    _model.confirmarContrasenaTextController ??= TextEditingController();
    _model.confirmarContrasenaFocusNode ??= FocusNode();

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
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(37.0, 24.0, 37.0, 34.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
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
                            'CAMBIO_CONTRASENA_Card_1q721tqk_ON_TAP');
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
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: FlutterFlowTheme.of(context).icono,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'psk7o6e6' /* Seguridad */,
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).displaySmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .displaySmallFamily),
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
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'h1i7g2co' /* Modificar contraseña */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).displaySmallFamily,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).displaySmallFamily),
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: TextFormField(
                  controller: _model.contrasenaActualTextController,
                  focusNode: _model.contrasenaActualFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.contrasenaActualTextController',
                    Duration(milliseconds: 200),
                    () => setState(() {}),
                  ),
                  autofocus: true,
                  obscureText: !_model.contrasenaActualVisibility,
                  decoration: InputDecoration(
                    labelStyle: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'xuxsj7ga' /* Contraseña Actual */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
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
                    fillColor: Color(0xFF333333),
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => _model.contrasenaActualVisibility =
                            !_model.contrasenaActualVisibility,
                      ),
                      focusNode: FocusNode(skipTraversal: true),
                      child: Icon(
                        _model.contrasenaActualVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 22.0,
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                  minLines: 1,
                  keyboardType: TextInputType.visiblePassword,
                  validator: _model.contrasenaActualTextControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: TextFormField(
                  controller: _model.nuevaContrasenaTextController,
                  focusNode: _model.nuevaContrasenaFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.nuevaContrasenaTextController',
                    Duration(milliseconds: 200),
                    () => setState(() {}),
                  ),
                  autofocus: true,
                  obscureText: !_model.nuevaContrasenaVisibility,
                  decoration: InputDecoration(
                    labelStyle: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'jpt371ql' /* Nueva contraseña */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
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
                    fillColor: Color(0xFF333333),
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => _model.nuevaContrasenaVisibility =
                            !_model.nuevaContrasenaVisibility,
                      ),
                      focusNode: FocusNode(skipTraversal: true),
                      child: Icon(
                        _model.nuevaContrasenaVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 22.0,
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                  minLines: 1,
                  keyboardType: TextInputType.visiblePassword,
                  validator: _model.nuevaContrasenaTextControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: TextFormField(
                  controller: _model.confirmarContrasenaTextController,
                  focusNode: _model.confirmarContrasenaFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.confirmarContrasenaTextController',
                    Duration(milliseconds: 200),
                    () => setState(() {}),
                  ),
                  autofocus: true,
                  obscureText: !_model.confirmarContrasenaVisibility,
                  decoration: InputDecoration(
                    labelStyle: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'cxche67a' /* Confirmar contraseña */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
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
                    fillColor: Color(0xFF333333),
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => _model.confirmarContrasenaVisibility =
                            !_model.confirmarContrasenaVisibility,
                      ),
                      focusNode: FocusNode(skipTraversal: true),
                      child: Icon(
                        _model.confirmarContrasenaVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 22.0,
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                  minLines: 1,
                  keyboardType: TextInputType.visiblePassword,
                  validator: _model.confirmarContrasenaTextControllerValidator
                      .asValidator(context),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('CAMBIO_CONTRASENA_CAMBIAR_CONTRASEÑA_BTN');
                  Function() _navigate = () {};
                  logFirebaseEvent('Button_validate_form');
                  if (_model.formKey.currentState == null ||
                      !_model.formKey.currentState!.validate()) {
                    return;
                  }
                  if (_model.nuevaContrasenaTextController.text ==
                      _model.confirmarContrasenaTextController.text) {
                    logFirebaseEvent('Button_custom_action');
                    _model.cambioExitoso = await actions.cambiarContrasena(
                      context,
                      _model.contrasenaActualTextController.text,
                      _model.nuevaContrasenaTextController.text,
                    );
                    if (_model.cambioExitoso!) {
                      logFirebaseEvent('Button_auth');
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      _navigate =
                          () => context.goNamedAuth('inicio', context.mounted);
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Contraseña actualizada con exito!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                          ),
                          duration: Duration(milliseconds: 1500),
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                      );
                      logFirebaseEvent('Button_update_app_state');
                      FFAppState().email = '';
                      FFAppState().contrasena = '';
                      FFAppState().recordar = false;
                      setState(() {});
                    } else {
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: Text('Error en la operacion'),
                              content: Text(
                                  'Parece que haz introducido mal tu contraseña actual'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      logFirebaseEvent('Button_clear_text_fields_pin_codes');
                      setState(() {
                        _model.contrasenaActualTextController?.clear();
                        _model.nuevaContrasenaTextController?.clear();
                        _model.confirmarContrasenaTextController?.clear();
                      });
                    }
                  } else {
                    logFirebaseEvent('Button_show_snack_bar');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Erro: las nuevas contraseñas no coincides intenta revisar tus campos ',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).error,
                          ),
                        ),
                        duration: Duration(milliseconds: 1500),
                        backgroundColor: FlutterFlowTheme.of(context).alternate,
                      ),
                    );
                  }

                  _navigate();

                  setState(() {});
                },
                text: FFLocalizations.of(context).getText(
                  '99qh01yl' /* Cambiar contraseña */,
                ),
                options: FFButtonOptions(
                  width: 226.0,
                  height: 48.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
