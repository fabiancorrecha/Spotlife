import '/auth/firebase_auth/auth_util.dart';
import '/components/app_bar4/app_bar4_widget.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/tarjeta_lista01/tarjeta_lista01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'cuentas_bloqueadas_model.dart';
export 'cuentas_bloqueadas_model.dart';

class CuentasBloqueadasWidget extends StatefulWidget {
  const CuentasBloqueadasWidget({super.key});

  @override
  State<CuentasBloqueadasWidget> createState() =>
      _CuentasBloqueadasWidgetState();
}

class _CuentasBloqueadasWidgetState extends State<CuentasBloqueadasWidget> {
  late CuentasBloqueadasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CuentasBloqueadasModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'cuentasBloqueadas'});
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100.0,
                decoration: BoxDecoration(),
                child: AuthUserStreamWidget(
                  builder: (context) => wrapWithModel(
                    model: _model.appBar4Model,
                    updateCallback: () => setState(() {}),
                    child: AppBar4Widget(
                      textValue: currentUserDisplayName,
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
                            final bloquados = (currentUserDocument
                                        ?.listaBloqueados
                                        ?.toList() ??
                                    [])
                                .toList();
                            if (bloquados.isEmpty) {
                              return ComponenteVacioWidget();
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
                                      'Keyx8s_${bloquadosIndex}_of_${bloquados.length}'),
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
              wrapWithModel(
                model: _model.navBar1Model,
                updateCallback: () => setState(() {}),
                child: NavBar1Widget(
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
