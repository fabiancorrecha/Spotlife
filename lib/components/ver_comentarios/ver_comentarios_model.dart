import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'ver_comentarios_widget.dart' show VerComentariosWidget;
import 'package:flutter/material.dart';

class VerComentariosModel extends FlutterFlowModel<VerComentariosWidget> {
  ///  Local state fields for this component.

  List<PostCommentRecord> comentariosDesdeComponente = [];
  void addToComentariosDesdeComponente(PostCommentRecord item) =>
      comentariosDesdeComponente.add(item);
  void removeFromComentariosDesdeComponente(PostCommentRecord item) =>
      comentariosDesdeComponente.remove(item);
  void removeAtIndexFromComentariosDesdeComponente(int index) =>
      comentariosDesdeComponente.removeAt(index);
  void insertAtIndexInComentariosDesdeComponente(
          int index, PostCommentRecord item) =>
      comentariosDesdeComponente.insert(index, item);
  void updateComentariosDesdeComponenteAtIndex(
          int index, Function(PostCommentRecord) updateFn) =>
      comentariosDesdeComponente[index] =
          updateFn(comentariosDesdeComponente[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  Completer<List<PostCommentRecord>>? firestoreRequestCompleter;
  // State field(s) for commentField widget.
  FocusNode? commentFieldFocusNode;
  TextEditingController? commentFieldTextController;
  String? Function(BuildContext, String?)? commentFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostCommentRecord? ultimoComentario;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActividadRecord? nuevaActividad;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentFieldFocusNode?.dispose();
    commentFieldTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
