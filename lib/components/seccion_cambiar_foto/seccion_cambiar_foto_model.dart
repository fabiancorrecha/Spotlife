import '/flutter_flow/flutter_flow_util.dart';
import 'seccion_cambiar_foto_widget.dart' show SeccionCambiarFotoWidget;
import 'package:flutter/material.dart';

class SeccionCambiarFotoModel
    extends FlutterFlowModel<SeccionCambiarFotoWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
