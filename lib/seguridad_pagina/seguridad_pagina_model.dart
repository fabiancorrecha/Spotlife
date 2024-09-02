import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'seguridad_pagina_widget.dart' show SeguridadPaginaWidget;
import 'package:flutter/material.dart';

class SeguridadPaginaModel extends FlutterFlowModel<SeguridadPaginaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel1;
  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel2;

  @override
  void initState(BuildContext context) {
    botonQuintoModel1 = createModel(context, () => BotonQuintoModel());
    botonQuintoModel2 = createModel(context, () => BotonQuintoModel());
  }

  @override
  void dispose() {
    botonQuintoModel1.dispose();
    botonQuintoModel2.dispose();
  }
}
