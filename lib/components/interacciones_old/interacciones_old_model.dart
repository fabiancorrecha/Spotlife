import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'interacciones_old_widget.dart' show InteraccionesOldWidget;
import 'package:flutter/material.dart';

class InteraccionesOldModel extends FlutterFlowModel<InteraccionesOldWidget> {
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
