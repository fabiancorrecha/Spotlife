import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post_grid_mapa_amigos/post_grid_mapa_amigos_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mapa_amigos_widget.dart' show MapaAmigosWidget;
import 'package:flutter/material.dart';

class MapaAmigosModel extends FlutterFlowModel<MapaAmigosWidget> {
  ///  State fields for stateful widgets in this page.

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
    postGridAmigosModel = createModel(context, () => PostGridMapaAmigosModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    postGridAmigosModel.dispose();
    navBar1Model.dispose();
    textFieldBuscarFocusNode?.dispose();
    textFieldBuscarTextController?.dispose();
  }
}
