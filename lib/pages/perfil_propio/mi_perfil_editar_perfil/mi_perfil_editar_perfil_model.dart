import '/components/tarjeta_mi_perfil_editar/tarjeta_mi_perfil_editar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mi_perfil_editar_perfil_widget.dart' show MiPerfilEditarPerfilWidget;
import 'package:flutter/material.dart';

class MiPerfilEditarPerfilModel
    extends FlutterFlowModel<MiPerfilEditarPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for tarjetaMiPerfilEditar component.
  late TarjetaMiPerfilEditarModel tarjetaMiPerfilEditarModel;

  @override
  void initState(BuildContext context) {
    tarjetaMiPerfilEditarModel =
        createModel(context, () => TarjetaMiPerfilEditarModel());
  }

  @override
  void dispose() {
    tarjetaMiPerfilEditarModel.dispose();
  }
}
