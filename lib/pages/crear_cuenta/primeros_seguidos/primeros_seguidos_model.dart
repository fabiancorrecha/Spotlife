import '/components/boton1/boton1_widget.dart';
import '/components/usuarios_recomendados/usuarios_recomendados_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'primeros_seguidos_widget.dart' show PrimerosSeguidosWidget;
import 'package:flutter/material.dart';

class PrimerosSeguidosModel extends FlutterFlowModel<PrimerosSeguidosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for usuariosRecomendados component.
  late UsuariosRecomendadosModel usuariosRecomendadosModel;
  // Model for boton1 component.
  late Boton1Model boton1Model;

  @override
  void initState(BuildContext context) {
    usuariosRecomendadosModel =
        createModel(context, () => UsuariosRecomendadosModel());
    boton1Model = createModel(context, () => Boton1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    usuariosRecomendadosModel.dispose();
    boton1Model.dispose();
  }
}
