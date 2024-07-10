import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_coleccion_widget.dart' show EditarColeccionWidget;
import 'package:flutter/material.dart';

class EditarColeccionModel extends FlutterFlowModel<EditarColeccionWidget> {
  ///  Local state fields for this page.

  bool varPublico = true;

  bool varAmigos = false;

  bool varPrivado = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for tituloColeccion widget.
  FocusNode? tituloColeccionFocusNode;
  TextEditingController? tituloColeccionTextController;
  String? Function(BuildContext, String?)?
      tituloColeccionTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for DescripcionColeccion widget.
  FocusNode? descripcionColeccionFocusNode;
  TextEditingController? descripcionColeccionTextController;
  String? Function(BuildContext, String?)?
      descripcionColeccionTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // Model for boton1 component.
  late Boton1Model boton1Model;

  @override
  void initState(BuildContext context) {
    boton1Model = createModel(context, () => Boton1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tituloColeccionFocusNode?.dispose();
    tituloColeccionTextController?.dispose();

    descripcionColeccionFocusNode?.dispose();
    descripcionColeccionTextController?.dispose();

    boton1Model.dispose();
  }
}
