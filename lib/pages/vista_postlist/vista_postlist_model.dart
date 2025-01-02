import '/backend/backend.dart';
import '/components/app_bar4/app_bar4_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'vista_postlist_widget.dart' show VistaPostlistWidget;
import 'package:flutter/material.dart';

class VistaPostlistModel extends FlutterFlowModel<VistaPostlistWidget> {
  ///  Local state fields for this page.

  bool? verDescripcionHeader = false;

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

  bool? verFavortio = false;

  int? contar = 0;

  bool? verMeGusta = false;

  ///  State fields for stateful widgets in this page.

  // Model for appBar4 component.
  late AppBar4Model appBar4Model;

  @override
  void initState(BuildContext context) {
    appBar4Model = createModel(context, () => AppBar4Model());
  }

  @override
  void dispose() {
    appBar4Model.dispose();
  }
}
