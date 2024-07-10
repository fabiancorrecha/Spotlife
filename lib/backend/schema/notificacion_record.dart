import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificacionRecord extends FirestoreRecord {
  NotificacionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tipo" field.
  int? _tipo;
  int get tipo => _tipo ?? 0;
  bool hasTipo() => _tipo != null;

  // "emisor" field.
  DocumentReference? _emisor;
  DocumentReference? get emisor => _emisor;
  bool hasEmisor() => _emisor != null;

  // "receptor" field.
  DocumentReference? _receptor;
  DocumentReference? get receptor => _receptor;
  bool hasReceptor() => _receptor != null;

  // "leido" field.
  bool? _leido;
  bool get leido => _leido ?? false;
  bool hasLeido() => _leido != null;

  // "fechaCreacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  void _initializeFields() {
    _tipo = castToType<int>(snapshotData['tipo']);
    _emisor = snapshotData['emisor'] as DocumentReference?;
    _receptor = snapshotData['receptor'] as DocumentReference?;
    _leido = snapshotData['leido'] as bool?;
    _fechaCreacion = snapshotData['fechaCreacion'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notificacion');

  static Stream<NotificacionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificacionRecord.fromSnapshot(s));

  static Future<NotificacionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificacionRecord.fromSnapshot(s));

  static NotificacionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificacionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificacionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificacionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificacionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificacionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificacionRecordData({
  int? tipo,
  DocumentReference? emisor,
  DocumentReference? receptor,
  bool? leido,
  DateTime? fechaCreacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo': tipo,
      'emisor': emisor,
      'receptor': receptor,
      'leido': leido,
      'fechaCreacion': fechaCreacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificacionRecordDocumentEquality
    implements Equality<NotificacionRecord> {
  const NotificacionRecordDocumentEquality();

  @override
  bool equals(NotificacionRecord? e1, NotificacionRecord? e2) {
    return e1?.tipo == e2?.tipo &&
        e1?.emisor == e2?.emisor &&
        e1?.receptor == e2?.receptor &&
        e1?.leido == e2?.leido &&
        e1?.fechaCreacion == e2?.fechaCreacion;
  }

  @override
  int hash(NotificacionRecord? e) => const ListEquality()
      .hash([e?.tipo, e?.emisor, e?.receptor, e?.leido, e?.fechaCreacion]);

  @override
  bool isValidKey(Object? o) => o is NotificacionRecord;
}
