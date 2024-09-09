import '/components/app_bar_post_list/app_bar_post_list_widget.dart';
import '/components/grid_posts_filtradr_por_ubicacion/grid_posts_filtradr_por_ubicacion_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'grid_post_filtrados_ubicacion_widget.dart'
    show GridPostFiltradosUbicacionWidget;
import 'package:flutter/material.dart';

class GridPostFiltradosUbicacionModel
    extends FlutterFlowModel<GridPostFiltradosUbicacionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar_postList component.
  late AppBarPostListModel appBarPostListModel;
  // Model for GridPostsFiltradrPorUbicacion component.
  late GridPostsFiltradrPorUbicacionModel gridPostsFiltradrPorUbicacionModel;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    appBarPostListModel = createModel(context, () => AppBarPostListModel());
    gridPostsFiltradrPorUbicacionModel =
        createModel(context, () => GridPostsFiltradrPorUbicacionModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    appBarPostListModel.dispose();
    gridPostsFiltradrPorUbicacionModel.dispose();
    navBar1Model.dispose();
  }
}
