import '/components/login_options/login_options_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mas_opciones_widget.dart' show MasOpcionesWidget;
import 'package:flutter/material.dart';

class MasOpcionesModel extends FlutterFlowModel<MasOpcionesWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for loginOptions component.
  late LoginOptionsModel loginOptionsModel;

  @override
  void initState(BuildContext context) {
    loginOptionsModel = createModel(context, () => LoginOptionsModel());
  }

  @override
  void dispose() {
    loginOptionsModel.dispose();
  }
}
