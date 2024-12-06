import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'crear_post_widget.dart' show CrearPostWidget;
import 'package:flutter/material.dart';

class CrearPostModel extends FlutterFlowModel<CrearPostWidget> {
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

  bool varPublico = true;

  bool varAmigos = false;

  bool varPrivado = false;

  PlaceInfoStruct? direccion;
  void updateDireccionStruct(Function(PlaceInfoStruct) updateFn) {
    updateFn(direccion ??= PlaceInfoStruct());
  }

  bool? editarDireccion = false;

  List<DocumentReference> users = [];
  void addToUsers(DocumentReference item) => users.add(item);
  void removeFromUsers(DocumentReference item) => users.remove(item);
  void removeAtIndexFromUsers(int index) => users.removeAt(index);
  void insertAtIndexInUsers(int index, DocumentReference item) =>
      users.insert(index, item);
  void updateUsersAtIndex(int index, Function(DocumentReference) updateFn) =>
      users[index] = updateFn(users[index]);

  LatLng? coordenadas;

  bool filtro = false;

  List<String> imagenes = [];
  void addToImagenes(String item) => imagenes.add(item);
  void removeFromImagenes(String item) => imagenes.remove(item);
  void removeAtIndexFromImagenes(int index) => imagenes.removeAt(index);
  void insertAtIndexInImagenes(int index, String item) =>
      imagenes.insert(index, item);
  void updateImagenesAtIndex(int index, Function(String) updateFn) =>
      imagenes[index] = updateFn(imagenes[index]);

  String? video;

  String? titulo;

  String? descripcion;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];
  List<String> uploadedFileUrls1 = [];

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;
  String? _tituloTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yxsxn8rn' /* Este campo es obligatorio */,
      );
    }

    if (val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd5a9q2ac' /* Tu titulo debe tener minimo */,
      );
    }

    return null;
  }

  // State field(s) for Descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
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
