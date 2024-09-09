import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'restaura_contrasena_widget.dart' show RestauraContrasenaWidget;
import 'package:flutter/material.dart';

class RestauraContrasenaModel
    extends FlutterFlowModel<RestauraContrasenaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
