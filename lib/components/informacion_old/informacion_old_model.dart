import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'informacion_old_widget.dart' show InformacionOldWidget;
import 'package:flutter/material.dart';

class InformacionOldModel extends FlutterFlowModel<InformacionOldWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel1;
  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel2;
  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel3;

  @override
  void initState(BuildContext context) {
    botonQuintoModel1 = createModel(context, () => BotonQuintoModel());
    botonQuintoModel2 = createModel(context, () => BotonQuintoModel());
    botonQuintoModel3 = createModel(context, () => BotonQuintoModel());
  }

  @override
  void dispose() {
    botonQuintoModel1.dispose();
    botonQuintoModel2.dispose();
    botonQuintoModel3.dispose();
  }
}
