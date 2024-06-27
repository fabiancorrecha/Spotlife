import '/flutter_flow/flutter_flow_util.dart';
import 'ingresa_con_username_validacion_widget.dart'
    show IngresaConUsernameValidacionWidget;
import 'package:flutter/material.dart';

class IngresaConUsernameValidacionModel
    extends FlutterFlowModel<IngresaConUsernameValidacionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for contrasena widget.
  FocusNode? contrasenaFocusNode;
  TextEditingController? contrasenaTextController;
  late bool contrasenaVisibility;
  String? Function(BuildContext, String?)? contrasenaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    contrasenaVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    contrasenaFocusNode?.dispose();
    contrasenaTextController?.dispose();
  }
}
