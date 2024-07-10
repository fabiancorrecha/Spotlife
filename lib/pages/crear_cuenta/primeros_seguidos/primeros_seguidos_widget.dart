import '/auth/firebase_auth/auth_util.dart';
import '/components/boton1/boton1_widget.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/tarjeta_lista01/tarjeta_lista01_widget.dart';
import '/components/usuarios_recomendados/usuarios_recomendados_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'primeros_seguidos_model.dart';
export 'primeros_seguidos_model.dart';

class PrimerosSeguidosWidget extends StatefulWidget {
  const PrimerosSeguidosWidget({super.key});

  @override
  State<PrimerosSeguidosWidget> createState() => _PrimerosSeguidosWidgetState();
}

class _PrimerosSeguidosWidgetState extends State<PrimerosSeguidosWidget> {
  late PrimerosSeguidosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimerosSeguidosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'primerosSeguidos'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 18.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: 118.0,
                        height: 42.0,
                        decoration: const BoxDecoration(),
                        child: Image.asset(
                          'assets/images/Spotlife_logo_white.png',
                          width: 100.0,
                          height: 126.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: const BoxDecoration(),
                      ),
                      wrapWithModel(
                        model: _model.usuariosRecomendadosModel,
                        updateCallback: () => setState(() {}),
                        child: const UsuariosRecomendadosWidget(),
                      ),
                      if (FFAppState().indexTabFollow == '0')
                        AuthUserStreamWidget(
                          builder: (context) => Builder(
                            builder: (context) {
                              final usuariosSegudos = (currentUserDocument
                                          ?.listaSeguidos
                                          .toList() ??
                                      [])
                                  .map((e) => e)
                                  .toList();
                              if (usuariosSegudos.isEmpty) {
                                return const ComponenteVacioWidget();
                              }

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: usuariosSegudos.length,
                                itemBuilder: (context, usuariosSegudosIndex) {
                                  final usuariosSegudosItem =
                                      usuariosSegudos[usuariosSegudosIndex];
                                  return TarjetaLista01Widget(
                                    key: Key(
                                        'Keyfs0_${usuariosSegudosIndex}_of_${usuariosSegudos.length}'),
                                    mostrarBoton: true,
                                    seguido: usuariosSegudosItem,
                                    textoBtn: 'Siguiendo',
                                  );
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.boton1Model,
                updateCallback: () => setState(() {}),
                child: Boton1Widget(
                  texto: 'Continuar',
                  desabilitado: false,
                  accion: () async {
                    logFirebaseEvent(
                        'PRIMEROS_SEGUIDOS_Container_13nl73pf_CAL');
                    logFirebaseEvent('boton1_navigate_to');

                    context.pushNamed('Bienvenida');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
