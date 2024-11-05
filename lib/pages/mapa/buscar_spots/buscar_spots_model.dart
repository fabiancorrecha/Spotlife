import '/backend/backend.dart';
import '/components/menu02/menu02_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'buscar_spots_widget.dart' show BuscarSpotsWidget;
import 'package:flutter/material.dart';

class BuscarSpotsModel extends FlutterFlowModel<BuscarSpotsWidget> {
  ///  Local state fields for this page.

  bool verLista = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldBuscar widget.
  FocusNode? textFieldBuscarFocusNode;
  TextEditingController? textFieldBuscarTextController;
  String? Function(BuildContext, String?)?
      textFieldBuscarTextControllerValidator;
  List<UserPostsRecord> simpleSearchResults = [];
  // Model for menu02 component.
  late Menu02Model menu02Model;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
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
