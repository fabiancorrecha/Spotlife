import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'etiquetar_personas_widget.dart' show EtiquetarPersonasWidget;
import 'package:flutter/material.dart';

class EtiquetarPersonasModel extends FlutterFlowModel<EtiquetarPersonasWidget> {
  ///  Local state fields for this page.

  bool? buscarPersonas = false;

  List<DocumentReference> selectedUser = [];
  void addToSelectedUser(DocumentReference item) => selectedUser.add(item);
  void removeFromSelectedUser(DocumentReference item) =>
      selectedUser.remove(item);
  void removeAtIndexFromSelectedUser(int index) => selectedUser.removeAt(index);
  void insertAtIndexInSelectedUser(int index, DocumentReference item) =>
      selectedUser.insert(index, item);
  void updateSelectedUserAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedUser[index] = updateFn(selectedUser[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for buscarusuario widget.
  FocusNode? buscarusuarioFocusNode;
  TextEditingController? buscarusuarioTextController;
  String? Function(BuildContext, String?)? buscarusuarioTextControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    buscarusuarioFocusNode?.dispose();
    buscarusuarioTextController?.dispose();
  }
}
