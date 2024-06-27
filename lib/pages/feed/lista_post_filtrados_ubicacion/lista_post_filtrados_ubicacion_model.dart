import '/components/app_bar_post_list/app_bar_post_list_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lista_post_filtrados_ubicacion_widget.dart'
    show ListaPostFiltradosUbicacionWidget;
import 'package:flutter/material.dart';

class ListaPostFiltradosUbicacionModel
    extends FlutterFlowModel<ListaPostFiltradosUbicacionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar_postList component.
  late AppBarPostListModel appBarPostListModel;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    appBarPostListModel = createModel(context, () => AppBarPostListModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarPostListModel.dispose();
    navBar1Model.dispose();
  }
}
