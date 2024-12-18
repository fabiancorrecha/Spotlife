import '/backend/backend.dart';
import '/components/app_bar_post_list/app_bar_post_list_widget.dart';
import '/components/grid_posts_filtradr_por_ubicacion/grid_posts_filtradr_por_ubicacion_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'grid_post_filtrados_ubicacion_model.dart';
export 'grid_post_filtrados_ubicacion_model.dart';

class GridPostFiltradosUbicacionWidget extends StatefulWidget {
  const GridPostFiltradosUbicacionWidget({
    super.key,
    this.postUser,
  });

  final UserPostsRecord? postUser;

  @override
  State<GridPostFiltradosUbicacionWidget> createState() =>
      _GridPostFiltradosUbicacionWidgetState();
}

class _GridPostFiltradosUbicacionWidgetState
    extends State<GridPostFiltradosUbicacionWidget> {
  late GridPostFiltradosUbicacionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridPostFiltradosUbicacionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'gridPostFiltradosUbicacion'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.appBarPostListModel,
                updateCallback: () => safeSetState(() {}),
                child: AppBarPostListWidget(
                  userPost: widget.postUser,
                ),
              ),
              Expanded(
                child: wrapWithModel(
                  model: _model.gridPostsFiltradrPorUbicacionModel,
                  updateCallback: () => safeSetState(() {}),
                  child: GridPostsFiltradrPorUbicacionWidget(
                    post: widget.postUser,
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.navBar1Model,
                updateCallback: () => safeSetState(() {}),
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
