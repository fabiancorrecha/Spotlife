import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post_grid_mapa_amigos/post_grid_mapa_amigos_widget.dart';
import '/components/post_grid_mapa_global/post_grid_mapa_global_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mapa_principal_copy_widget.dart' show MapaPrincipalCopyWidget;
import 'package:flutter/material.dart';

class MapaPrincipalCopyModel extends FlutterFlowModel<MapaPrincipalCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for postGridGlobal.
  late PostGridMapaGlobalModel postGridGlobalModel;
  // Model for postGridAmigos.
  late PostGridMapaAmigosModel postGridAmigosModel;
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
    postGridAmigosModel = createModel(context, () => PostGridMapaAmigosModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    postGridGlobalModel.dispose();
    postGridAmigosModel.dispose();
    navBar1Model.dispose();
    textFieldBuscarFocusNode?.dispose();
    textFieldBuscarTextController?.dispose();
  }
}
