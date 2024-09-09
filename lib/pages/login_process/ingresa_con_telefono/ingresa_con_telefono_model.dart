import '/components/boton1/boton1_widget.dart';
import '/components/login_options/login_options_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ingresa_con_telefono_widget.dart' show IngresaConTelefonoWidget;
import 'package:flutter/material.dart';

class IngresaConTelefonoModel
    extends FlutterFlowModel<IngresaConTelefonoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  final textFieldKey1 = GlobalKey();
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? textFieldSelectedOption1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for boton1 component.
  late Boton1Model boton1Model;
  // Model for loginOptions component.
  late LoginOptionsModel loginOptionsModel;

  @override
  void initState(BuildContext context) {
    boton1Model = createModel(context, () => Boton1Model());
    loginOptionsModel = createModel(context, () => LoginOptionsModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    boton1Model.dispose();
    loginOptionsModel.dispose();
  }
}
