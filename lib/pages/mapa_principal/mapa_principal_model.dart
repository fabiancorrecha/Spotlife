import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post_grid_mapa_global/post_grid_mapa_global_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mapa_principal_widget.dart' show MapaPrincipalWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class MapaPrincipalModel extends FlutterFlowModel<MapaPrincipalWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? mapaPrincipalController;
  // Model for postGridGlobal.
  late PostGridMapaGlobalModel postGridGlobalModel;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;
  // State field(s) for TextFieldBuscar widget.
  FocusNode? textFieldBuscarFocusNode;
  TextEditingController? textFieldBuscarTextController;
  String? Function(BuildContext, String?)?
      textFieldBuscarTextControllerValidator;

  @override
  void initState(BuildContext context) {
    postGridGlobalModel = createModel(context, () => PostGridMapaGlobalModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    mapaPrincipalController?.finish();
    postGridGlobalModel.dispose();
    navBar1Model.dispose();
    textFieldBuscarFocusNode?.dispose();
    textFieldBuscarTextController?.dispose();
  }
}
