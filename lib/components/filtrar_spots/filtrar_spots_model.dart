import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'filtrar_spots_widget.dart' show FiltrarSpotsWidget;
import 'package:flutter/material.dart';

class FiltrarSpotsModel extends FlutterFlowModel<FiltrarSpotsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Mapa widget.
  bool? mapaValue;
  // State field(s) for Spot widget.
  bool? spotValue;
  // State field(s) for SoloAmigos widget.
  bool? soloAmigosValue;
  // State field(s) for Global widget.
  bool? globalValue;
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
