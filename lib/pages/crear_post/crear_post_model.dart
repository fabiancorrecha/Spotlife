import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'crear_post_widget.dart' show CrearPostWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
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

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? crearPostController;
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserPostsRecord? refPost;
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];
  List<String> uploadedFileUrls1 = [];

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for tituloColeccion widget.
  FocusNode? tituloColeccionFocusNode;
  TextEditingController? tituloColeccionTextController;
  String? Function(BuildContext, String?)?
      tituloColeccionTextControllerValidator;
  String? _tituloColeccionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0434z4c2' /* El título es requerido */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for DescripcionColeccion widget.
  FocusNode? descripcionColeccionFocusNode;
  TextEditingController? descripcionColeccionTextController;
  String? Function(BuildContext, String?)?
      descripcionColeccionTextControllerValidator;
  // Stores action output result for [Backend Call - API (Google Maps Location Converter)] action in IconButton widget.
  ApiCallResponse? apiResulth5l;
  // State field(s) for editarUbicacion widget.
  final editarUbicacionKey = GlobalKey();
  FocusNode? editarUbicacionFocusNode;
  TextEditingController? editarUbicacionTextController;
  String? editarUbicacionSelectedOption;
  String? Function(BuildContext, String?)?
      editarUbicacionTextControllerValidator;
  // Stores action output result for [Backend Call - API (Google Place)] action in editarUbicacion widget.
  ApiCallResponse? apiResultpbi;
  // State field(s) for CheckboxPublico widget.
  bool? checkboxPublicoValue1;
  // State field(s) for CheckboxPrivado widget.
  bool? checkboxPrivadoValue;
  // State field(s) for CheckboxPublico widget.
  Map<CollectionsRecord, bool> checkboxPublicoValueMap2 = {};
  List<CollectionsRecord> get checkboxPublicoCheckedItems2 =>
      checkboxPublicoValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;

  @override
  void initState(BuildContext context) {
    tituloColeccionTextControllerValidator =
        _tituloColeccionTextControllerValidator;
  }

  @override
  void dispose() {
    crearPostController?.finish();
    tituloColeccionFocusNode?.dispose();
    tituloColeccionTextController?.dispose();

    descripcionColeccionFocusNode?.dispose();
    descripcionColeccionTextController?.dispose();

    editarUbicacionFocusNode?.dispose();
  }
}
