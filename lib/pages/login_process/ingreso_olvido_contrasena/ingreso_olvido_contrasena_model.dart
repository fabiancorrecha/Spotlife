import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ingreso_olvido_contrasena_widget.dart'
    show IngresoOlvidoContrasenaWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class IngresoOlvidoContrasenaModel
    extends FlutterFlowModel<IngresoOlvidoContrasenaWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? olvidarContrasenaController;
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2bygbncj' /* Este campo es requerido */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '852wc2kk' /* Corrije el campo de correo ele... */,
      );
    }
    return null;
  }

  // Model for boton1 component.
  late Boton1Model boton1Model;

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
    boton1Model = createModel(context, () => Boton1Model());
  }

  @override
  void dispose() {
    olvidarContrasenaController?.finish();
    textFieldFocusNode?.dispose();
    emailTextController?.dispose();

    boton1Model.dispose();
  }
}
