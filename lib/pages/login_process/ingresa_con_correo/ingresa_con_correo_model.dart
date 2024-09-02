import '/components/boton1/boton1_widget.dart';
import '/components/login_options/login_options_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ingresa_con_correo_widget.dart' show IngresaConCorreoWidget;
import 'package:flutter/material.dart';

class IngresaConCorreoModel extends FlutterFlowModel<IngresaConCorreoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tfco2jvi' /* Este campo es requerido */,
      );
    }

    return null;
  }

  // State field(s) for contrasena widget.
  FocusNode? contrasenaFocusNode;
  TextEditingController? contrasenaTextController;
  late bool contrasenaVisibility;
  String? Function(BuildContext, String?)? contrasenaTextControllerValidator;
  String? _contrasenaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'c4qaxj91' /* Este campo es requerido */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        's1ospdd1' /* Mínimo 6 caracteres en contras... */,
      );
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Model for boton1 component.
  late Boton1Model boton1Model;
  // Model for loginOptions component.
  late LoginOptionsModel loginOptionsModel;

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
    contrasenaVisibility = false;
    contrasenaTextControllerValidator = _contrasenaTextControllerValidator;
    boton1Model = createModel(context, () => Boton1Model());
    loginOptionsModel = createModel(context, () => LoginOptionsModel());
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    contrasenaFocusNode?.dispose();
    contrasenaTextController?.dispose();

    boton1Model.dispose();
    loginOptionsModel.dispose();
  }
}
