import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StoryCommentsRecord extends FirestoreRecord {
  StoryCommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "storyAssociation" field.
  DocumentReference? _storyAssociation;
  DocumentReference? get storyAssociation => _storyAssociation;
  bool hasStoryAssociation() => _storyAssociation != null;

  // "commentUser" field.
  DocumentReference? _commentUser;
  DocumentReference? get commentUser => _commentUser;
  bool hasCommentUser() => _commentUser != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "timePosted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  void _initializeFields() {
    _storyAssociation = snapshotData['storyAssociation'] as DocumentReference?;
    _commentUser = snapshotData['commentUser'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _timePosted = snapshotData['timePosted'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('storyComments');

  static Stream<StoryCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoryCommentsRecord.fromSnapshot(s));

  static Future<StoryCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoryCommentsRecord.fromSnapshot(s));

  static StoryCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StoryCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoryCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoryCommentsRecord._(reference, mapFromFirestore(data));

  static StoryCommentsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      StoryCommentsRecord.getDocumentFromData(
        {
          'storyAssociation': convertAlgoliaParam(
            snapshot.data['storyAssociation'],
            ParamType.DocumentReference,
            false,
          ),
          'commentUser': convertAlgoliaParam(
            snapshot.data['commentUser'],
            ParamType.DocumentReference,
            false,
          ),
          'comment': snapshot.data['comment'],
          'timePosted': convertAlgoliaParam(
            snapshot.data['timePosted'],
            ParamType.DateTime,
            false,
          ),
        },
        StoryCommentsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<StoryCommentsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'storyComments',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'StoryCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoryCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoryCommentsRecordData({
  DocumentReference? storyAssociation,
  DocumentReference? commentUser,
  String? comment,
  DateTime? timePosted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'storyAssociation': storyAssociation,
      'commentUser': commentUser,
      'comment': comment,
      'timePosted': timePosted,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoryCommentsRecordDocumentEquality
    implements Equality<StoryCommentsRecord> {
  const StoryCommentsRecordDocumentEquality();

  @override
  bool equals(StoryCommentsRecord? e1, StoryCommentsRecord? e2) {
    return e1?.storyAssociation == e2?.storyAssociation &&
        e1?.commentUser == e2?.commentUser &&
        e1?.comment == e2?.comment &&
        e1?.timePosted == e2?.timePosted;
  }

  @override
  int hash(StoryCommentsRecord? e) => const ListEquality()
      .hash([e?.storyAssociation, e?.commentUser, e?.comment, e?.timePosted]);

  @override
  bool isValidKey(Object? o) => o is StoryCommentsRecord;
}
