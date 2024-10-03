import '/auth/firebase_auth/auth_util.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/tarjeta_lista01/tarjeta_lista01_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cuenta_bloqueadas_model.dart';
export 'cuenta_bloqueadas_model.dart';

class CuentaBloqueadasWidget extends StatefulWidget {
  const CuentaBloqueadasWidget({super.key});

  @override
  State<CuentaBloqueadasWidget> createState() => _CuentaBloqueadasWidgetState();
}

class _CuentaBloqueadasWidgetState extends State<CuentaBloqueadasWidget> {
  late CuentaBloqueadasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CuentaBloqueadasModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100.0,
              decoration: const BoxDecoration(),
              child: Container(
                height: 72.0,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 50.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).fondoIcono,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).icono,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'CUENTA_BLOQUEADAS_arrow_back_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_bottom_sheet');
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AuthUserStreamWidget(
                      builder: (context) => Builder(
                        builder: (context) {
                          final bloquados =
                              (currentUserDocument?.listaBloqueados.toList() ??
                                      [])
                                  .toList();
                          if (bloquados.isEmpty) {
                            return const ComponenteVacioWidget();
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: bloquados.length,
                            itemBuilder: (context, bloquadosIndex) {
                              final bloquadosItem = bloquados[bloquadosIndex];
                              return TarjetaLista01Widget(
                                key: Key(
                                    'Keymsm_${bloquadosIndex}_of_${bloquados.length}'),
                                mostrarBoton: true,
                                seguido: bloquadosItem,
                                textoBtn: 'Bloquado',
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
          ],
        ),
      ),
    );
  }
}
