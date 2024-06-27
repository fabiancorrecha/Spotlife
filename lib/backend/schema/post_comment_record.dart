import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostCommentRecord extends FirestoreRecord {
  PostCommentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "textComment" field.
  String? _textComment;
  String get textComment => _textComment ?? '';
  bool hasTextComment() => _textComment != null;

  // "userCreator" field.
  DocumentReference? _userCreator;
  DocumentReference? get userCreator => _userCreator;
  bool hasUserCreator() => _userCreator != null;

  // "post" field.
  DocumentReference? _post;
  DocumentReference? get post => _post;
  bool hasPost() => _post != null;

  // "dateCreation" field.
  DateTime? _dateCreation;
  DateTime? get dateCreation => _dateCreation;
  bool hasDateCreation() => _dateCreation != null;

  // "lastEditTime" field.
  DateTime? _lastEditTime;
  DateTime? get lastEditTime => _lastEditTime;
  bool hasLastEditTime() => _lastEditTime != null;

  // "likesList" field.
  List<DocumentReference>? _likesList;
  List<DocumentReference> get likesList => _likesList ?? const [];
  bool hasLikesList() => _likesList != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _textComment = snapshotData['textComment'] as String?;
    _userCreator = snapshotData['userCreator'] as DocumentReference?;
    _post = snapshotData['post'] as DocumentReference?;
    _dateCreation = snapshotData['dateCreation'] as DateTime?;
    _lastEditTime = snapshotData['lastEditTime'] as DateTime?;
    _likesList = getDataList(snapshotData['likesList']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('postComment')
          : FirebaseFirestore.instance.collectionGroup('postComment');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('postComment').doc(id);

  static Stream<PostCommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostCommentRecord.fromSnapshot(s));

  static Future<PostCommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostCommentRecord.fromSnapshot(s));

  static PostCommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostCommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostCommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostCommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostCommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostCommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostCommentRecordData({
  String? textComment,
  DocumentReference? userCreator,
  DocumentReference? post,
  DateTime? dateCreation,
  DateTime? lastEditTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'textComment': textComment,
      'userCreator': userCreator,
      'post': post,
      'dateCreation': dateCreation,
      'lastEditTime': lastEditTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostCommentRecordDocumentEquality implements Equality<PostCommentRecord> {
  const PostCommentRecordDocumentEquality();

  @override
  bool equals(PostCommentRecord? e1, PostCommentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.textComment == e2?.textComment &&
        e1?.userCreator == e2?.userCreator &&
        e1?.post == e2?.post &&
        e1?.dateCreation == e2?.dateCreation &&
        e1?.lastEditTime == e2?.lastEditTime &&
        listEquality.equals(e1?.likesList, e2?.likesList);
  }

  @override
  int hash(PostCommentRecord? e) => const ListEquality().hash([
        e?.textComment,
        e?.userCreator,
        e?.post,
        e?.dateCreation,
        e?.lastEditTime,
        e?.likesList
      ]);

  @override
  bool isValidKey(Object? o) => o is PostCommentRecord;
}
