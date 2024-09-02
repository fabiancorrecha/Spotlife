import '/components/buscador01/buscador01_widget.dart';
import '/components/content_list02/content_list02_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mapa_filtrar_spots_widget.dart' show MapaFiltrarSpotsWidget;
import 'package:flutter/material.dart';

class MapaFiltrarSpotsModel extends FlutterFlowModel<MapaFiltrarSpotsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for buscador01 component.
  late Buscador01Model buscador01Model;
  // Model for contentList02 component.
  late ContentList02Model contentList02Model;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    buscador01Model = createModel(context, () => Buscador01Model());
    contentList02Model = createModel(context, () => ContentList02Model());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    buscador01Model.dispose();
    contentList02Model.dispose();
    navBar1Model.dispose();
  }
}
