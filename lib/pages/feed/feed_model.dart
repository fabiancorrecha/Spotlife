import '/backend/backend.dart';
import '/components/app_bar/app_bar_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/usuarios_recomendados/usuarios_recomendados_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feed_widget.dart' show FeedWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FeedModel extends FlutterFlowModel<FeedWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? feedController;
  final unfocusNode = FocusNode();
  // Model for appBar component.
  late AppBarModel appBarModel;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, UserPostsRecord>?
      listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Model for usuariosRecomendados component.
  late UsuariosRecomendadosModel usuariosRecomendadosModel;
  // Model for navBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    usuariosRecomendadosModel =
        createModel(context, () => UsuariosRecomendadosModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    feedController?.finish();
    unfocusNode.dispose();
    appBarModel.dispose();
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    usuariosRecomendadosModel.dispose();
    navBar1Model.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, UserPostsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, UserPostsRecord>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, UserPostsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryUserPostsRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
