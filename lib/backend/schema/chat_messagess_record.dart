import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagessRecord extends FirestoreRecord {
  ChatMessagessRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "uidOfSender" field.
  DocumentReference? _uidOfSender;
  DocumentReference? get uidOfSender => _uidOfSender;
  bool hasUidOfSender() => _uidOfSender != null;

  // "nameOfSender" field.
  String? _nameOfSender;
  String get nameOfSender => _nameOfSender ?? '';
  bool hasNameOfSender() => _nameOfSender != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _uidOfSender = snapshotData['uidOfSender'] as DocumentReference?;
    _nameOfSender = snapshotData['nameOfSender'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chatMessagess')
          : FirebaseFirestore.instance.collectionGroup('chatMessagess');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chatMessagess').doc(id);

  static Stream<ChatMessagessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessagessRecord.fromSnapshot(s));

  static Future<ChatMessagessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessagessRecord.fromSnapshot(s));

  static ChatMessagessRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessagessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessagessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMessagessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessagessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessagessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMessagessRecordData({
  String? message,
  DateTime? timeStamp,
  DocumentReference? uidOfSender,
  String? nameOfSender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'timeStamp': timeStamp,
      'uidOfSender': uidOfSender,
      'nameOfSender': nameOfSender,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessagessRecordDocumentEquality
    implements Equality<ChatMessagessRecord> {
  const ChatMessagessRecordDocumentEquality();

  @override
  bool equals(ChatMessagessRecord? e1, ChatMessagessRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.uidOfSender == e2?.uidOfSender &&
        e1?.nameOfSender == e2?.nameOfSender;
  }

  @override
  int hash(ChatMessagessRecord? e) => const ListEquality()
      .hash([e?.message, e?.timeStamp, e?.uidOfSender, e?.nameOfSender]);

  @override
  bool isValidKey(Object? o) => o is ChatMessagessRecord;
}
