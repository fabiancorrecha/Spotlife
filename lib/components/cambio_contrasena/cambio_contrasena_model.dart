import '/flutter_flow/flutter_flow_util.dart';
import 'cambio_contrasena_widget.dart' show CambioContrasenaWidget;
import 'package:flutter/material.dart';

class CambioContrasenaModel extends FlutterFlowModel<CambioContrasenaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for contrasenaActual widget.
  FocusNode? contrasenaActualFocusNode;
  TextEditingController? contrasenaActualTextController;
  late bool contrasenaActualVisibility;
  String? Function(BuildContext, String?)?
      contrasenaActualTextControllerValidator;
  String? _contrasenaActualTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qpfawxrw' /* Este campo es obligatorio */,
      );
    }

    return null;
  }

  // State field(s) for NuevaContrasena widget.
  FocusNode? nuevaContrasenaFocusNode;
  TextEditingController? nuevaContrasenaTextController;
  late bool nuevaContrasenaVisibility;
  String? Function(BuildContext, String?)?
      nuevaContrasenaTextControllerValidator;
  String? _nuevaContrasenaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'roj5q1d4' /* Este campo es obligatorio */,
      );
    }

    return null;
  }

  // State field(s) for ConfirmarContrasena widget.
  FocusNode? confirmarContrasenaFocusNode;
  TextEditingController? confirmarContrasenaTextController;
  late bool confirmarContrasenaVisibility;
  String? Function(BuildContext, String?)?
      confirmarContrasenaTextControllerValidator;
  String? _confirmarContrasenaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ciu31af6' /* Este campo es obligatorio */,
      );
    }

    return null;
  }

  // Stores action output result for [Custom Action - cambiarContrasena] action in Button widget.
  bool? cambioExitoso;

  @override
  void initState(BuildContext context) {
    contrasenaActualVisibility = false;
    contrasenaActualTextControllerValidator =
        _contrasenaActualTextControllerValidator;
    nuevaContrasenaVisibility = false;
    nuevaContrasenaTextControllerValidator =
        _nuevaContrasenaTextControllerValidator;
    confirmarContrasenaVisibility = false;
    confirmarContrasenaTextControllerValidator =
        _confirmarContrasenaTextControllerValidator;
  }

  @override
  void dispose() {
    contrasenaActualFocusNode?.dispose();
    contrasenaActualTextController?.dispose();

    nuevaContrasenaFocusNode?.dispose();
    nuevaContrasenaTextController?.dispose();

    confirmarContrasenaFocusNode?.dispose();
    confirmarContrasenaTextController?.dispose();
  }
}
