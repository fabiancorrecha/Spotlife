import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackRecord extends FirestoreRecord {
  FeedbackRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "coment" field.
  String? _coment;
  String get coment => _coment ?? '';
  bool hasComent() => _coment != null;

  // "Spotlife" field.
  DocumentReference? _spotlife;
  DocumentReference? get spotlife => _spotlife;
  bool hasSpotlife() => _spotlife != null;

  void _initializeFields() {
    _usuario = snapshotData['Usuario'] as DocumentReference?;
    _rating = castToType<double>(snapshotData['rating']);
    _coment = snapshotData['coment'] as String?;
    _spotlife = snapshotData['Spotlife'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackRecord.fromSnapshot(s));

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackRecord.fromSnapshot(s));

  static FeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackRecordData({
  DocumentReference? usuario,
  double? rating,
  String? coment,
  DocumentReference? spotlife,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Usuario': usuario,
      'rating': rating,
      'coment': coment,
      'Spotlife': spotlife,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackRecordDocumentEquality implements Equality<FeedbackRecord> {
  const FeedbackRecordDocumentEquality();

  @override
  bool equals(FeedbackRecord? e1, FeedbackRecord? e2) {
    return e1?.usuario == e2?.usuario &&
        e1?.rating == e2?.rating &&
        e1?.coment == e2?.coment &&
        e1?.spotlife == e2?.spotlife;
  }

  @override
  int hash(FeedbackRecord? e) => const ListEquality()
      .hash([e?.usuario, e?.rating, e?.coment, e?.spotlife]);

  @override
  bool isValidKey(Object? o) => o is FeedbackRecord;
}
