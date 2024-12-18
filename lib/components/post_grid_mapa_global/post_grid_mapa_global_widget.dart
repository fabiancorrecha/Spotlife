import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'post_grid_mapa_global_model.dart';
export 'post_grid_mapa_global_model.dart';

class PostGridMapaGlobalWidget extends StatefulWidget {
  const PostGridMapaGlobalWidget({super.key});

  @override
  State<PostGridMapaGlobalWidget> createState() =>
      _PostGridMapaGlobalWidgetState();
}

class _PostGridMapaGlobalWidgetState extends State<PostGridMapaGlobalWidget>
    with TickerProviderStateMixin {
  late PostGridMapaGlobalModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostGridMapaGlobalModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserPostsRecord>>(
      stream: queryUserPostsRecord(
        queryBuilder: (userPostsRecord) => userPostsRecord.where(
          'esPublico',
          isEqualTo: true,
        ),
      ),
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
        List<UserPostsRecord> containerUserPostsRecordList = snapshot.data!;

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(),
          child:
              // debo agregar el formato videos
              Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Builder(
              builder: (context) {
                final listaUserPost = containerUserPostsRecordList.toList();

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.72,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: listaUserPost.length,
                  itemBuilder: (context, listaUserPostIndex) {
                    final listaUserPostItem = listaUserPost[listaUserPostIndex];
                    return Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: StreamBuilder<UserPostsRecord>(
                        stream: UserPostsRecord.getDocument(
                            listaUserPostItem.reference),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 12.0,
                                height: 12.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                              ),
                            );
                          }

                          final stackUserPostsRecord = snapshot.data!;

                          return SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: Stack(
                              children: [
                                Builder(
                                  builder: (context) {
                                    final listaImagenes = stackUserPostsRecord
                                        .postPhotolist
                                        .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(listaImagenes.length,
                                                (listaImagenesIndex) {
                                          final listaImagenesItem =
                                              listaImagenes[listaImagenesIndex];
                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.443,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.323,
                                            decoration: const BoxDecoration(),
                                            child: Visibility(
                                              visible: !stackUserPostsRecord
                                                      .esVideo &&
                                                  stackUserPostsRecord
                                                      .hasPostPhotolist(),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'POST_GRID_MAPA_GLOBAL_Image_6kbps7ed_ON_');
                                                  logFirebaseEvent(
                                                      'Image_navigate_to');

                                                  context.pushNamed(
                                                    'detallePost',
                                                    pathParameters: {
                                                      'post': serializeParam(
                                                        stackUserPostsRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'post':
                                                          stackUserPostsRecord,
                                                    },
                                                  );

                                                  logFirebaseEvent(
                                                      'Image_update_app_state');
                                                  FFAppState()
                                                          .verCajaComentariosActualizados =
                                                      false;
                                                  safeSetState(() {});
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: const Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: const Duration(
                                                        milliseconds: 500),
                                                    imageUrl: listaImagenesItem,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'imageOnPageLoadAnimation']!),
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                                if (stackUserPostsRecord.esVideo &&
                                    stackUserPostsRecord.hasVideo())
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 300.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: custom_widgets
                                            .CustomVideoPlayerMiniture(
                                          width: double.infinity,
                                          height: double.infinity,
                                          videoPath: listaUserPostItem.video,
                                          soundOn: Icon(
                                            Icons.fourteen_mp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 10.0,
                                          ),
                                          soundOff: Icon(
                                            Icons.sixteen_mp_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 10.0,
                                          ),
                                          fullscreen: Icon(
                                            Icons.thirteen_mp_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 10.0,
                                          ),
                                          closeScreem: Icon(
                                            Icons.onetwothree_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 10.0,
                                          ),
                                          buttonSize: 40.0,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
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
        );
      },
    );
  }
}
