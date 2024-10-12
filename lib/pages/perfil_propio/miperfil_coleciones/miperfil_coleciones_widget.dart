import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar7_usuario/app_bar7_usuario_widget.dart';
import '/components/detalles_de_coleccion/detalles_de_coleccion_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/nav_bar2/nav_bar2_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'miperfil_coleciones_model.dart';
export 'miperfil_coleciones_model.dart';

class MiperfilColecionesWidget extends StatefulWidget {
  const MiperfilColecionesWidget({super.key});

  @override
  State<MiperfilColecionesWidget> createState() =>
      _MiperfilColecionesWidgetState();
}

class _MiperfilColecionesWidgetState extends State<MiperfilColecionesWidget> {
  late MiperfilColecionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiperfilColecionesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'miperfilColeciones'});
    _model.textFieldBuscarTextController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CollectionsRecord>>(
      stream: queryCollectionsRecord(
        queryBuilder: (collectionsRecord) => collectionsRecord.where(
          'createdBy',
          isEqualTo: currentUserReference,
        ),
      ),
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
        List<CollectionsRecord> miperfilColecionesCollectionsRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.appBar7UsuarioModel,
                          updateCallback: () => safeSetState(() {}),
                          child: AppBar7UsuarioWidget(
                            usuario: currentUserReference,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.navBar2Model,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavBar2Widget(
                            tab: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Autocomplete<String>(
                                    initialValue: const TextEditingValue(),
                                    optionsBuilder: (textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<String>.empty();
                                      }
                                      return miperfilColecionesCollectionsRecordList
                                          .map((e) => e.nombre)
                                          .toList()
                                          .where((option) {
                                        final lowercaseOption =
                                            option.toLowerCase();
                                        return lowercaseOption.contains(
                                            textEditingValue.text
                                                .toLowerCase());
                                      });
                                    },
                                    optionsViewBuilder:
                                        (context, onSelected, options) {
                                      return AutocompleteOptionsList(
                                        textFieldKey: _model.textFieldBuscarKey,
                                        textController: _model
                                            .textFieldBuscarTextController!,
                                        options: options.toList(),
                                        onSelected: onSelected,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        textHighlightStyle: const TextStyle(),
                                        elevation: 4.0,
                                        optionBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        optionHighlightColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        maxHeight: 200.0,
                                      );
                                    },
                                    onSelected: (String selection) {
                                      safeSetState(() =>
                                          _model.textFieldBuscarSelectedOption =
                                              selection);
                                      FocusScope.of(context).unfocus();
                                    },
                                    fieldViewBuilder: (
                                      context,
                                      textEditingController,
                                      focusNode,
                                      onEditingComplete,
                                    ) {
                                      _model.textFieldBuscarFocusNode =
                                          focusNode;

                                      _model.textFieldBuscarTextController =
                                          textEditingController;
                                      return TextFormField(
                                        key: _model.textFieldBuscarKey,
                                        controller: textEditingController,
                                        focusNode: focusNode,
                                        onEditingComplete: onEditingComplete,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textFieldBuscarTextController',
                                          const Duration(milliseconds: 0),
                                          () => safeSetState(() {}),
                                        ),
                                        onFieldSubmitted: (_) async {
                                          logFirebaseEvent(
                                              'MIPERFIL_COLECIONES_TextFieldBuscar_ON_T');
                                          logFirebaseEvent(
                                              'TextFieldBuscar_simple_search');
                                          safeSetState(() {
                                            _model.simpleSearchResults =
                                                TextSearch(
                                              miperfilColecionesCollectionsRecordList
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record, [
                                                      record.nombre,
                                                      record.descripcion
                                                    ]),
                                                  )
                                                  .toList(),
                                            )
                                                    .search(_model
                                                        .textFieldBuscarTextController
                                                        .text)
                                                    .map((r) => r.object)
                                                    .toList();
                                          });
                                        },
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'w0vrhxbj' /* Buscar */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .fondoIcono,
                                          suffixIcon: const Icon(
                                            FFIcons.ksearch,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        validator: _model
                                            .textFieldBuscarTextControllerValidator
                                            .asValidator(context),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
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
                                            'MIPERFIL_COLECIONES_Icon_4gb70cp6_ON_TAP');
                                        logFirebaseEvent('Icon_navigate_to');

                                        context.pushNamed(
                                          'CrearColeccionSinPost',
                                          queryParameters: {
                                            'esColeccionFavorito':
                                                serializeParam(
                                              true,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Icon(
                                        FFIcons.kadd,
                                        color:
                                            FlutterFlowTheme.of(context).icono,
                                        size: 32.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_model.textFieldBuscarTextController.text == '')
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                final general =
                                    miperfilColecionesCollectionsRecordList
                                        .toList();

                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    childAspectRatio: 1.0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: general.length,
                                  itemBuilder: (context, generalIndex) {
                                    final generalItem = general[generalIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            generalItem.createdBy!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 12.0,
                                                height: 12.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          final containerIUserUsersRecord =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 151.0,
                                                    height: 126.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Visibility(
                                                      visible: () {
                                                        if (generalItem
                                                            .coleccionPublica) {
                                                          return (containerIUserUsersRecord
                                                                  .reference ==
                                                              currentUserReference);
                                                        } else if (generalItem
                                                            .coleccionAmigos) {
                                                          return ((containerIUserUsersRecord
                                                                      .reference ==
                                                                  currentUserReference) ||
                                                              containerIUserUsersRecord
                                                                  .listaSeguidos
                                                                  .contains(
                                                                      currentUserReference));
                                                        } else if (generalItem
                                                            .coleccionPrivada) {
                                                          return true;
                                                        } else {
                                                          return false;
                                                        }
                                                      }(),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'MIPERFIL_COLECIONES_Stack_323czkeq_ON_TA');
                                                          logFirebaseEvent(
                                                              'Stack_navigate_to');

                                                          context.pushNamed(
                                                            'miperfilDetalleColeccion',
                                                            queryParameters: {
                                                              'coleccion':
                                                                  serializeParam(
                                                                generalItem,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'esFavorito':
                                                                  serializeParam(
                                                                false,
                                                                ParamType.bool,
                                                              ),
                                                              'usuario':
                                                                  serializeParam(
                                                                currentUserReference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                              'refColeccion':
                                                                  serializeParam(
                                                                generalItem
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'coleccion':
                                                                  generalItem,
                                                            },
                                                          );
                                                        },
                                                        child: Stack(
                                                          children: [
                                                            StreamBuilder<
                                                                List<
                                                                    UserPostsRecord>>(
                                                              stream:
                                                                  queryUserPostsRecord(
                                                                queryBuilder:
                                                                    (userPostsRecord) =>
                                                                        userPostsRecord
                                                                            .where(
                                                                  'collections',
                                                                  arrayContains:
                                                                      generalItem
                                                                          .reference,
                                                                ),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          12.0,
                                                                      height:
                                                                          12.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<UserPostsRecord>
                                                                    imageUserPostsRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final imageUserPostsRecord =
                                                                    imageUserPostsRecordList
                                                                            .isNotEmpty
                                                                        ? imageUserPostsRecordList
                                                                            .first
                                                                        : null;

                                                                return ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      () {
                                                                        if (generalItem.imagen !=
                                                                                '') {
                                                                          return generalItem
                                                                              .imagen;
                                                                        } else {
                                                                          return imageUserPostsRecord
                                                                            ?.postPhotolist
                                                                            .first;
                                                                        }
                                                                      
                                                                      }(),
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/tk7vl1robaxz/Logo_Spotlife_Nuevo.png',
                                                                    ),
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .network(
                                                                    '',
                                                                  ).image,
                                                                ),
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    const Color(
                                                                        0x005C52E2),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                  ],
                                                                  stops: const [
                                                                    0.5,
                                                                    1.0
                                                                  ],
                                                                  begin:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  end:
                                                                      const AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        10.0,
                                                                        8.0,
                                                                        10.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              8.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          fillColor:
                                                                              const Color(0x00F4F176),
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.ellipsisV,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).btnText,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('MIPERFIL_COLECIONES_ellipsisV_ICN_ON_TAP');
                                                                            logFirebaseEvent('IconButton_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return WebViewAware(
                                                                                  child: GestureDetector(
                                                                                    onTap: () => FocusScope.of(context).unfocus(),
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                      child: SizedBox(
                                                                                        height: 260.0,
                                                                                        child: DetallesDeColeccionWidget(
                                                                                          coleccion: generalItem.reference,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const Spacer(),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                4.0),
                                                                            child:
                                                                                Text(
                                                                              generalItem.nombre,
                                                                              maxLines: 1,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (generalItem.coleccionPublica)
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.globeEurope,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 14.0,
                                                                                ),
                                                                              ),
                                                                            if (generalItem.coleccionAmigos)
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.userFriends,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 14.0,
                                                                                ),
                                                                              ),
                                                                            if (generalItem.coleccionPrivada)
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.userSecret,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 14.0,
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            generalItem.descripcion,
                                                                            maxLines:
                                                                                1,
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        if (_model.textFieldBuscarTextController.text != '')
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                final searchCollection = _model
                                    .simpleSearchResults
                                    .map((e) => e)
                                    .toList();

                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    childAspectRatio: 1.0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: searchCollection.length,
                                  itemBuilder:
                                      (context, searchCollectionIndex) {
                                    final searchCollectionItem =
                                        searchCollection[searchCollectionIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            searchCollectionItem.createdBy!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 12.0,
                                                height: 12.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          final containerIUserUsersRecord =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'MIPERFIL_COLECIONES_Container_ed4qosdj_O');
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                        'miperfilDetalleColeccion',
                                                        queryParameters: {
                                                          'coleccion':
                                                              serializeParam(
                                                            searchCollectionItem,
                                                            ParamType.Document,
                                                          ),
                                                          'esFavorito':
                                                              serializeParam(
                                                            false,
                                                            ParamType.bool,
                                                          ),
                                                          'usuario':
                                                              serializeParam(
                                                            currentUserReference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'refColeccion':
                                                              serializeParam(
                                                            searchCollectionItem
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'coleccion':
                                                              searchCollectionItem,
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 151.0,
                                                      height: 126.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Visibility(
                                                        visible: () {
                                                          if (searchCollectionItem
                                                              .coleccionPublica) {
                                                            return (containerIUserUsersRecord
                                                                    .reference ==
                                                                currentUserReference);
                                                          } else if (searchCollectionItem
                                                              .coleccionAmigos) {
                                                            return ((containerIUserUsersRecord
                                                                        .reference ==
                                                                    currentUserReference) ||
                                                                containerIUserUsersRecord
                                                                    .listaSeguidos
                                                                    .contains(
                                                                        currentUserReference));
                                                          } else if (searchCollectionItem
                                                              .coleccionPublica) {
                                                            return true;
                                                          } else {
                                                            return false;
                                                          }
                                                        }(),
                                                        child: Stack(
                                                          children: [
                                                            StreamBuilder<
                                                                List<
                                                                    UserPostsRecord>>(
                                                              stream:
                                                                  queryUserPostsRecord(
                                                                queryBuilder:
                                                                    (userPostsRecord) =>
                                                                        userPostsRecord
                                                                            .where(
                                                                  'collections',
                                                                  arrayContains:
                                                                      searchCollectionItem
                                                                          .reference,
                                                                ),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          12.0,
                                                                      height:
                                                                          12.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<UserPostsRecord>
                                                                    imageUserPostsRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final imageUserPostsRecord =
                                                                    imageUserPostsRecordList
                                                                            .isNotEmpty
                                                                        ? imageUserPostsRecordList
                                                                            .first
                                                                        : null;

                                                                return ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      () {
                                                                        if (searchCollectionItem.imagen !=
                                                                                '') {
                                                                          return searchCollectionItem
                                                                              .imagen;
                                                                        } else {
                                                                          return imageUserPostsRecord
                                                                            ?.postPhotolist
                                                                            .first;
                                                                        }
                                                                      
                                                                      }(),
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/tk7vl1robaxz/Logo_Spotlife_Nuevo.png',
                                                                    ),
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .network(
                                                                    '',
                                                                  ).image,
                                                                ),
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    const Color(
                                                                        0x005C52E2),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                  ],
                                                                  stops: const [
                                                                    0.5,
                                                                    1.0
                                                                  ],
                                                                  begin:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  end:
                                                                      const AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        10.0,
                                                                        8.0,
                                                                        10.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              8.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          fillColor:
                                                                              const Color(0x00F4F176),
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.ellipsisV,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).icono,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('MIPERFIL_COLECIONES_ellipsisV_ICN_ON_TAP');
                                                                            logFirebaseEvent('IconButton_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return WebViewAware(
                                                                                  child: GestureDetector(
                                                                                    onTap: () => FocusScope.of(context).unfocus(),
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                      child: SizedBox(
                                                                                        height: 260.0,
                                                                                        child: DetallesDeColeccionWidget(
                                                                                          coleccion: searchCollectionItem.reference,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const Spacer(),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                4.0),
                                                                            child:
                                                                                Text(
                                                                              searchCollectionItem.nombre,
                                                                              maxLines: 1,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (searchCollectionItem.coleccionPublica)
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.globeEurope,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 14.0,
                                                                                ),
                                                                              ),
                                                                            if (searchCollectionItem.coleccionAmigos)
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.userFriends,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 14.0,
                                                                                ),
                                                                              ),
                                                                            if (searchCollectionItem.coleccionPrivada)
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.userSecret,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 14.0,
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            searchCollectionItem.descripcion,
                                                                            maxLines:
                                                                                1,
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navBar1Model,
                      updateCallback: () => safeSetState(() {}),
                      child: const NavBar1Widget(
                        tabActiva: 3,
                      ),
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
