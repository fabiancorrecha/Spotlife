import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ajuste_mejores_amigos_widget.dart' show AjusteMejoresAmigosWidget;
import 'package:flutter/material.dart';

class AjusteMejoresAmigosModel
    extends FlutterFlowModel<AjusteMejoresAmigosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for boton5.
  late BotonQuintoModel boton5Model1;
  // Model for boton5.
  late BotonQuintoModel boton5Model2;
  // Model for boton5.
  late BotonQuintoModel boton5Model3;

  @override
  void initState(BuildContext context) {
    boton5Model1 = createModel(context, () => BotonQuintoModel());
    boton5Model2 = createModel(context, () => BotonQuintoModel());
    boton5Model3 = createModel(context, () => BotonQuintoModel());
  }

  @override
  void dispose() {
    boton5Model1.dispose();
    boton5Model2.dispose();
    boton5Model3.dispose();
  }
}
