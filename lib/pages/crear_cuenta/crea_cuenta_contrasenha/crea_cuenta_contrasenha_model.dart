import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'crea_cuenta_contrasenha_widget.dart' show CreaCuentaContrasenhaWidget;
import 'package:flutter/material.dart';

class CreaCuentaContrasenhaModel
    extends FlutterFlowModel<CreaCuentaContrasenhaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lqfqbtan' /* Field is required */,
      );
    }

    return null;
  }

  // Model for boton1 component.
  late Boton1Model boton1Model;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    textControllerValidator = _textControllerValidator;
    boton1Model = createModel(context, () => Boton1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    boton1Model.dispose();
  }
}
