import '/backend/backend.dart';
import '/components/app_bar4/app_bar4_widget.dart';
import '/components/post_imagen_v2/post_imagen_v2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'detalle_post_model.dart';
export 'detalle_post_model.dart';

class DetallePostWidget extends StatefulWidget {
  const DetallePostWidget({
    super.key,
    this.post,
  });

  final UserPostsRecord? post;

  @override
  State<DetallePostWidget> createState() => _DetallePostWidgetState();
}

class _DetallePostWidgetState extends State<DetallePostWidget> {
  late DetallePostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetallePostModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'detallePost'});
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 18.0),
                child: wrapWithModel(
                  model: _model.appBar4Model,
                  updateCallback: () => setState(() {}),
                  child: const AppBar4Widget(
                    textValue: 'Spot',
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.postImagenV2Model,
                        updateCallback: () => setState(() {}),
                        child: PostImagenV2Widget(
                          post: widget.post,
                          verIconoCompartir: true,
                          verComentarios: true,
                        ),
                      ),
                    ],
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
