import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar2/app_bar2_widget.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post_imagen_v2/post_imagen_v2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'otro_perfil_mapa_pin_model.dart';
export 'otro_perfil_mapa_pin_model.dart';

class OtroPerfilMapaPinWidget extends StatefulWidget {
  const OtroPerfilMapaPinWidget({super.key});

  @override
  State<OtroPerfilMapaPinWidget> createState() =>
      _OtroPerfilMapaPinWidgetState();
}

class _OtroPerfilMapaPinWidgetState extends State<OtroPerfilMapaPinWidget> {
  late OtroPerfilMapaPinModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtroPerfilMapaPinModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'otroPerfilMapaPin'});
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.appBar2Model,
                updateCallback: () => safeSetState(() {}),
                child: const AppBar2Widget(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => PagedListView<
                            DocumentSnapshot<Object?>?, UserPostsRecord>(
                          pagingController: _model.setListViewController(
                            UserPostsRecord.collection
                                .whereIn(
                                    'postUser',
                                    functions.usuariosConcatenados(
                                        (currentUserDocument?.listaSeguidos
                                                    .toList() ??
                                                [])
                                            .toList(),
                                        currentUserReference,
                                        (currentUserDocument?.listaBloqueados
                                                    .toList() ??
                                                [])
                                            .toList()))
                                .where(
                                  'esPrivado',
                                  isEqualTo: false,
                                )
                                .orderBy('timePosted', descending: true),
                          ),
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          builderDelegate:
                              PagedChildBuilderDelegate<UserPostsRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 12.0,
                                height: 12.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                              ),
                            ),
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 12.0,
                                height: 12.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                              ),
                            ),
                            noItemsFoundIndicatorBuilder: (_) => const Center(
                              child: ComponenteVacioWidget(),
                            ),
                            itemBuilder: (context, _, listViewIndex) {
                              final listViewUserPostsRecord = _model
                                  .listViewPagingController!
                                  .itemList![listViewIndex];
                              return PostImagenV2Widget(
                                key: Key(
                                    'Keyawi_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                post: listViewUserPostsRecord,
                                verIconoCompartir: false,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.navBar1Model,
                updateCallback: () => safeSetState(() {}),
                child: const NavBar1Widget(
                  tabActiva: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
