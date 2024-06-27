import '/components/app_bar8/app_bar8_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post_imagen/post_imagen_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mapa_posr_recomendados_widget.dart' show MapaPosrRecomendadosWidget;
import 'package:flutter/material.dart';

class MapaPosrRecomendadosModel
    extends FlutterFlowModel<MapaPosrRecomendadosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar8 component.
  late AppBar8Model appBar8Model;
  // Model for postImagen component.
  late PostImagenModel postImagenModel1;
  // Model for postImagen component.
  late PostImagenModel postImagenModel2;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    appBar8Model = createModel(context, () => AppBar8Model());
    postImagenModel1 = createModel(context, () => PostImagenModel());
    postImagenModel2 = createModel(context, () => PostImagenModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBar8Model.dispose();
    postImagenModel1.dispose();
    postImagenModel2.dispose();
    navBar1Model.dispose();
  }
}
