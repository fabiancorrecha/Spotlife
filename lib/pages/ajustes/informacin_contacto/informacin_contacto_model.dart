import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'informacin_contacto_widget.dart' show InformacinContactoWidget;
import 'package:flutter/material.dart';

class InformacinContactoModel
    extends FlutterFlowModel<InformacinContactoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for boton5.
  late BotonQuintoModel boton5Model1;
  // Model for boton5.
  late BotonQuintoModel boton5Model2;
  // Model for boton5.
  late BotonQuintoModel boton5Model3;
  // Model for boton5.
  late BotonQuintoModel boton5Model4;

  @override
  void initState(BuildContext context) {
    boton5Model1 = createModel(context, () => BotonQuintoModel());
    boton5Model2 = createModel(context, () => BotonQuintoModel());
    boton5Model3 = createModel(context, () => BotonQuintoModel());
    boton5Model4 = createModel(context, () => BotonQuintoModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    boton5Model1.dispose();
    boton5Model2.dispose();
    boton5Model3.dispose();
    boton5Model4.dispose();
  }
}
