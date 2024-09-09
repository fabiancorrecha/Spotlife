import '/backend/backend.dart';
import '/components/menu02/menu02_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'buscar_perfil_widget.dart' show BuscarPerfilWidget;
import 'package:flutter/material.dart';

class BuscarPerfilModel extends FlutterFlowModel<BuscarPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldBuscar widget.
  FocusNode? textFieldBuscarFocusNode;
  TextEditingController? textFieldBuscarTextController;
  String? Function(BuildContext, String?)?
      textFieldBuscarTextControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Model for menu02 component.
  late Menu02Model menu02Model;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    menu02Model = createModel(context, () => Menu02Model());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    textFieldBuscarFocusNode?.dispose();
    textFieldBuscarTextController?.dispose();

    menu02Model.dispose();
    navBar1Model.dispose();
  }
}
