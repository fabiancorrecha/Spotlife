import '/auth/firebase_auth/auth_util.dart';
import '/components/app_bar7_usuario/app_bar7_usuario_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post_imagen/post_imagen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mi_perfil_mapa_pin3_model.dart';
export 'mi_perfil_mapa_pin3_model.dart';

class MiPerfilMapaPin3Widget extends StatefulWidget {
  const MiPerfilMapaPin3Widget({super.key});

  @override
  State<MiPerfilMapaPin3Widget> createState() => _MiPerfilMapaPin3WidgetState();
}

class _MiPerfilMapaPin3WidgetState extends State<MiPerfilMapaPin3Widget> {
  late MiPerfilMapaPin3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiPerfilMapaPin3Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'miPerfilMapaPin3'});
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.appBar7UsuarioModel,
                updateCallback: () => setState(() {}),
                child: AppBar7UsuarioWidget(
                  usuario: currentUserReference,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Container(
                            constraints: const BoxConstraints(
                              maxHeight: 572.0,
                            ),
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                wrapWithModel(
                                  model: _model.postImagenModel1,
                                  updateCallback: () => setState(() {}),
                                  child: const PostImagenWidget(),
                                ),
                                Divider(
                                  height: 32.0,
                                  thickness: 32.0,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(
                              maxHeight: 572.0,
                            ),
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                wrapWithModel(
                                  model: _model.postImagenModel2,
                                  updateCallback: () => setState(() {}),
                                  child: const PostImagenWidget(),
                                ),
                                Divider(
                                  height: 32.0,
                                  thickness: 32.0,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.navBar1Model,
                updateCallback: () => setState(() {}),
                child: const NavBar1Widget(
                  tabActiva: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
