import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FriendsRecord extends FirestoreRecord {
  FriendsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "follower" field.
  DocumentReference? _follower;
  DocumentReference? get follower => _follower;
  bool hasFollower() => _follower != null;

  // "followee" field.
  DocumentReference? _followee;
  DocumentReference? get followee => _followee;
  bool hasFollowee() => _followee != null;

  void _initializeFields() {
    _follower = snapshotData['follower'] as DocumentReference?;
    _followee = snapshotData['followee'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('friends');

  static Stream<FriendsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendsRecord.fromSnapshot(s));

  static Future<FriendsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendsRecord.fromSnapshot(s));

  static FriendsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendsRecord._(reference, mapFromFirestore(data));

  static FriendsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      FriendsRecord.getDocumentFromData(
        {
          'follower': convertAlgoliaParam(
            snapshot.data['follower'],
            ParamType.DocumentReference,
            false,
          ),
          'followee': convertAlgoliaParam(
            snapshot.data['followee'],
            ParamType.DocumentReference,
            false,
          ),
        },
        FriendsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<FriendsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'friends',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'FriendsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendsRecordData({
  DocumentReference? follower,
  DocumentReference? followee,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'follower': follower,
      'followee': followee,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendsRecordDocumentEquality implements Equality<FriendsRecord> {
  const FriendsRecordDocumentEquality();

  @override
  bool equals(FriendsRecord? e1, FriendsRecord? e2) {
    return e1?.follower == e2?.follower && e1?.followee == e2?.followee;
  }

  @override
  int hash(FriendsRecord? e) =>
      const ListEquality().hash([e?.follower, e?.followee]);

  @override
  bool isValidKey(Object? o) => o is FriendsRecord;
}
