import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar2/nav_bar2_widget.dart';
import '/components/post_grid_usuario/post_grid_usuario_widget.dart';
import '/components/tarjeta_mi_perfil/tarjeta_mi_perfil_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'perfil_propio_widget.dart' show PerfilPropioWidget;
import 'package:flutter/material.dart';

class PerfilPropioModel extends FlutterFlowModel<PerfilPropioWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? perfilPropioController;
  // Model for tarjetaMiPerfil component.
  late TarjetaMiPerfilModel tarjetaMiPerfilModel;
  // Model for navBar2 component.
  late NavBar2Model navBar2Model;
  // Model for postGridUsuario component.
  late PostGridUsuarioModel postGridUsuarioModel;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    tarjetaMiPerfilModel = createModel(context, () => TarjetaMiPerfilModel());
    navBar2Model = createModel(context, () => NavBar2Model());
    postGridUsuarioModel = createModel(context, () => PostGridUsuarioModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    perfilPropioController?.finish();
    tarjetaMiPerfilModel.dispose();
    navBar2Model.dispose();
    postGridUsuarioModel.dispose();
    navBar1Model.dispose();
  }
}
