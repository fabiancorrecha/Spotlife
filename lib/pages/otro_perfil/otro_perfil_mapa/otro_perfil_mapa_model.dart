import '/backend/backend.dart';
import '/components/app_bar7_usuario/app_bar7_usuario_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar2/nav_bar2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'otro_perfil_mapa_widget.dart' show OtroPerfilMapaWidget;
import 'package:flutter/material.dart';

class OtroPerfilMapaModel extends FlutterFlowModel<OtroPerfilMapaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appBar7_usuario component.
  late AppBar7UsuarioModel appBar7UsuarioModel;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? readUsuario;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? refChats;
  // Model for navBar2 component.
  late NavBar2Model navBar2Model;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    appBar7UsuarioModel = createModel(context, () => AppBar7UsuarioModel());
    navBar2Model = createModel(context, () => NavBar2Model());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    appBar7UsuarioModel.dispose();
    navBar2Model.dispose();
    navBar1Model.dispose();
  }
}
