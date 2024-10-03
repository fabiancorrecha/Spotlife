import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'grid_colecciones_model.dart';
export 'grid_colecciones_model.dart';

class GridColeccionesWidget extends StatefulWidget {
  const GridColeccionesWidget({
    super.key,
    this.usuario,
    this.esCollecionTipoFavorito,
  });

  final DocumentReference? usuario;
  final bool? esCollecionTipoFavorito;

  @override
  State<GridColeccionesWidget> createState() => _GridColeccionesWidgetState();
}

class _GridColeccionesWidgetState extends State<GridColeccionesWidget> {
  late GridColeccionesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridColeccionesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: StreamBuilder<List<CollectionsRecord>>(
        stream: queryCollectionsRecord(
          queryBuilder: (collectionsRecord) => collectionsRecord
              .where(
                'createdBy',
                isEqualTo: widget.usuario,
              )
              .where(
                'coleccionFavoritos',
                isEqualTo: widget.esCollecionTipoFavorito,
              )
              .where(
                'coleccionPublica',
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
          List<CollectionsRecord> gridViewCollectionsRecordList =
              snapshot.data!;

          return GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.14,
            ),
            scrollDirection: Axis.vertical,
            itemCount: gridViewCollectionsRecordList.length,
            itemBuilder: (context, gridViewIndex) {
              final gridViewCollectionsRecord =
                  gridViewCollectionsRecordList[gridViewIndex];
              return Container(width: 100, height: 100, color: Colors.green);
            },
          );
        },
      ),
    );
  }
}
