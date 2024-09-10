import '/components/app_bar4/app_bar4_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cuentas_bloqueadas_widget.dart' show CuentasBloqueadasWidget;
import 'package:flutter/material.dart';

class CuentasBloqueadasModel extends FlutterFlowModel<CuentasBloqueadasWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appBar4 component.
  late AppBar4Model appBar4Model;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    appBar4Model = createModel(context, () => AppBar4Model());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    appBar4Model.dispose();
    navBar1Model.dispose();
  }
}
