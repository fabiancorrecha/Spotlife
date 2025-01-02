import '/components/app_bar4/app_bar4_widget.dart';
import '/components/post_desing_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detalle_post_widget.dart' show DetallePostWidget;
import 'package:flutter/material.dart';

class DetallePostModel extends FlutterFlowModel<DetallePostWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appBar4 component.
  late AppBar4Model appBar4Model;
  // Model for PostDesing component.
  late PostDesingModel postDesingModel;

  @override
  void initState(BuildContext context) {
    appBar4Model = createModel(context, () => AppBar4Model());
    postDesingModel = createModel(context, () => PostDesingModel());
  }

  @override
  void dispose() {
    appBar4Model.dispose();
    postDesingModel.dispose();
  }
}
