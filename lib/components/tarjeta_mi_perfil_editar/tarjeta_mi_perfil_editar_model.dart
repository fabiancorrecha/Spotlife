import '/flutter_flow/flutter_flow_util.dart';
import 'tarjeta_mi_perfil_editar_widget.dart' show TarjetaMiPerfilEditarWidget;
import 'package:flutter/material.dart';

class TarjetaMiPerfilEditarModel
    extends FlutterFlowModel<TarjetaMiPerfilEditarWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for nombreUsario widget.
  FocusNode? nombreUsarioFocusNode;
  TextEditingController? nombreUsarioTextController;
  String? Function(BuildContext, String?)? nombreUsarioTextControllerValidator;
  String? _nombreUsarioTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'aifi2xvk' /* Este campo es requerido */,
      );
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ok9zwr48' /* Error en el formato del campo */,
      );
    }
    return null;
  }

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for celular widget.
  FocusNode? celularFocusNode;
  TextEditingController? celularTextController;
  String? Function(BuildContext, String?)? celularTextControllerValidator;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  // State field(s) for url widget.
  FocusNode? urlFocusNode;
  TextEditingController? urlTextController;
  String? Function(BuildContext, String?)? urlTextControllerValidator;
  // State field(s) for FechadeNacimiento widget.
  FocusNode? fechadeNacimientoFocusNode;
  TextEditingController? fechadeNacimientoTextController;
  String? Function(BuildContext, String?)?
      fechadeNacimientoTextControllerValidator;
  // State field(s) for Genero widget.
  FocusNode? generoFocusNode;
  TextEditingController? generoTextController;
  String? Function(BuildContext, String?)? generoTextControllerValidator;

  @override
  void initState(BuildContext context) {
    nombreUsarioTextControllerValidator = _nombreUsarioTextControllerValidator;
  }

  @override
  void dispose() {
    nombreUsarioFocusNode?.dispose();
    nombreUsarioTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    celularFocusNode?.dispose();
    celularTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();

    urlFocusNode?.dispose();
    urlTextController?.dispose();

    fechadeNacimientoFocusNode?.dispose();
    fechadeNacimientoTextController?.dispose();

    generoFocusNode?.dispose();
    generoTextController?.dispose();
  }
}
