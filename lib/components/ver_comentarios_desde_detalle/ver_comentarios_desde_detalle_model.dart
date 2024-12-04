import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'ver_comentarios_desde_detalle_widget.dart'
    show VerComentariosDesdeDetalleWidget;
import 'package:flutter/material.dart';

class VerComentariosDesdeDetalleModel
    extends FlutterFlowModel<VerComentariosDesdeDetalleWidget> {
  ///  Local state fields for this component.

  List<PostCommentRecord> verComentariosDesdeComponente = [];
  void addToVerComentariosDesdeComponente(PostCommentRecord item) =>
      verComentariosDesdeComponente.add(item);
  void removeFromVerComentariosDesdeComponente(PostCommentRecord item) =>
      verComentariosDesdeComponente.remove(item);
  void removeAtIndexFromVerComentariosDesdeComponente(int index) =>
      verComentariosDesdeComponente.removeAt(index);
  void insertAtIndexInVerComentariosDesdeComponente(
          int index, PostCommentRecord item) =>
      verComentariosDesdeComponente.insert(index, item);
  void updateVerComentariosDesdeComponenteAtIndex(
          int index, Function(PostCommentRecord) updateFn) =>
      verComentariosDesdeComponente[index] =
          updateFn(verComentariosDesdeComponente[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  Completer<List<PostCommentRecord>>? firestoreRequestCompleter;
  // State field(s) for commentField widget.
  FocusNode? commentFieldFocusNode;
  TextEditingController? commentFieldTextController;
  String? Function(BuildContext, String?)? commentFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostCommentRecord? nuevoComentario;

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
