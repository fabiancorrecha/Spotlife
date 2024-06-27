import '/components/notificacion_box/notificacion_box_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'menu_post_ajeno_widget.dart' show MenuPostAjenoWidget;
import 'package:flutter/material.dart';

class MenuPostAjenoModel extends FlutterFlowModel<MenuPostAjenoWidget> {
  ///  State fields for stateful widgets in this component.

  String currentPageLink = '';
  // Model for notificacione.
  late NotificacionBoxModel notificacioneModel;

  @override
  void initState(BuildContext context) {
    notificacioneModel = createModel(context, () => NotificacionBoxModel());
  }

  @override
  void dispose() {
    notificacioneModel.dispose();
  }
}
