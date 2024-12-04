import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'fechade_nacimiento_widget.dart' show FechadeNacimientoWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FechadeNacimientoModel extends FlutterFlowModel<FechadeNacimientoWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? fechaDeNacimientoController;
  final formKey = GlobalKey<FormState>();
  DateTime? datePicked;
  // Model for boton1 component.
  late Boton1Model boton1Model;

  @override
  void initState(BuildContext context) {
    boton1Model = createModel(context, () => Boton1Model());
  }

  @override
  void dispose() {
    fechaDeNacimientoController?.finish();
    boton1Model.dispose();
  }
}
