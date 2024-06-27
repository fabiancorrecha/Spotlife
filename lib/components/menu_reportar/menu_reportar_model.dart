import '/components/selector_motivo/selector_motivo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'menu_reportar_widget.dart' show MenuReportarWidget;
import 'package:flutter/material.dart';

class MenuReportarModel extends FlutterFlowModel<MenuReportarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SelectorMotivo component.
  late SelectorMotivoModel selectorMotivoModel1;
  // Model for SelectorMotivo component.
  late SelectorMotivoModel selectorMotivoModel2;
  // Model for SelectorMotivo component.
  late SelectorMotivoModel selectorMotivoModel3;
  // Model for SelectorMotivo component.
  late SelectorMotivoModel selectorMotivoModel4;
  // Model for SelectorMotivo component.
  late SelectorMotivoModel selectorMotivoModel5;

  @override
  void initState(BuildContext context) {
    selectorMotivoModel1 = createModel(context, () => SelectorMotivoModel());
    selectorMotivoModel2 = createModel(context, () => SelectorMotivoModel());
    selectorMotivoModel3 = createModel(context, () => SelectorMotivoModel());
    selectorMotivoModel4 = createModel(context, () => SelectorMotivoModel());
    selectorMotivoModel5 = createModel(context, () => SelectorMotivoModel());
  }

  @override
  void dispose() {
    selectorMotivoModel1.dispose();
    selectorMotivoModel2.dispose();
    selectorMotivoModel3.dispose();
    selectorMotivoModel4.dispose();
    selectorMotivoModel5.dispose();
  }
}
