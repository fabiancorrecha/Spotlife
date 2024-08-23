import '/components/boton_add/boton_add_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar2/nav_bar2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'miperfil_mapa_widget.dart' show MiperfilMapaWidget;
import 'package:flutter/material.dart';

class MiperfilMapaModel extends FlutterFlowModel<MiperfilMapaWidget> {
  ///  Local state fields for this page.

  double? latitud = 18.4629353;

  double? longitud = 69.8239909;

  ///  State fields for stateful widgets in this page.

  // Model for navBar2 component.
  late NavBar2Model navBar2Model;
  // Model for botonAdd component.
  late BotonAddModel botonAddModel;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBar2Model = createModel(context, () => NavBar2Model());
    botonAddModel = createModel(context, () => BotonAddModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    navBar2Model.dispose();
    botonAddModel.dispose();
    navBar1Model.dispose();
  }
}
