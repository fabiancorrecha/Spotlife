import '/flutter_flow/flutter_flow_util.dart';
import 'buscador01_widget.dart' show Buscador01Widget;
import 'package:flutter/material.dart';

class Buscador01Model extends FlutterFlowModel<Buscador01Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldBuscar widget.
  FocusNode? textFieldBuscarFocusNode;
  TextEditingController? textFieldBuscarTextController;
  String? Function(BuildContext, String?)?
      textFieldBuscarTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldBuscarFocusNode?.dispose();
    textFieldBuscarTextController?.dispose();
  }
}
