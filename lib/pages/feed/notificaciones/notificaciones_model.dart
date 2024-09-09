import '/components/app_bar6/app_bar6_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notificaciones_widget.dart' show NotificacionesWidget;
import 'package:flutter/material.dart';

class NotificacionesModel extends FlutterFlowModel<NotificacionesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar6 component.
  late AppBar6Model appBar6Model;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    appBar6Model = createModel(context, () => AppBar6Model());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    appBar6Model.dispose();
    navBar1Model.dispose();
  }
}
