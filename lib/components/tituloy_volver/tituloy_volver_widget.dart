import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tituloy_volver_model.dart';
export 'tituloy_volver_model.dart';

class TituloyVolverWidget extends StatefulWidget {
  const TituloyVolverWidget({super.key});

  @override
  State<TituloyVolverWidget> createState() => _TituloyVolverWidgetState();
}

class _TituloyVolverWidgetState extends State<TituloyVolverWidget> {
  late TituloyVolverModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TituloyVolverModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
