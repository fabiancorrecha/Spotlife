import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar_perfil_propio/nav_bar_perfil_propio_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'favoritos_widget.dart' show FavoritosWidget;
import 'package:flutter/material.dart';

class FavoritosModel extends FlutterFlowModel<FavoritosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navBarPerfilPropio component.
  late NavBarPerfilPropioModel navBarPerfilPropioModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBarPerfilPropioModel =
        createModel(context, () => NavBarPerfilPropioModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    navBarPerfilPropioModel.dispose();
    tabBarController?.dispose();
    navBar1Model.dispose();
  }
}
