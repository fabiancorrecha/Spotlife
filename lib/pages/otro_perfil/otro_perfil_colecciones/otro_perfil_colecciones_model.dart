import '/backend/backend.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'otro_perfil_colecciones_widget.dart' show OtroPerfilColeccionesWidget;
import 'package:flutter/material.dart';

class OtroPerfilColeccionesModel
    extends FlutterFlowModel<OtroPerfilColeccionesWidget> {
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
