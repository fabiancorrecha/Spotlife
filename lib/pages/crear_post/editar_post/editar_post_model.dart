import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_post_widget.dart' show EditarPostWidget;
import 'package:flutter/material.dart';

class EditarPostModel extends FlutterFlowModel<EditarPostWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> listaColeccionesSeleccionadas = [];
  void addToListaColeccionesSeleccionadas(DocumentReference item) =>
      listaColeccionesSeleccionadas.add(item);
  void removeFromListaColeccionesSeleccionadas(DocumentReference item) =>
      listaColeccionesSeleccionadas.remove(item);
  void removeAtIndexFromListaColeccionesSeleccionadas(int index) =>
      listaColeccionesSeleccionadas.removeAt(index);
  void insertAtIndexInListaColeccionesSeleccionadas(
          int index, DocumentReference item) =>
      listaColeccionesSeleccionadas.insert(index, item);
  void updateListaColeccionesSeleccionadasAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listaColeccionesSeleccionadas[index] =
          updateFn(listaColeccionesSeleccionadas[index]);

  String? video;

  List<String> imageList = [];
  void addToImageList(String item) => imageList.add(item);
  void removeFromImageList(String item) => imageList.remove(item);
  void removeAtIndexFromImageList(int index) => imageList.removeAt(index);
  void insertAtIndexInImageList(int index, String item) =>
      imageList.insert(index, item);
  void updateImageListAtIndex(int index, Function(String) updateFn) =>
      imageList[index] = updateFn(imageList[index]);

  bool selectedMedia = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in EditarPost widget.
  UserPostsRecord? readPostUser;
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];
  List<String> uploadedFileUrls1 = [];

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;
  String? _tituloTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0yfu6kmm' /* Este campo es obligatorio */,
      );
    }

    if (val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xgt7dsq9' /* Tu titulo debe tener minimo */,
      );
    }

    return null;
  }

  // State field(s) for Descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  // State field(s) for UbicacionActual widget.
  bool? ubicacionActualValue;
  // State field(s) for Publico widget.
  bool? publicoValue;
  // State field(s) for MejoresAmigos widget.
  bool? mejoresAmigosValue;
  // State field(s) for SoloYo widget.
  bool? soloYoValue;
  // State field(s) for CheckboxPublico widget.
  Map<CollectionsRecord, bool> checkboxPublicoValueMap = {};
  List<CollectionsRecord> get checkboxPublicoCheckedItems =>
      checkboxPublicoValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for Switch widget.
  bool? switchValue5;
  // State field(s) for Switch widget.
  bool? switchValue6;
  // Stores action output result for [Backend Call - API (Google Maps Location Converter)] action in Button widget.
  ApiCallResponse? requestApi;
  // Stores action output result for [Backend Call - API (Google Maps Location Converter)] action in Button widget.
  ApiCallResponse? requestApiImagen;

  @override
  void initState(BuildContext context) {
    tituloTextControllerValidator = _tituloTextControllerValidator;
  }

  @override
  void dispose() {
    tituloFocusNode?.dispose();
    tituloTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();
  }
}
