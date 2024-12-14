import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'etiquetar_usuarios_widget.dart' show EtiquetarUsuariosWidget;
import 'package:flutter/material.dart';

class EtiquetarUsuariosModel extends FlutterFlowModel<EtiquetarUsuariosWidget> {
  ///  Local state fields for this component.

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

  ///  State fields for stateful widgets in this component.

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
