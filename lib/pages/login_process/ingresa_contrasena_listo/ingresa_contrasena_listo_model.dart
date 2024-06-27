import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ingresa_contrasena_listo_widget.dart' show IngresaContrasenaListoWidget;
import 'package:flutter/material.dart';

class IngresaContrasenaListoModel
    extends FlutterFlowModel<IngresaContrasenaListoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for boton1 component.
  late Boton1Model boton1Model;

  @override
  void initState(BuildContext context) {
    boton1Model = createModel(context, () => Boton1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    boton1Model.dispose();
  }
}
