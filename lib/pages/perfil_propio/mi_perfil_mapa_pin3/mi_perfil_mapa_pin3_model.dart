import '/components/app_bar7_usuario/app_bar7_usuario_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post_imagen/post_imagen_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mi_perfil_mapa_pin3_widget.dart' show MiPerfilMapaPin3Widget;
import 'package:flutter/material.dart';

class MiPerfilMapaPin3Model extends FlutterFlowModel<MiPerfilMapaPin3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar7_usuario component.
  late AppBar7UsuarioModel appBar7UsuarioModel;
  // Model for postImagen component.
  late PostImagenModel postImagenModel1;
  // Model for postImagen component.
  late PostImagenModel postImagenModel2;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    appBar7UsuarioModel = createModel(context, () => AppBar7UsuarioModel());
    postImagenModel1 = createModel(context, () => PostImagenModel());
    postImagenModel2 = createModel(context, () => PostImagenModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBar7UsuarioModel.dispose();
    postImagenModel1.dispose();
    postImagenModel2.dispose();
    navBar1Model.dispose();
  }
}
