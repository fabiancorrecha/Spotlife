import '/components/boton3/boton3_widget.dart';
import '/components/boton4/boton4_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ajustes_usuario_principal_widget.dart'
    show AjustesUsuarioPrincipalWidget;
import 'package:flutter/material.dart';

class AjustesUsuarioPrincipalModel
    extends FlutterFlowModel<AjustesUsuarioPrincipalWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for boton3 component.
  late Boton3Model boton3Model1;
  // Model for boton3 component.
  late Boton3Model boton3Model2;
  // Model for boton3 component.
  late Boton3Model boton3Model3;
  // Model for boton3 component.
  late Boton3Model boton3Model4;
  // Model for boton4 component.
  late Boton4Model boton4Model1;
  // Model for boton4 component.
  late Boton4Model boton4Model2;

  @override
  void initState(BuildContext context) {
    boton3Model1 = createModel(context, () => Boton3Model());
    boton3Model2 = createModel(context, () => Boton3Model());
    boton3Model3 = createModel(context, () => Boton3Model());
    boton3Model4 = createModel(context, () => Boton3Model());
    boton4Model1 = createModel(context, () => Boton4Model());
    boton4Model2 = createModel(context, () => Boton4Model());
  }

  @override
  void dispose() {
    boton3Model1.dispose();
    boton3Model2.dispose();
    boton3Model3.dispose();
    boton3Model4.dispose();
    boton4Model1.dispose();
    boton4Model2.dispose();
  }
}
