import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_imagen_v2_copy_widget.dart' show PostImagenV2CopyWidget;
import 'package:flutter/material.dart';

class PostImagenV2CopyModel extends FlutterFlowModel<PostImagenV2CopyWidget> {
  ///  Local state fields for this component.

  bool verMeGusta = false;

  int? contar = 0;

  bool verFavorito = false;

  List<PostCommentRecord> comentariosActuales = [];
  void addToComentariosActuales(PostCommentRecord item) =>
      comentariosActuales.add(item);
  void removeFromComentariosActuales(PostCommentRecord item) =>
      comentariosActuales.remove(item);
  void removeAtIndexFromComentariosActuales(int index) =>
      comentariosActuales.removeAt(index);
  void insertAtIndexInComentariosActuales(int index, PostCommentRecord item) =>
      comentariosActuales.insert(index, item);
  void updateComentariosActualesAtIndex(
          int index, Function(PostCommentRecord) updateFn) =>
      comentariosActuales[index] = updateFn(comentariosActuales[index]);

  bool verDescripcionHeader = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in postImagenV2Copy widget.
  List<PostCommentRecord>? obtenerComentarios1;
  String currentPageLink = '';
  // Stores action output result for [Backend Call - Create Document] action in IconNO widget.
  ActividadRecord? nuevaActividad;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<PostCommentRecord>? obtenerComentarios0;
  // Stores action output result for [Bottom Sheet - verComentariosDesdeDetalle] action in Icon widget.
  List<PostCommentRecord>? comentariosNuevosComponente;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
