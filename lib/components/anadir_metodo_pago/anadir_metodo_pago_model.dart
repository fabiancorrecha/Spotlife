import '/components/selector_motivo/selector_motivo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'anadir_metodo_pago_widget.dart' show AnadirMetodoPagoWidget;
import 'package:flutter/material.dart';

class AnadirMetodoPagoModel extends FlutterFlowModel<AnadirMetodoPagoWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SelectorMotivo component.
  late SelectorMotivoModel selectorMotivoModel1;
  // Model for SelectorMotivo component.
  late SelectorMotivoModel selectorMotivoModel2;
  // Model for SelectorMotivo component.
  late SelectorMotivoModel selectorMotivoModel3;

  @override
  void initState(BuildContext context) {
    selectorMotivoModel1 = createModel(context, () => SelectorMotivoModel());
    selectorMotivoModel2 = createModel(context, () => SelectorMotivoModel());
    selectorMotivoModel3 = createModel(context, () => SelectorMotivoModel());
  }

  @override
  void dispose() {
    selectorMotivoModel1.dispose();
    selectorMotivoModel2.dispose();
    selectorMotivoModel3.dispose();
  }
}
