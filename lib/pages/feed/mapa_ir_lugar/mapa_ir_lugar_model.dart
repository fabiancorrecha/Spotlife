import '/components/buscador01/buscador01_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mapa_ir_lugar_widget.dart' show MapaIrLugarWidget;
import 'package:flutter/material.dart';

class MapaIrLugarModel extends FlutterFlowModel<MapaIrLugarWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for buscador01 component.
  late Buscador01Model buscador01Model;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    buscador01Model = createModel(context, () => Buscador01Model());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    buscador01Model.dispose();
    navBar1Model.dispose();
  }
}
