import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/usuarios_recomendados/usuarios_recomendados_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'seguidos_widget.dart' show SeguidosWidget;
import 'package:flutter/material.dart';

class SeguidosModel extends FlutterFlowModel<SeguidosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for usuariosRecomendados component.
  late UsuariosRecomendadosModel usuariosRecomendadosModel;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    usuariosRecomendadosModel =
        createModel(context, () => UsuariosRecomendadosModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    usuariosRecomendadosModel.dispose();
    navBar1Model.dispose();
  }
}
