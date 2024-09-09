import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ingresa_telefono_validacion_widget.dart'
    show IngresaTelefonoValidacionWidget;
import 'package:flutter/material.dart';

class IngresaTelefonoValidacionModel
    extends FlutterFlowModel<IngresaTelefonoValidacionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Model for boton1 component.
  late Boton1Model boton1Model;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    boton1Model = createModel(context, () => Boton1Model());
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
    boton1Model.dispose();
  }
}
