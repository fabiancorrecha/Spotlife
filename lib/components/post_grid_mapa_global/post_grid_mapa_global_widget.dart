import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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

  LatLng? currentUserLocationValue;

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

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return StreamBuilder<List<UserPostsRecord>>(
      stream: queryUserPostsRecord(
        queryBuilder: (userPostsRecord) => userPostsRecord.where(
          'esAmigos',
          isEqualTo: false,
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
                final listaUserPost = functions
                    .getPlacesMaximumDistance(
                        containerUserPostsRecordList.toList(),
                        currentUserLocationValue!,
                        5000.0)
                    .toList();

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
                                                  setState(() {});
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
                                  FlutterFlowVideoPlayer(
                                    path: stackUserPostsRecord.video,
                                    videoType: VideoType.network,
                                    width: 216.0,
                                    height: 300.0,
                                    autoPlay: true,
                                    looping: true,
                                    showControls: false,
                                    allowFullScreen: true,
                                    allowPlaybackSpeedMenu: false,
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
