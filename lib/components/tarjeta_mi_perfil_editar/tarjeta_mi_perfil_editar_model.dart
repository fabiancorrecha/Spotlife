import '/flutter_flow/flutter_flow_util.dart';
import 'tarjeta_mi_perfil_editar_widget.dart' show TarjetaMiPerfilEditarWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TarjetaMiPerfilEditarModel
    extends FlutterFlowModel<TarjetaMiPerfilEditarWidget> {
  ///  Local state fields for this component.

  bool verMensaje = false;

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
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for celular widget.
  FocusNode? celularFocusNode;
  TextEditingController? celularTextController;
  String? Function(BuildContext, String?)? celularTextControllerValidator;
  // State field(s) for url widget.
  FocusNode? urlFocusNode;
  TextEditingController? urlTextController;
  String? Function(BuildContext, String?)? urlTextControllerValidator;
  // State field(s) for fechaNacimiento widget.
  FocusNode? fechaNacimientoFocusNode;
  TextEditingController? fechaNacimientoTextController;
  final fechaNacimientoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      fechaNacimientoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombreUsarioFocusNode?.dispose();
    nombreUsarioTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    celularFocusNode?.dispose();
    celularTextController?.dispose();

    urlFocusNode?.dispose();
    urlTextController?.dispose();

    fechaNacimientoFocusNode?.dispose();
    fechaNacimientoTextController?.dispose();
  }
}
