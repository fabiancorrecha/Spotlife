import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InteresesRecord extends FirestoreRecord {
  InteresesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Interes" field.
  String? _interes;
  String get interes => _interes ?? '';
  bool hasInteres() => _interes != null;

  // "CuentasAsociadas" field.
  List<DocumentReference>? _cuentasAsociadas;
  List<DocumentReference> get cuentasAsociadas => _cuentasAsociadas ?? const [];
  bool hasCuentasAsociadas() => _cuentasAsociadas != null;

  void _initializeFields() {
    _interes = snapshotData['Interes'] as String?;
    _cuentasAsociadas = getDataList(snapshotData['CuentasAsociadas']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Intereses');

  static Stream<InteresesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InteresesRecord.fromSnapshot(s));

  static Future<InteresesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InteresesRecord.fromSnapshot(s));

  static InteresesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InteresesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InteresesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InteresesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InteresesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InteresesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInteresesRecordData({
  String? interes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Interes': interes,
    }.withoutNulls,
  );

  return firestoreData;
}

class InteresesRecordDocumentEquality implements Equality<InteresesRecord> {
  const InteresesRecordDocumentEquality();

  @override
  bool equals(InteresesRecord? e1, InteresesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.interes == e2?.interes &&
        listEquality.equals(e1?.cuentasAsociadas, e2?.cuentasAsociadas);
  }

  @override
  int hash(InteresesRecord? e) =>
      const ListEquality().hash([e?.interes, e?.cuentasAsociadas]);

  @override
  bool isValidKey(Object? o) => o is InteresesRecord;
}
