import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'crea_cuenta_correo_widget.dart' show CreaCuentaCorreoWidget;
import 'package:flutter/material.dart';

class CreaCuentaCorreoModel extends FlutterFlowModel<CreaCuentaCorreoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;
  // State field(s) for Cotrasena widget.
  FocusNode? cotrasenaFocusNode;
  TextEditingController? cotrasenaTextController;
  late bool cotrasenaVisibility;
  String? Function(BuildContext, String?)? cotrasenaTextControllerValidator;
  // Model for boton1 component.
  late Boton1Model boton1Model;

  @override
  void initState(BuildContext context) {
    cotrasenaVisibility = false;
    boton1Model = createModel(context, () => Boton1Model());
  }

  @override
  void dispose() {
    correoFocusNode?.dispose();
    correoTextController?.dispose();

    cotrasenaFocusNode?.dispose();
    cotrasenaTextController?.dispose();

    boton1Model.dispose();
  }
}
