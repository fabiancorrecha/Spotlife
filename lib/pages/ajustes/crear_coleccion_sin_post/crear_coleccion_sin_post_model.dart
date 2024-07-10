import '/backend/backend.dart';
import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'crear_coleccion_sin_post_widget.dart' show CrearColeccionSinPostWidget;
import 'package:flutter/material.dart';

class CrearColeccionSinPostModel
    extends FlutterFlowModel<CrearColeccionSinPostWidget> {
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
  // State field(s) for SwitchListTileTipoColeccion widget.
  bool? switchListTileTipoColeccionValue;
  // Model for boton1 component.
  late Boton1Model boton1Model;
  // Stores action output result for [Backend Call - Create Document] action in boton1 widget.
  CollectionsRecord? nuevaColeccion;

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
