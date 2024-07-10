import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_post_list/app_bar_post_list_widget.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post_imagen_v2/post_imagen_v2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'lista_post_filtrados_ubicacion_model.dart';
export 'lista_post_filtrados_ubicacion_model.dart';

class ListaPostFiltradosUbicacionWidget extends StatefulWidget {
  const ListaPostFiltradosUbicacionWidget({
    super.key,
    this.userPost,
    int? index,
  }) : index = index ?? 0;

  final UserPostsRecord? userPost;
  final int index;

  @override
  State<ListaPostFiltradosUbicacionWidget> createState() =>
      _ListaPostFiltradosUbicacionWidgetState();
}

class _ListaPostFiltradosUbicacionWidgetState
    extends State<ListaPostFiltradosUbicacionWidget> {
  late ListaPostFiltradosUbicacionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaPostFiltradosUbicacionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'listaPostFiltradosUbicacion'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.appBarPostListModel,
                updateCallback: () => setState(() {}),
                child: AppBarPostListWidget(
                  userPost: widget.userPost,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: const BoxDecoration(),
                  child: StreamBuilder<List<UserPostsRecord>>(
                    stream: queryUserPostsRecord(
                      queryBuilder: (userPostsRecord) => userPostsRecord.where(
                        'placeInfo.city',
                        isEqualTo: widget.userPost?.placeInfo.city,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 12.0,
                            height: 12.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primaryBackground,
                              ),
                            ),
                          ),
                        );
                      }
                      List<UserPostsRecord> listViewUserPostsRecordList =
                          snapshot.data!;

                      if (listViewUserPostsRecordList.isEmpty) {
                        return const Center(
                          child: ComponenteVacioWidget(),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewUserPostsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewUserPostsRecord =
                              listViewUserPostsRecordList[listViewIndex];
                          return AuthUserStreamWidget(
                            builder: (context) => PostImagenV2Widget(
                              key: Key(
                                  'Keyvj6_${listViewIndex}_of_${listViewUserPostsRecordList.length}'),
                              post: listViewUserPostsRecord,
                              verIconoCompartir: false,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.navBar1Model,
                updateCallback: () => setState(() {}),
                child: const NavBar1Widget(
                  tabActiva: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
