import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_desing_widget.dart' show PostDesingWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class PostDesingModel extends FlutterFlowModel<PostDesingWidget> {
  ///  Local state fields for this component.

  bool header = false;

  bool? botonSend = false;

  bool? like = false;

  bool? favorite = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageViewOnlyListImage widget.
  PageController? pageViewOnlyListImageController;

  int get pageViewOnlyListImageCurrentIndex =>
      pageViewOnlyListImageController != null &&
              pageViewOnlyListImageController!.hasClients &&
              pageViewOnlyListImageController!.page != null
          ? pageViewOnlyListImageController!.page!.round()
          : 0;
  // State field(s) for PageViewVideoAndImage widget.
  PageController? pageViewVideoAndImageController;

  int get pageViewVideoAndImageCurrentIndex =>
      pageViewVideoAndImageController != null &&
              pageViewVideoAndImageController!.hasClients &&
              pageViewVideoAndImageController!.page != null
          ? pageViewVideoAndImageController!.page!.round()
          : 0;
  // Stores action output result for [Backend Call - Create Document] action in ToggleIcon widget.
  ActividadRecord? actividad;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for TextFieldComentarios widget.
  FocusNode? textFieldComentariosFocusNode;
  TextEditingController? textFieldComentariosTextController;
  String? Function(BuildContext, String?)?
      textFieldComentariosTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  PostCommentRecord? ultimoComentario;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ActividadRecord? nuevaActividad;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
    textFieldComentariosFocusNode?.dispose();
    textFieldComentariosTextController?.dispose();
  }
}
