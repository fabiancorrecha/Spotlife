import '/backend/backend.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/tarjeta_lista01/tarjeta_lista01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'usuarios_me_gusta_model.dart';
export 'usuarios_me_gusta_model.dart';

class UsuariosMeGustaWidget extends StatefulWidget {
  const UsuariosMeGustaWidget({
    super.key,
    required this.userPost,
  });

  final DocumentReference? userPost;

  @override
  State<UsuariosMeGustaWidget> createState() => _UsuariosMeGustaWidgetState();
}

class _UsuariosMeGustaWidgetState extends State<UsuariosMeGustaWidget> {
  late UsuariosMeGustaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsuariosMeGustaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'usuariosMeGusta'});
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

    return StreamBuilder<UserPostsRecord>(
      stream: UserPostsRecord.getDocument(widget.userPost!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 12.0,
                height: 12.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
              ),
            ),
          );
        }
        final usuariosMeGustaUserPostsRecord = snapshot.data!;
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
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'umzi2k2d' /* Usuarios a los que les gustó */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'USUARIOS_ME_GUSTA_Card_jeqlsuht_ON_TAP');
                                logFirebaseEvent('Card_navigate_back');
                                context.pop();
                              },
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context).fondoIcono,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.arrow_back_rounded,
                                    color: FlutterFlowTheme.of(context).icono,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (FFAppState().indexTabFollow == '0')
                          Builder(
                            builder: (context) {
                              final listaUsuarios =
                                  usuariosMeGustaUserPostsRecord.likes.toList();
                              if (listaUsuarios.isEmpty) {
                                return ComponenteVacioWidget();
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listaUsuarios.length,
                                itemBuilder: (context, listaUsuariosIndex) {
                                  final listaUsuariosItem =
                                      listaUsuarios[listaUsuariosIndex];
                                  return TarjetaLista01Widget(
                                    key: Key(
                                        'Key1n1_${listaUsuariosIndex}_of_${listaUsuarios.length}'),
                                    mostrarBoton: true,
                                    seguido: listaUsuariosItem,
                                    textoBtn: 'Siguiendo',
                                  );
                                },
                              );
                            },
                          ),
                        if (FFAppState().indexTabFollow == '0')
                          Container(
                            decoration: BoxDecoration(),
                          ),
                      ],
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
      },
    );
  }
}
