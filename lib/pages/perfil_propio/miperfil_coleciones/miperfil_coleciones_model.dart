import '/backend/backend.dart';
import '/components/app_bar7_usuario/app_bar7_usuario_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar2/nav_bar2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'miperfil_coleciones_widget.dart' show MiperfilColecionesWidget;
import 'package:flutter/material.dart';

class MiperfilColecionesModel
    extends FlutterFlowModel<MiperfilColecionesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appBar7_usuario component.
  late AppBar7UsuarioModel appBar7UsuarioModel;
  // Model for navBar2 component.
  late NavBar2Model navBar2Model;
  // State field(s) for TextFieldBuscar widget.
  final textFieldBuscarKey = GlobalKey();
  FocusNode? textFieldBuscarFocusNode;
  TextEditingController? textFieldBuscarTextController;
  String? textFieldBuscarSelectedOption;
  String? Function(BuildContext, String?)?
      textFieldBuscarTextControllerValidator;
  List<CollectionsRecord> simpleSearchResults = [];
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
    textFieldBuscarFocusNode?.dispose();

    navBar1Model.dispose();
  }
}
