import '/components/grid_posts_bio/grid_posts_bio_widget.dart';
import '/components/grid_posts_favoritos/grid_posts_favoritos_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'miperfil_detalle_coleccion_widget.dart'
    show MiperfilDetalleColeccionWidget;
import 'package:flutter/material.dart';

class MiperfilDetalleColeccionModel
    extends FlutterFlowModel<MiperfilDetalleColeccionWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> postAgregados = [];
  void addToPostAgregados(DocumentReference item) => postAgregados.add(item);
  void removeFromPostAgregados(DocumentReference item) =>
      postAgregados.remove(item);
  void removeAtIndexFromPostAgregados(int index) =>
      postAgregados.removeAt(index);
  void insertAtIndexInPostAgregados(int index, DocumentReference item) =>
      postAgregados.insert(index, item);
  void updatePostAgregadosAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      postAgregados[index] = updateFn(postAgregados[index]);

  ///  State fields for stateful widgets in this page.

  // Model for GridPostsFavoritos component.
  late GridPostsFavoritosModel gridPostsFavoritosModel;
  // Model for GridPostsBio component.
  late GridPostsBioModel gridPostsBioModel;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    gridPostsFavoritosModel =
        createModel(context, () => GridPostsFavoritosModel());
    gridPostsBioModel = createModel(context, () => GridPostsBioModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    gridPostsFavoritosModel.dispose();
    gridPostsBioModel.dispose();
    navBar1Model.dispose();
  }
}
