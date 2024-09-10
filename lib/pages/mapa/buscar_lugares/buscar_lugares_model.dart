import '/backend/backend.dart';
import '/components/menu02/menu02_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'buscar_lugares_widget.dart' show BuscarLugaresWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class BuscarLugaresModel extends FlutterFlowModel<BuscarLugaresWidget> {
  ///  Local state fields for this page.

  bool? verLista = true;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? buscarLugaresController;
  // State field(s) for TextFieldBuscar widget.
  FocusNode? textFieldBuscarFocusNode;
  TextEditingController? textFieldBuscarTextController;
  String? Function(BuildContext, String?)?
      textFieldBuscarTextControllerValidator;
  // Algolia Search Results from action on TextFieldBuscar
  List<UserPostsRecord>? algoliaSearchResults = [];
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
    buscarLugaresController?.finish();
    textFieldBuscarFocusNode?.dispose();
    textFieldBuscarTextController?.dispose();

    menu02Model.dispose();
    navBar1Model.dispose();
  }
}
