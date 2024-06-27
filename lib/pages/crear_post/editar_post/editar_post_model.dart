import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'editar_post_widget.dart' show EditarPostWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for DescreipcionPost widget.
  FocusNode? descreipcionPostFocusNode;
  TextEditingController? descreipcionPostTextController;
  String? Function(BuildContext, String?)?
      descreipcionPostTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    descreipcionPostFocusNode?.dispose();
    descreipcionPostTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
