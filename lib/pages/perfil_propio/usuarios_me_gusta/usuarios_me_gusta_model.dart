import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'usuarios_me_gusta_widget.dart' show UsuariosMeGustaWidget;
import 'package:flutter/material.dart';

class UsuariosMeGustaModel extends FlutterFlowModel<UsuariosMeGustaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBar1Model.dispose();
  }
}
