import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'etiquetar_ubicacion_widget.dart' show EtiquetarUbicacionWidget;
import 'package:flutter/material.dart';

class EtiquetarUbicacionModel
    extends FlutterFlowModel<EtiquetarUbicacionWidget> {
  ///  Local state fields for this page.

  PlaceInfoStruct? ubicacion;
  void updateUbicacionStruct(Function(PlaceInfoStruct) updateFn) {
    updateFn(ubicacion ??= PlaceInfoStruct());
  }

  bool isUbication = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for editarUbicacion widget.
  FocusNode? editarUbicacionFocusNode;
  TextEditingController? editarUbicacionTextController;
  String? Function(BuildContext, String?)?
      editarUbicacionTextControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    editarUbicacionFocusNode?.dispose();
    editarUbicacionTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
