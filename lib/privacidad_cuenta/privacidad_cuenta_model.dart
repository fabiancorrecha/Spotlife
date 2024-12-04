import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'privacidad_cuenta_widget.dart' show PrivacidadCuentaWidget;
import 'package:flutter/material.dart';

class PrivacidadCuentaModel extends FlutterFlowModel<PrivacidadCuentaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel1;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel2;
  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel3;
  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel4;

  @override
  void initState(BuildContext context) {
    botonQuintoModel1 = createModel(context, () => BotonQuintoModel());
    botonQuintoModel2 = createModel(context, () => BotonQuintoModel());
    botonQuintoModel3 = createModel(context, () => BotonQuintoModel());
    botonQuintoModel4 = createModel(context, () => BotonQuintoModel());
  }

  @override
  void dispose() {
    botonQuintoModel1.dispose();
    botonQuintoModel2.dispose();
    botonQuintoModel3.dispose();
    botonQuintoModel4.dispose();
  }
}
