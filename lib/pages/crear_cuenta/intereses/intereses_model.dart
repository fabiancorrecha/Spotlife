import '/components/boton1/boton1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'intereses_widget.dart' show InteresesWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class InteresesModel extends FlutterFlowModel<InteresesWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> intereses = [];
  void addToIntereses(DocumentReference item) => intereses.add(item);
  void removeFromIntereses(DocumentReference item) => intereses.remove(item);
  void removeAtIndexFromIntereses(int index) => intereses.removeAt(index);
  void insertAtIndexInIntereses(int index, DocumentReference item) =>
      intereses.insert(index, item);
  void updateInteresesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      intereses[index] = updateFn(intereses[index]);

  DocumentReference? interesSeleccionado;

  List<DocumentReference> seguidor = [];
  void addToSeguidor(DocumentReference item) => seguidor.add(item);
  void removeFromSeguidor(DocumentReference item) => seguidor.remove(item);
  void removeAtIndexFromSeguidor(int index) => seguidor.removeAt(index);
  void insertAtIndexInSeguidor(int index, DocumentReference item) =>
      seguidor.insert(index, item);
  void updateSeguidorAtIndex(int index, Function(DocumentReference) updateFn) =>
      seguidor[index] = updateFn(seguidor[index]);

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? interesesController;
  final unfocusNode = FocusNode();
  // Model for boton1 component.
  late Boton1Model boton1Model;

  @override
  void initState(BuildContext context) {
    boton1Model = createModel(context, () => Boton1Model());
  }

  @override
  void dispose() {
    interesesController?.finish();
    boton1Model.dispose();
  }
}
