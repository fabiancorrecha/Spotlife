import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dar_feedback_widget.dart' show DarFeedbackWidget;
import 'package:flutter/material.dart';

class DarFeedbackModel extends FlutterFlowModel<DarFeedbackWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for boton1 component.
  late Boton1Model boton1Model;
  // Stores action output result for [Custom Action - calculateRating] action in boton1 widget.
  double? ratingBar;

  @override
  void initState(BuildContext context) {
    boton1Model = createModel(context, () => Boton1Model());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    boton1Model.dispose();
  }
}
