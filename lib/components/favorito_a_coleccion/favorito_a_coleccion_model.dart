import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'favorito_a_coleccion_widget.dart' show FavoritoAColeccionWidget;
import 'package:flutter/material.dart';

class FavoritoAColeccionModel
    extends FlutterFlowModel<FavoritoAColeccionWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for boton1 component.
  late Boton1Model boton1Model;

  @override
  void initState(BuildContext context) {
    boton1Model = createModel(context, () => Boton1Model());
  }

  @override
  void dispose() {
    boton1Model.dispose();
  }
}
