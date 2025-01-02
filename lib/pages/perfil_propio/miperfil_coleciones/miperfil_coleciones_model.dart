import '/backend/backend.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'miperfil_coleciones_widget.dart' show MiperfilColecionesWidget;
import 'package:flutter/material.dart';

class MiperfilColecionesModel
    extends FlutterFlowModel<MiperfilColecionesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldBuscar widget.
  final textFieldBuscarKey = GlobalKey();
  FocusNode? textFieldBuscarFocusNode;
  TextEditingController? textFieldBuscarTextController;
  String? textFieldBuscarSelectedOption;
  String? Function(BuildContext, String?)?
      textFieldBuscarTextControllerValidator;
  List<CollectionsRecord> simpleSearchResults = [];
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    textFieldBuscarFocusNode?.dispose();

    navBar1Model.dispose();
  }
}
