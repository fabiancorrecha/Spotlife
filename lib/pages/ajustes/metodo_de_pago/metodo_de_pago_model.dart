import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'metodo_de_pago_widget.dart' show MetodoDePagoWidget;
import 'package:flutter/material.dart';

class MetodoDePagoModel extends FlutterFlowModel<MetodoDePagoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for boton5.
  late BotonQuintoModel boton5Model;

  @override
  void initState(BuildContext context) {
    boton5Model = createModel(context, () => BotonQuintoModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    boton5Model.dispose();
  }
}
