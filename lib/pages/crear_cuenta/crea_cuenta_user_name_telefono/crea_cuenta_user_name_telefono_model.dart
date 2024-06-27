import '/components/boton1/boton1_widget.dart';
import '/components/crear_cuenta_options/crear_cuenta_options_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'crea_cuenta_user_name_telefono_widget.dart'
    show CreaCuentaUserNameTelefonoWidget;
import 'package:flutter/material.dart';

class CreaCuentaUserNameTelefonoModel
    extends FlutterFlowModel<CreaCuentaUserNameTelefonoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qim1eg6s' /* Rellena este campo */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        '4r8aobuz' /* Debes usar al menos 6 caracter... */,
      );
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '2sz1hnou' /* Debe iniciar con una letra y s... */,
      );
    }
    return null;
  }

  // State field(s) for CheckboxTOS widget.
  bool? checkboxTOSValue;
  // Model for boton1 component.
  late Boton1Model boton1Model;
  // Model for crearCuentaOptions component.
  late CrearCuentaOptionsModel crearCuentaOptionsModel;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
    boton1Model = createModel(context, () => Boton1Model());
    crearCuentaOptionsModel =
        createModel(context, () => CrearCuentaOptionsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    boton1Model.dispose();
    crearCuentaOptionsModel.dispose();
  }
}
