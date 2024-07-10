import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_bar7_colecciones_model.dart';
export 'app_bar7_colecciones_model.dart';

class AppBar7ColeccionesWidget extends StatefulWidget {
  const AppBar7ColeccionesWidget({
    super.key,
    required this.usuario,
  });

  final DocumentReference? usuario;

  @override
  State<AppBar7ColeccionesWidget> createState() =>
      _AppBar7ColeccionesWidgetState();
}

class _AppBar7ColeccionesWidgetState extends State<AppBar7ColeccionesWidget> {
  late AppBar7ColeccionesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBar7ColeccionesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Esta barra contiene detalles de una coleccion
        StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.usuario!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 12.0,
              height: 12.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primaryBackground,
                ),
              ),
            ),
          );
        }

        final containerUsersRecord = snapshot.data!;

        return Container(
          height: 100.0,
          decoration: const BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'APP_BAR7_COLECCIONES_Card_5nqcsqbq_ON_TA');
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
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).icono,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 40.0,
                height: 40.0,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CachedNetworkImage(
                  fadeInDuration: const Duration(milliseconds: 500),
                  fadeOutDuration: const Duration(milliseconds: 500),
                  imageUrl: valueOrDefault<String>(
                    containerUsersRecord.photoUrl,
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                containerUsersRecord.displayName,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
