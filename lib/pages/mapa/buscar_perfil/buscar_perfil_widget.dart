import '/backend/backend.dart';
import '/components/componente_vacio/componente_vacio_widget.dart';
import '/components/menu02/menu02_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/tarjeta_lista01/tarjeta_lista01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'buscar_perfil_model.dart';
export 'buscar_perfil_model.dart';

class BuscarPerfilWidget extends StatefulWidget {
  const BuscarPerfilWidget({super.key});

  @override
  State<BuscarPerfilWidget> createState() => _BuscarPerfilWidgetState();
}

class _BuscarPerfilWidgetState extends State<BuscarPerfilWidget> {
  late BuscarPerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuscarPerfilModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'buscarPerfil'});
    _model.textFieldBuscarTextController ??= TextEditingController();
    _model.textFieldBuscarFocusNode ??= FocusNode();

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
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 32.0),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'BUSCAR_PERFIL_Container_t5evg0zc_ON_TAP');
                                  logFirebaseEvent('Container_navigate_back');
                                  context.pop();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).fondoIcono,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      FFIcons.karrowBack,
                                      color: FlutterFlowTheme.of(context).icono,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: TextFormField(
                                  controller:
                                      _model.textFieldBuscarTextController,
                                  focusNode: _model.textFieldBuscarFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldBuscarTextController',
                                    const Duration(milliseconds: 2000),
                                    () async {
                                      logFirebaseEvent(
                                          'BUSCAR_PERFIL_TextFieldBuscar_ON_TEXTFIE');
                                      logFirebaseEvent(
                                          'TextFieldBuscar_simple_search');
                                      await queryUsersRecordOnce()
                                          .then(
                                            (records) => _model
                                                    .simpleSearchResults =
                                                TextSearch(
                                              records
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record, [
                                                      record.displayName,
                                                      record.email,
                                                      record.userName
                                                    ]),
                                                  )
                                                  .toList(),
                                            )
                                                    .search(_model
                                                        .textFieldBuscarTextController
                                                        .text)
                                                    .map((r) => r.object)
                                                    .toList(),
                                          )
                                          .onError((_, __) =>
                                              _model.simpleSearchResults = [])
                                          .whenComplete(() => setState(() {}));
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'yhmm11f3' /* Buscar */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily),
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).fondoIcono,
                                    suffixIcon: const Icon(
                                      FFIcons.ksearch,
                                      color: Color(0xFF757575),
                                      size: 22.0,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  validator: _model
                                      .textFieldBuscarTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            if (FFAppState().ocultar == false)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'BUSCAR_PERFIL_Container_ouzufowk_ON_TAP');
                                  logFirebaseEvent('Container_navigate_back');
                                  context.pop();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).fondoIcono,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      FFIcons.kframe169,
                                      color: FlutterFlowTheme.of(context).icono,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.menu02Model,
                    updateCallback: () => setState(() {}),
                    child: const Menu02Widget(
                      seccion: 2,
                    ),
                  ),
                  if (_model.textFieldBuscarTextController.text != '')
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final listadoUsuarios =
                              _model.simpleSearchResults.toList();
                          if (listadoUsuarios.isEmpty) {
                            return const ComponenteVacioWidget();
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listadoUsuarios.length,
                            itemBuilder: (context, listadoUsuariosIndex) {
                              final listadoUsuariosItem =
                                  listadoUsuarios[listadoUsuariosIndex];
                              return TarjetaLista01Widget(
                                key: Key(
                                    'Key4et_${listadoUsuariosIndex}_of_${listadoUsuarios.length}'),
                                mostrarBoton: true,
                                seguido: listadoUsuariosItem.reference,
                                textoBtn: 'Siguiendo',
                              );
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBar1Model,
                  updateCallback: () => setState(() {}),
                  child: const NavBar1Widget(
                    tabActiva: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
