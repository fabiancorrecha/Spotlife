import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
