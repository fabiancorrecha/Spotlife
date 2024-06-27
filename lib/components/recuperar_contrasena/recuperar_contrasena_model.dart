import '/flutter_flow/flutter_flow_util.dart';
import 'recuperar_contrasena_widget.dart' show RecuperarContrasenaWidget;
import 'package:flutter/material.dart';

class RecuperarContrasenaModel
    extends FlutterFlowModel<RecuperarContrasenaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Correoelectronico widget.
  FocusNode? correoelectronicoFocusNode;
  TextEditingController? correoelectronicoTextController;
  String? Function(BuildContext, String?)?
      correoelectronicoTextControllerValidator;
  String? _correoelectronicoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '40v5r11f' /* Este campo es obligatorio */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    correoelectronicoTextControllerValidator =
        _correoelectronicoTextControllerValidator;
  }

  @override
  void dispose() {
    correoelectronicoFocusNode?.dispose();
    correoelectronicoTextController?.dispose();
  }
}
