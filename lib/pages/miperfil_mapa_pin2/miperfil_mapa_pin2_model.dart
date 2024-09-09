import '/components/app_bar5/app_bar5_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'miperfil_mapa_pin2_widget.dart' show MiperfilMapaPin2Widget;
import 'package:flutter/material.dart';

class MiperfilMapaPin2Model extends FlutterFlowModel<MiperfilMapaPin2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar5 component.
  late AppBar5Model appBar5Model;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    appBar5Model = createModel(context, () => AppBar5Model());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    appBar5Model.dispose();
    navBar1Model.dispose();
  }
}
