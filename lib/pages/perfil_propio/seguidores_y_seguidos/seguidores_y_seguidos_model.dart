import '/components/app_bar4/app_bar4_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/usuarios_recomendados/usuarios_recomendados_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'seguidores_y_seguidos_widget.dart' show SeguidoresYSeguidosWidget;
import 'package:flutter/material.dart';

class SeguidoresYSeguidosModel
    extends FlutterFlowModel<SeguidoresYSeguidosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar4 component.
  late AppBar4Model appBar4Model;
  // Model for usuariosRecomendados component.
  late UsuariosRecomendadosModel usuariosRecomendadosModel;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    appBar4Model = createModel(context, () => AppBar4Model());
    usuariosRecomendadosModel =
        createModel(context, () => UsuariosRecomendadosModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBar4Model.dispose();
    usuariosRecomendadosModel.dispose();
    navBar1Model.dispose();
  }
}
