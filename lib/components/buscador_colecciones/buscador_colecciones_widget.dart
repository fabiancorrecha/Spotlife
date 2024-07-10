import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'buscador_colecciones_model.dart';
export 'buscador_colecciones_model.dart';

class BuscadorColeccionesWidget extends StatefulWidget {
  const BuscadorColeccionesWidget({
    super.key,
    this.coleccionesLista,
    this.puedeCrearColeccion,
    this.esColeccionFavorito,
  });

  final List<CollectionsRecord>? coleccionesLista;
  final bool? puedeCrearColeccion;
  final bool? esColeccionFavorito;

  @override
  State<BuscadorColeccionesWidget> createState() =>
      _BuscadorColeccionesWidgetState();
}

class _BuscadorColeccionesWidgetState extends State<BuscadorColeccionesWidget> {
  late BuscadorColeccionesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuscadorColeccionesModel());

    _model.textFieldBuscarTextController ??= TextEditingController();
    _model.textFieldBuscarFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 1.0,
      ),
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
              child: TextFormField(
                controller: _model.textFieldBuscarTextController,
                focusNode: _model.textFieldBuscarFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textFieldBuscarTextController',
                  const Duration(milliseconds: 200),
                  () => setState(() {}),
                ),
                onFieldSubmitted: (_) async {
                  logFirebaseEvent('BUSCADOR_COLECCIONES_TextFieldBuscar_ON_');
                  logFirebaseEvent('TextFieldBuscar_simple_search');
                  safeSetState(() {
                    _model.simpleSearchResults = TextSearch(
                      widget.coleccionesLista!
                          .map(
                            (record) => TextSearchItem.fromTerms(
                                record, [record.nombre]),
                          )
                          .toList(),
                    )
                        .search(_model.textFieldBuscarTextController.text)
                        .map((r) => r.object)
                        .toList();
                  });
                },
                autofocus: false,
                textCapitalization: TextCapitalization.sentences,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: FFLocalizations.of(context).getText(
                    'od3q50x8' /* Buscar */,
                  ),
                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodySmallFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodySmallFamily),
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
                  fillColor: FlutterFlowTheme.of(context).fondoIcono,
                  suffixIcon: const Icon(
                    FFIcons.ksearch,
                    color: Color(0xFF757575),
                    size: 22.0,
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
                validator: _model.textFieldBuscarTextControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
          if (widget.puedeCrearColeccion ?? true)
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'BUSCADOR_COLECCIONES_Icon_90oejf2h_ON_TA');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed(
                        'CrearColeccionSinPost',
                        queryParameters: {
                          'esColeccionFavorito': serializeParam(
                            true,
                            ParamType.bool,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Icon(
                      FFIcons.kadd,
                      color: FlutterFlowTheme.of(context).icono,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
