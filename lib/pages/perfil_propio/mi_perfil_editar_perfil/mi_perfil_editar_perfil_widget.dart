import '/auth/firebase_auth/auth_util.dart';
import '/components/tarjeta_mi_perfil_editar/tarjeta_mi_perfil_editar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mi_perfil_editar_perfil_model.dart';
export 'mi_perfil_editar_perfil_model.dart';

class MiPerfilEditarPerfilWidget extends StatefulWidget {
  const MiPerfilEditarPerfilWidget({super.key});

  @override
  State<MiPerfilEditarPerfilWidget> createState() =>
      _MiPerfilEditarPerfilWidgetState();
}

class _MiPerfilEditarPerfilWidgetState
    extends State<MiPerfilEditarPerfilWidget> {
  late MiPerfilEditarPerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiPerfilEditarPerfilModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'miPerfilEditarPerfil'});
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.tarjetaMiPerfilEditarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: TarjetaMiPerfilEditarWidget(
                    usuario: currentUserReference,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
