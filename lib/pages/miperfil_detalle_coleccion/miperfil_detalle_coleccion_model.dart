import '/components/app_bar5/app_bar5_widget.dart';
import '/components/grid_posts_bio/grid_posts_bio_widget.dart';
import '/components/grid_posts_favoritos/grid_posts_favoritos_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'miperfil_detalle_coleccion_widget.dart'
    show MiperfilDetalleColeccionWidget;
import 'package:flutter/material.dart';

class MiperfilDetalleColeccionModel
    extends FlutterFlowModel<MiperfilDetalleColeccionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar5 component.
  late AppBar5Model appBar5Model;
  // Model for GridPostsFavoritos component.
  late GridPostsFavoritosModel gridPostsFavoritosModel;
  // Model for GridPostsBio component.
  late GridPostsBioModel gridPostsBioModel;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    appBar5Model = createModel(context, () => AppBar5Model());
    gridPostsFavoritosModel =
        createModel(context, () => GridPostsFavoritosModel());
    gridPostsBioModel = createModel(context, () => GridPostsBioModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBar5Model.dispose();
    gridPostsFavoritosModel.dispose();
    gridPostsBioModel.dispose();
    navBar1Model.dispose();
  }
}
