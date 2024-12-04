import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/usuarios_recomendados/usuarios_recomendados_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'seguidores_y_seguidos_widget.dart' show SeguidoresYSeguidosWidget;
import 'package:flutter/material.dart';

class SeguidoresYSeguidosModel
    extends FlutterFlowModel<SeguidoresYSeguidosWidget> {
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
