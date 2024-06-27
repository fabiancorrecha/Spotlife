import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'buscador_colecciones_widget.dart' show BuscadorColeccionesWidget;
import 'package:flutter/material.dart';

class BuscadorColeccionesModel
    extends FlutterFlowModel<BuscadorColeccionesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldBuscar widget.
  FocusNode? textFieldBuscarFocusNode;
  TextEditingController? textFieldBuscarTextController;
  String? Function(BuildContext, String?)?
      textFieldBuscarTextControllerValidator;
  List<CollectionsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldBuscarFocusNode?.dispose();
    textFieldBuscarTextController?.dispose();
  }
}
