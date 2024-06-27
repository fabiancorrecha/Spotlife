import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DbRecord extends FirestoreRecord {
  DbRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "listaIntereses" field.
  List<String>? _listaIntereses;
  List<String> get listaIntereses => _listaIntereses ?? const [];
  bool hasListaIntereses() => _listaIntereses != null;

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  void _initializeFields() {
    _listaIntereses = getDataList(snapshotData['listaIntereses']);
    _nombre = snapshotData['Nombre'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('DB');

  static Stream<DbRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DbRecord.fromSnapshot(s));

  static Future<DbRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DbRecord.fromSnapshot(s));

  static DbRecord fromSnapshot(DocumentSnapshot snapshot) => DbRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DbRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DbRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DbRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DbRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDbRecordData({
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class DbRecordDocumentEquality implements Equality<DbRecord> {
  const DbRecordDocumentEquality();

  @override
  bool equals(DbRecord? e1, DbRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.listaIntereses, e2?.listaIntereses) &&
        e1?.nombre == e2?.nombre;
  }

  @override
  int hash(DbRecord? e) =>
      const ListEquality().hash([e?.listaIntereses, e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is DbRecord;
}
