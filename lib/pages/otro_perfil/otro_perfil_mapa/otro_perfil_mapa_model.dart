import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar_perfil_ajeno/nav_bar_perfil_ajeno_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'otro_perfil_mapa_widget.dart' show OtroPerfilMapaWidget;
import 'package:flutter/material.dart';

class OtroPerfilMapaModel extends FlutterFlowModel<OtroPerfilMapaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navBarPerfilAjeno component.
  late NavBarPerfilAjenoModel navBarPerfilAjenoModel;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBarPerfilAjenoModel =
        createModel(context, () => NavBarPerfilAjenoModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    navBarPerfilAjenoModel.dispose();
    navBar1Model.dispose();
  }
}
