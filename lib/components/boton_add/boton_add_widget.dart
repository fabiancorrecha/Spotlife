import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'boton_add_model.dart';
export 'boton_add_model.dart';

class BotonAddWidget extends StatefulWidget {
  const BotonAddWidget({
    super.key,
    this.accion,
  });

  final Future Function()? accion;

  @override
  State<BotonAddWidget> createState() => _BotonAddWidgetState();
}

class _BotonAddWidgetState extends State<BotonAddWidget> {
  late BotonAddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BotonAddModel());

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
      width: 100.0,
      height: 100.0,
      decoration: const BoxDecoration(),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 1.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('BOTON_ADD_COMP_Card_a0l4egbb_ON_TAP');
            logFirebaseEvent('Card_execute_callback');
            await widget.accion?.call();
          },
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: FlutterFlowTheme.of(context).fondoIcono,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(
                FFIcons.kadd,
                color: FlutterFlowTheme.of(context).icono,
                size: 24.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
