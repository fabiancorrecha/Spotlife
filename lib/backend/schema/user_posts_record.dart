import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPostsRecord extends FirestoreRecord {
  UserPostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "postTitle" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "postDescription" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "postUser" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "timePosted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "numComments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "numeroLikes" field.
  int? _numeroLikes;
  int get numeroLikes => _numeroLikes ?? 0;
  bool hasNumeroLikes() => _numeroLikes != null;

  // "privacy" field.
  String? _privacy;
  String get privacy => _privacy ?? '';
  bool hasPrivacy() => _privacy != null;

  // "toFacebook" field.
  bool? _toFacebook;
  bool get toFacebook => _toFacebook ?? false;
  bool hasToFacebook() => _toFacebook != null;

  // "toInstagram" field.
  bool? _toInstagram;
  bool get toInstagram => _toInstagram ?? false;
  bool hasToInstagram() => _toInstagram != null;

  // "toTwitter" field.
  bool? _toTwitter;
  bool get toTwitter => _toTwitter ?? false;
  bool hasToTwitter() => _toTwitter != null;

  // "collections" field.
  List<DocumentReference>? _collections;
  List<DocumentReference> get collections => _collections ?? const [];
  bool hasCollections() => _collections != null;

  // "id_collection" field.
  String? _idCollection;
  String get idCollection => _idCollection ?? '';
  bool hasIdCollection() => _idCollection != null;

  // "FavoritoUser" field.
  List<DocumentReference>? _favoritoUser;
  List<DocumentReference> get favoritoUser => _favoritoUser ?? const [];
  bool hasFavoritoUser() => _favoritoUser != null;

  // "numeroFavorito" field.
  int? _numeroFavorito;
  int get numeroFavorito => _numeroFavorito ?? 0;
  bool hasNumeroFavorito() => _numeroFavorito != null;

  // "placeInfo" field.
  PlaceInfoStruct? _placeInfo;
  PlaceInfoStruct get placeInfo => _placeInfo ?? PlaceInfoStruct();
  bool hasPlaceInfo() => _placeInfo != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "esVideo" field.
  bool? _esVideo;
  bool get esVideo => _esVideo ?? false;
  bool hasEsVideo() => _esVideo != null;

  // "esPublico" field.
  bool? _esPublico;
  bool get esPublico => _esPublico ?? false;
  bool hasEsPublico() => _esPublico != null;

  // "esAmigos" field.
  bool? _esAmigos;
  bool get esAmigos => _esAmigos ?? false;
  bool hasEsAmigos() => _esAmigos != null;

  // "esPrivado" field.
  bool? _esPrivado;
  bool get esPrivado => _esPrivado ?? false;
  bool hasEsPrivado() => _esPrivado != null;

  // "PostPhotolist" field.
  List<String>? _postPhotolist;
  List<String> get postPhotolist => _postPhotolist ?? const [];
  bool hasPostPhotolist() => _postPhotolist != null;

  // "postPhoto" field.
  String? _postPhoto;
  String get postPhoto => _postPhoto ?? '';
  bool hasPostPhoto() => _postPhoto != null;

  // "usuarioEtiquetado" field.
  List<DocumentReference>? _usuarioEtiquetado;
  List<DocumentReference> get usuarioEtiquetado =>
      _usuarioEtiquetado ?? const [];
  bool hasUsuarioEtiquetado() => _usuarioEtiquetado != null;

  // "UbicacionActual" field.
  bool? _ubicacionActual;
  bool get ubicacionActual => _ubicacionActual ?? false;
  bool hasUbicacionActual() => _ubicacionActual != null;

  // "hiddenBy" field.
  List<DocumentReference>? _hiddenBy;
  List<DocumentReference> get hiddenBy => _hiddenBy ?? const [];
  bool hasHiddenBy() => _hiddenBy != null;

  // "BestFriend" field.
  List<DocumentReference>? _bestFriend;
  List<DocumentReference> get bestFriend => _bestFriend ?? const [];
  bool hasBestFriend() => _bestFriend != null;

  void _initializeFields() {
    _postTitle = snapshotData['postTitle'] as String?;
    _postDescription = snapshotData['postDescription'] as String?;
    _postUser = snapshotData['postUser'] as DocumentReference?;
    _timePosted = snapshotData['timePosted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _numComments = castToType<int>(snapshotData['numComments']);
    _numeroLikes = castToType<int>(snapshotData['numeroLikes']);
    _privacy = snapshotData['privacy'] as String?;
    _toFacebook = snapshotData['toFacebook'] as bool?;
    _toInstagram = snapshotData['toInstagram'] as bool?;
    _toTwitter = snapshotData['toTwitter'] as bool?;
    _collections = getDataList(snapshotData['collections']);
    _idCollection = snapshotData['id_collection'] as String?;
    _favoritoUser = getDataList(snapshotData['FavoritoUser']);
    _numeroFavorito = castToType<int>(snapshotData['numeroFavorito']);
    _placeInfo = snapshotData['placeInfo'] is PlaceInfoStruct
        ? snapshotData['placeInfo']
        : PlaceInfoStruct.maybeFromMap(snapshotData['placeInfo']);
    _video = snapshotData['video'] as String?;
    _esVideo = snapshotData['esVideo'] as bool?;
    _esPublico = snapshotData['esPublico'] as bool?;
    _esAmigos = snapshotData['esAmigos'] as bool?;
    _esPrivado = snapshotData['esPrivado'] as bool?;
    _postPhotolist = getDataList(snapshotData['PostPhotolist']);
    _postPhoto = snapshotData['postPhoto'] as String?;
    _usuarioEtiquetado = getDataList(snapshotData['usuarioEtiquetado']);
    _ubicacionActual = snapshotData['UbicacionActual'] as bool?;
    _hiddenBy = getDataList(snapshotData['hiddenBy']);
    _bestFriend = getDataList(snapshotData['BestFriend']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userPosts');

  static Stream<UserPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserPostsRecord.fromSnapshot(s));

  static Future<UserPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserPostsRecord.fromSnapshot(s));

  static UserPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserPostsRecord._(reference, mapFromFirestore(data));

  static UserPostsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UserPostsRecord.getDocumentFromData(
        {
          'postTitle': snapshot.data['postTitle'],
          'postDescription': snapshot.data['postDescription'],
          'postUser': convertAlgoliaParam(
            snapshot.data['postUser'],
            ParamType.DocumentReference,
            false,
          ),
          'timePosted': convertAlgoliaParam(
            snapshot.data['timePosted'],
            ParamType.DateTime,
            false,
          ),
          'likes': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['likes'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'numComments': convertAlgoliaParam(
            snapshot.data['numComments'],
            ParamType.int,
            false,
          ),
          'numeroLikes': convertAlgoliaParam(
            snapshot.data['numeroLikes'],
            ParamType.int,
            false,
          ),
          'privacy': snapshot.data['privacy'],
          'toFacebook': snapshot.data['toFacebook'],
          'toInstagram': snapshot.data['toInstagram'],
          'toTwitter': snapshot.data['toTwitter'],
          'collections': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['collections'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'id_collection': snapshot.data['id_collection'],
          'FavoritoUser': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['FavoritoUser'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'numeroFavorito': convertAlgoliaParam(
            snapshot.data['numeroFavorito'],
            ParamType.int,
            false,
          ),
          'placeInfo':
              PlaceInfoStruct.fromAlgoliaData(snapshot.data['placeInfo'] ?? {})
                  .toMap(),
          'video': snapshot.data['video'],
          'esVideo': snapshot.data['esVideo'],
          'esPublico': snapshot.data['esPublico'],
          'esAmigos': snapshot.data['esAmigos'],
          'esPrivado': snapshot.data['esPrivado'],
          'PostPhotolist': safeGet(
            () => snapshot.data['PostPhotolist'].toList(),
          ),
          'postPhoto': snapshot.data['postPhoto'],
          'usuarioEtiquetado': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['usuarioEtiquetado'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'UbicacionActual': snapshot.data['UbicacionActual'],
          'hiddenBy': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['hiddenBy'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'BestFriend': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['BestFriend'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
        },
        UserPostsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UserPostsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'userPosts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UserPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserPostsRecordData({
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  int? numeroLikes,
  String? privacy,
  bool? toFacebook,
  bool? toInstagram,
  bool? toTwitter,
  String? idCollection,
  int? numeroFavorito,
  PlaceInfoStruct? placeInfo,
  String? video,
  bool? esVideo,
  bool? esPublico,
  bool? esAmigos,
  bool? esPrivado,
  String? postPhoto,
  bool? ubicacionActual,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postTitle': postTitle,
      'postDescription': postDescription,
      'postUser': postUser,
      'timePosted': timePosted,
      'numComments': numComments,
      'numeroLikes': numeroLikes,
      'privacy': privacy,
      'toFacebook': toFacebook,
      'toInstagram': toInstagram,
      'toTwitter': toTwitter,
      'id_collection': idCollection,
      'numeroFavorito': numeroFavorito,
      'placeInfo': PlaceInfoStruct().toMap(),
      'video': video,
      'esVideo': esVideo,
      'esPublico': esPublico,
      'esAmigos': esAmigos,
      'esPrivado': esPrivado,
      'postPhoto': postPhoto,
      'UbicacionActual': ubicacionActual,
    }.withoutNulls,
  );

  // Handle nested data for "placeInfo" field.
  addPlaceInfoStructData(firestoreData, placeInfo, 'placeInfo');

  return firestoreData;
}

class UserPostsRecordDocumentEquality implements Equality<UserPostsRecord> {
  const UserPostsRecordDocumentEquality();

  @override
  bool equals(UserPostsRecord? e1, UserPostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.postUser == e2?.postUser &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.numComments == e2?.numComments &&
        e1?.numeroLikes == e2?.numeroLikes &&
        e1?.privacy == e2?.privacy &&
        e1?.toFacebook == e2?.toFacebook &&
        e1?.toInstagram == e2?.toInstagram &&
        e1?.toTwitter == e2?.toTwitter &&
        listEquality.equals(e1?.collections, e2?.collections) &&
        e1?.idCollection == e2?.idCollection &&
        listEquality.equals(e1?.favoritoUser, e2?.favoritoUser) &&
        e1?.numeroFavorito == e2?.numeroFavorito &&
        e1?.placeInfo == e2?.placeInfo &&
        e1?.video == e2?.video &&
        e1?.esVideo == e2?.esVideo &&
        e1?.esPublico == e2?.esPublico &&
        e1?.esAmigos == e2?.esAmigos &&
        e1?.esPrivado == e2?.esPrivado &&
        listEquality.equals(e1?.postPhotolist, e2?.postPhotolist) &&
        e1?.postPhoto == e2?.postPhoto &&
        listEquality.equals(e1?.usuarioEtiquetado, e2?.usuarioEtiquetado) &&
        e1?.ubicacionActual == e2?.ubicacionActual &&
        listEquality.equals(e1?.hiddenBy, e2?.hiddenBy) &&
        listEquality.equals(e1?.bestFriend, e2?.bestFriend);
  }

  @override
  int hash(UserPostsRecord? e) => const ListEquality().hash([
        e?.postTitle,
        e?.postDescription,
        e?.postUser,
        e?.timePosted,
        e?.likes,
        e?.numComments,
        e?.numeroLikes,
        e?.privacy,
        e?.toFacebook,
        e?.toInstagram,
        e?.toTwitter,
        e?.collections,
        e?.idCollection,
        e?.favoritoUser,
        e?.numeroFavorito,
        e?.placeInfo,
        e?.video,
        e?.esVideo,
        e?.esPublico,
        e?.esAmigos,
        e?.esPrivado,
        e?.postPhotolist,
        e?.postPhoto,
        e?.usuarioEtiquetado,
        e?.ubicacionActual,
        e?.hiddenBy,
        e?.bestFriend
      ]);

  @override
  bool isValidKey(Object? o) => o is UserPostsRecord;
}
