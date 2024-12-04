import '/backend/api_requests/api_calls.dart';
import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reset_pass_widget.dart' show ResetPassWidget;
import 'package:flutter/material.dart';

class ResetPassModel extends FlutterFlowModel<ResetPassWidget> {
  ///  Local state fields for this page.

  String? pagelink;

  ///  State fields for stateful widgets in this page.

  // State field(s) for nuevaconstrasea widget.
  FocusNode? nuevaconstraseaFocusNode;
  TextEditingController? nuevaconstraseaTextController;
  late bool nuevaconstraseaVisibility;
  String? Function(BuildContext, String?)?
      nuevaconstraseaTextControllerValidator;
  // State field(s) for ConfirmaNuevaConstrasea widget.
  FocusNode? confirmaNuevaConstraseaFocusNode;
  TextEditingController? confirmaNuevaConstraseaTextController;
  late bool confirmaNuevaConstraseaVisibility;
  String? Function(BuildContext, String?)?
      confirmaNuevaConstraseaTextControllerValidator;
  // Model for boton1 component.
  late Boton1Model boton1Model;
  // Stores action output result for [Backend Call - API (resetPassword)] action in boton1 widget.
  ApiCallResponse? apiResultz1k;

  @override
  void initState(BuildContext context) {
    nuevaconstraseaVisibility = false;
    confirmaNuevaConstraseaVisibility = false;
    boton1Model = createModel(context, () => Boton1Model());
  }

  @override
  void dispose() {
    nuevaconstraseaFocusNode?.dispose();
    nuevaconstraseaTextController?.dispose();

    confirmaNuevaConstraseaFocusNode?.dispose();
    confirmaNuevaConstraseaTextController?.dispose();

    boton1Model.dispose();
  }
}
