import '/components/app_bar7_colecciones/app_bar7_colecciones_widget.dart';
import '/components/buscador_colecciones/buscador_colecciones_widget.dart';
import '/components/grid_colecciones/grid_colecciones_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar2/nav_bar2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'otro_perfil_colecciones_widget.dart' show OtroPerfilColeccionesWidget;
import 'package:flutter/material.dart';

class OtroPerfilColeccionesModel
    extends FlutterFlowModel<OtroPerfilColeccionesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appBar7_colecciones component.
  late AppBar7ColeccionesModel appBar7ColeccionesModel;
  // Model for navBar2 component.
  late NavBar2Model navBar2Model;
  // Model for buscadorColecciones component.
  late BuscadorColeccionesModel buscadorColeccionesModel;
  // Model for GridColecciones component.
  late GridColeccionesModel gridColeccionesModel;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    appBar7ColeccionesModel =
        createModel(context, () => AppBar7ColeccionesModel());
    navBar2Model = createModel(context, () => NavBar2Model());
    buscadorColeccionesModel =
        createModel(context, () => BuscadorColeccionesModel());
    gridColeccionesModel = createModel(context, () => GridColeccionesModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    appBar7ColeccionesModel.dispose();
    navBar2Model.dispose();
    buscadorColeccionesModel.dispose();
    gridColeccionesModel.dispose();
    navBar1Model.dispose();
  }
}
