import '/components/buscador_colecciones/buscador_colecciones_widget.dart';
import '/components/cabecera/cabecera_widget.dart';
import '/components/grid_colecciones/grid_colecciones_widget.dart';
import '/components/post_imagen_v2/post_imagen_v2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ajustes_favoritos_widget.dart' show AjustesFavoritosWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class AjustesFavoritosModel extends FlutterFlowModel<AjustesFavoritosWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? misFavoritosController;
  // Model for cabecera component.
  late CabeceraModel cabeceraModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for postImagenV2 dynamic component.
  late FlutterFlowDynamicModels<PostImagenV2Model> postImagenV2Models;
  // Model for buscadorColecciones component.
  late BuscadorColeccionesModel buscadorColeccionesModel;
  // Model for GridColecciones component.
  late GridColeccionesModel gridColeccionesModel;

  @override
  void initState(BuildContext context) {
    cabeceraModel = createModel(context, () => CabeceraModel());
    postImagenV2Models = FlutterFlowDynamicModels(() => PostImagenV2Model());
    buscadorColeccionesModel =
        createModel(context, () => BuscadorColeccionesModel());
    gridColeccionesModel = createModel(context, () => GridColeccionesModel());
  }

  @override
  void dispose() {
    misFavoritosController?.finish();
    cabeceraModel.dispose();
    tabBarController?.dispose();
    postImagenV2Models.dispose();
    buscadorColeccionesModel.dispose();
    gridColeccionesModel.dispose();
  }
}
