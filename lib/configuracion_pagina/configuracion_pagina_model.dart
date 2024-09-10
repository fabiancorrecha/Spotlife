import '/components/boton_quinto/boton_quinto_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'configuracion_pagina_widget.dart' show ConfiguracionPaginaWidget;
import 'package:flutter/material.dart';

class ConfiguracionPaginaModel
    extends FlutterFlowModel<ConfiguracionPaginaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel1;
  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel2;
  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel3;
  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel4;
  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel5;
  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel6;
  // Model for botonQuinto component.
  late BotonQuintoModel botonQuintoModel7;

  @override
  void initState(BuildContext context) {
    botonQuintoModel1 = createModel(context, () => BotonQuintoModel());
    botonQuintoModel2 = createModel(context, () => BotonQuintoModel());
    botonQuintoModel3 = createModel(context, () => BotonQuintoModel());
    botonQuintoModel4 = createModel(context, () => BotonQuintoModel());
    botonQuintoModel5 = createModel(context, () => BotonQuintoModel());
    botonQuintoModel6 = createModel(context, () => BotonQuintoModel());
    botonQuintoModel7 = createModel(context, () => BotonQuintoModel());
  }

  @override
  void dispose() {
    botonQuintoModel1.dispose();
    botonQuintoModel2.dispose();
    botonQuintoModel3.dispose();
    botonQuintoModel4.dispose();
    botonQuintoModel5.dispose();
    botonQuintoModel6.dispose();
    botonQuintoModel7.dispose();
  }
}
