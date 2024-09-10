import '/backend/backend.dart';
import '/components/componente_perfil_privado/componente_perfil_privado_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar2/nav_bar2_widget.dart';
import '/components/post_grid_usuario/post_grid_usuario_widget.dart';
import '/components/tarjeta_otro_perfil/tarjeta_otro_perfil_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'otro_perfil_widget.dart' show OtroPerfilWidget;
import 'package:flutter/material.dart';

class OtroPerfilModel extends FlutterFlowModel<OtroPerfilWidget> {
  ///  Local state fields for this page.

  DocumentReference? refChat;

  ///  State fields for stateful widgets in this page.

  // Model for tarjetaOtroPerfil component.
  late TarjetaOtroPerfilModel tarjetaOtroPerfilModel;
  // Stores action output result for [Backend Call - Create Document] action in SiguiendoCuentaPrivada widget.
  ActividadRecord? refNotificacion;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? refChats;
  // Model for navBar2 component.
  late NavBar2Model navBar2Model;
  // Model for postGridUsuarios.
  late PostGridUsuarioModel postGridUsuariosModel;
  // Model for componentePerfilPrivado component.
  late ComponentePerfilPrivadoModel componentePerfilPrivadoModel;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    tarjetaOtroPerfilModel =
        createModel(context, () => TarjetaOtroPerfilModel());
    navBar2Model = createModel(context, () => NavBar2Model());
    postGridUsuariosModel = createModel(context, () => PostGridUsuarioModel());
    componentePerfilPrivadoModel =
        createModel(context, () => ComponentePerfilPrivadoModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    tarjetaOtroPerfilModel.dispose();
    navBar2Model.dispose();
    postGridUsuariosModel.dispose();
    componentePerfilPrivadoModel.dispose();
    navBar1Model.dispose();
  }
}
