import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'crear_cuenta_telefono_validacion_widget.dart'
    show CrearCuentaTelefonoValidacionWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class CrearCuentaTelefonoValidacionModel
    extends FlutterFlowModel<CrearCuentaTelefonoValidacionWidget> {
  ///  Local state fields for this page.

  String? codigo;

  String confirmacion = 'SinConfirmar';

  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 120000;
  int timerMilliseconds = 120000;
  String timerValue = StopWatchTimer.getDisplayTime(
    120000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for boton1 component.
  late Boton1Model boton1Model;

  @override
  void initState(BuildContext context) {
    boton1Model = createModel(context, () => Boton1Model());
  }

  @override
  void dispose() {
    timerController.dispose();
    boton1Model.dispose();
  }
}
