import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post_grid_mapa_global/post_grid_mapa_global_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mapa_post_widget.dart' show MapaPostWidget;
import 'package:flutter/material.dart';

class MapaPostModel extends FlutterFlowModel<MapaPostWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldBuscar widget.
  FocusNode? textFieldBuscarFocusNode;
  TextEditingController? textFieldBuscarTextController;
  String? Function(BuildContext, String?)?
      textFieldBuscarTextControllerValidator;
  // Model for postGridMapaGlobal component.
  late PostGridMapaGlobalModel postGridMapaGlobalModel;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    postGridMapaGlobalModel =
        createModel(context, () => PostGridMapaGlobalModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    textFieldBuscarFocusNode?.dispose();
    textFieldBuscarTextController?.dispose();

    postGridMapaGlobalModel.dispose();
    navBar1Model.dispose();
  }
}
