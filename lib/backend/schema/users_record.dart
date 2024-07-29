import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "isFollowed" field.
  bool? _isFollowed;
  bool get isFollowed => _isFollowed ?? false;
  bool hasIsFollowed() => _isFollowed != null;

  // "isProfileComplete" field.
  bool? _isProfileComplete;
  bool get isProfileComplete => _isProfileComplete ?? false;
  bool hasIsProfileComplete() => _isProfileComplete != null;

  // "isAccountCreateWithPhone" field.
  bool? _isAccountCreateWithPhone;
  bool get isAccountCreateWithPhone => _isAccountCreateWithPhone ?? false;
  bool hasIsAccountCreateWithPhone() => _isAccountCreateWithPhone != null;

  // "listaSeguidos" field.
  List<DocumentReference>? _listaSeguidos;
  List<DocumentReference> get listaSeguidos => _listaSeguidos ?? const [];
  bool hasListaSeguidos() => _listaSeguidos != null;

  // "listaSeguidores" field.
  List<DocumentReference>? _listaSeguidores;
  List<DocumentReference> get listaSeguidores => _listaSeguidores ?? const [];
  bool hasListaSeguidores() => _listaSeguidores != null;

  // "web" field.
  String? _web;
  String get web => _web ?? '';
  bool hasWeb() => _web != null;

  // "bg_URL" field.
  String? _bgURL;
  String get bgURL => _bgURL ?? '';
  bool hasBgURL() => _bgURL != null;

  // "listaBloqueados" field.
  List<DocumentReference>? _listaBloqueados;
  List<DocumentReference> get listaBloqueados => _listaBloqueados ?? const [];
  bool hasListaBloqueados() => _listaBloqueados != null;

  // "numeroNotiticaciones" field.
  int? _numeroNotiticaciones;
  int get numeroNotiticaciones => _numeroNotiticaciones ?? 0;
  bool hasNumeroNotiticaciones() => _numeroNotiticaciones != null;

  // "listaPostFavoritos" field.
  List<DocumentReference>? _listaPostFavoritos;
  List<DocumentReference> get listaPostFavoritos =>
      _listaPostFavoritos ?? const [];
  bool hasListaPostFavoritos() => _listaPostFavoritos != null;

  // "listCollections" field.
  List<DocumentReference>? _listCollections;
  List<DocumentReference> get listCollections => _listCollections ?? const [];
  bool hasListCollections() => _listCollections != null;

  // "referente" field.
  DocumentReference? _referente;
  DocumentReference? get referente => _referente;
  bool hasReferente() => _referente != null;

  // "listaReferidos" field.
  List<DocumentReference>? _listaReferidos;
  List<DocumentReference> get listaReferidos => _listaReferidos ?? const [];
  bool hasListaReferidos() => _listaReferidos != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "numberOfRating" field.
  int? _numberOfRating;
  int get numberOfRating => _numberOfRating ?? 0;
  bool hasNumberOfRating() => _numberOfRating != null;

  // "rol" field.
  String? _rol;
  String get rol => _rol ?? '';
  bool hasRol() => _rol != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "CuentaPrivada" field.
  bool? _cuentaPrivada;
  bool get cuentaPrivada => _cuentaPrivada ?? false;
  bool hasCuentaPrivada() => _cuentaPrivada != null;

  // "ListadeUsuarioenEspera" field.
  List<DocumentReference>? _listadeUsuarioenEspera;
  List<DocumentReference> get listadeUsuarioenEspera =>
      _listadeUsuarioenEspera ?? const [];
  bool hasListadeUsuarioenEspera() => _listadeUsuarioenEspera != null;

  // "EstatusDeSesion" field.
  String? _estatusDeSesion;
  String get estatusDeSesion => _estatusDeSesion ?? '';
  bool hasEstatusDeSesion() => _estatusDeSesion != null;

  // "FechaUltimaSesion" field.
  DateTime? _fechaUltimaSesion;
  DateTime? get fechaUltimaSesion => _fechaUltimaSesion;
  bool hasFechaUltimaSesion() => _fechaUltimaSesion != null;

  // "MisIntereses" field.
  List<DocumentReference>? _misIntereses;
  List<DocumentReference> get misIntereses => _misIntereses ?? const [];
  bool hasMisIntereses() => _misIntereses != null;

  // "SuscripcionActiva" field.
  bool? _suscripcionActiva;
  bool get suscripcionActiva => _suscripcionActiva ?? false;
  bool hasSuscripcionActiva() => _suscripcionActiva != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userName = snapshotData['userName'] as String?;
    _bio = snapshotData['bio'] as String?;
    _isFollowed = snapshotData['isFollowed'] as bool?;
    _isProfileComplete = snapshotData['isProfileComplete'] as bool?;
    _isAccountCreateWithPhone =
        snapshotData['isAccountCreateWithPhone'] as bool?;
    _listaSeguidos = getDataList(snapshotData['listaSeguidos']);
    _listaSeguidores = getDataList(snapshotData['listaSeguidores']);
    _web = snapshotData['web'] as String?;
    _bgURL = snapshotData['bg_URL'] as String?;
    _listaBloqueados = getDataList(snapshotData['listaBloqueados']);
    _numeroNotiticaciones =
        castToType<int>(snapshotData['numeroNotiticaciones']);
    _listaPostFavoritos = getDataList(snapshotData['listaPostFavoritos']);
    _listCollections = getDataList(snapshotData['listCollections']);
    _referente = snapshotData['referente'] as DocumentReference?;
    _listaReferidos = getDataList(snapshotData['listaReferidos']);
    _rating = castToType<double>(snapshotData['rating']);
    _numberOfRating = castToType<int>(snapshotData['numberOfRating']);
    _rol = snapshotData['rol'] as String?;
    _password = snapshotData['password'] as String?;
    _cuentaPrivada = snapshotData['CuentaPrivada'] as bool?;
    _listadeUsuarioenEspera =
        getDataList(snapshotData['ListadeUsuarioenEspera']);
    _estatusDeSesion = snapshotData['EstatusDeSesion'] as String?;
    _fechaUltimaSesion = snapshotData['FechaUltimaSesion'] as DateTime?;
    _misIntereses = getDataList(snapshotData['MisIntereses']);
    _suscripcionActiva = snapshotData['SuscripcionActiva'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'display_name': snapshot.data['display_name'],
          'email': snapshot.data['email'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'userName': snapshot.data['userName'],
          'bio': snapshot.data['bio'],
          'isFollowed': snapshot.data['isFollowed'],
          'isProfileComplete': snapshot.data['isProfileComplete'],
          'isAccountCreateWithPhone': snapshot.data['isAccountCreateWithPhone'],
          'listaSeguidos': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['listaSeguidos'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'listaSeguidores': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['listaSeguidores'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'web': snapshot.data['web'],
          'bg_URL': snapshot.data['bg_URL'],
          'listaBloqueados': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['listaBloqueados'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'numeroNotiticaciones': convertAlgoliaParam(
            snapshot.data['numeroNotiticaciones'],
            ParamType.int,
            false,
          ),
          'listaPostFavoritos': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['listaPostFavoritos'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'listCollections': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['listCollections'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'referente': convertAlgoliaParam(
            snapshot.data['referente'],
            ParamType.DocumentReference,
            false,
          ),
          'listaReferidos': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['listaReferidos'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'rating': convertAlgoliaParam(
            snapshot.data['rating'],
            ParamType.double,
            false,
          ),
          'numberOfRating': convertAlgoliaParam(
            snapshot.data['numberOfRating'],
            ParamType.int,
            false,
          ),
          'rol': snapshot.data['rol'],
          'password': snapshot.data['password'],
          'CuentaPrivada': snapshot.data['CuentaPrivada'],
          'ListadeUsuarioenEspera': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['ListadeUsuarioenEspera'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'EstatusDeSesion': snapshot.data['EstatusDeSesion'],
          'FechaUltimaSesion': convertAlgoliaParam(
            snapshot.data['FechaUltimaSesion'],
            ParamType.DateTime,
            false,
          ),
          'MisIntereses': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['MisIntereses'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'SuscripcionActiva': snapshot.data['SuscripcionActiva'],
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? displayName,
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userName,
  String? bio,
  bool? isFollowed,
  bool? isProfileComplete,
  bool? isAccountCreateWithPhone,
  String? web,
  String? bgURL,
  int? numeroNotiticaciones,
  DocumentReference? referente,
  double? rating,
  int? numberOfRating,
  String? rol,
  String? password,
  bool? cuentaPrivada,
  String? estatusDeSesion,
  DateTime? fechaUltimaSesion,
  bool? suscripcionActiva,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'userName': userName,
      'bio': bio,
      'isFollowed': isFollowed,
      'isProfileComplete': isProfileComplete,
      'isAccountCreateWithPhone': isAccountCreateWithPhone,
      'web': web,
      'bg_URL': bgURL,
      'numeroNotiticaciones': numeroNotiticaciones,
      'referente': referente,
      'rating': rating,
      'numberOfRating': numberOfRating,
      'rol': rol,
      'password': password,
      'CuentaPrivada': cuentaPrivada,
      'EstatusDeSesion': estatusDeSesion,
      'FechaUltimaSesion': fechaUltimaSesion,
      'SuscripcionActiva': suscripcionActiva,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.displayName == e2?.displayName &&
        e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userName == e2?.userName &&
        e1?.bio == e2?.bio &&
        e1?.isFollowed == e2?.isFollowed &&
        e1?.isProfileComplete == e2?.isProfileComplete &&
        e1?.isAccountCreateWithPhone == e2?.isAccountCreateWithPhone &&
        listEquality.equals(e1?.listaSeguidos, e2?.listaSeguidos) &&
        listEquality.equals(e1?.listaSeguidores, e2?.listaSeguidores) &&
        e1?.web == e2?.web &&
        e1?.bgURL == e2?.bgURL &&
        listEquality.equals(e1?.listaBloqueados, e2?.listaBloqueados) &&
        e1?.numeroNotiticaciones == e2?.numeroNotiticaciones &&
        listEquality.equals(e1?.listaPostFavoritos, e2?.listaPostFavoritos) &&
        listEquality.equals(e1?.listCollections, e2?.listCollections) &&
        e1?.referente == e2?.referente &&
        listEquality.equals(e1?.listaReferidos, e2?.listaReferidos) &&
        e1?.rating == e2?.rating &&
        e1?.numberOfRating == e2?.numberOfRating &&
        e1?.rol == e2?.rol &&
        e1?.password == e2?.password &&
        e1?.cuentaPrivada == e2?.cuentaPrivada &&
        listEquality.equals(
            e1?.listadeUsuarioenEspera, e2?.listadeUsuarioenEspera) &&
        e1?.estatusDeSesion == e2?.estatusDeSesion &&
        e1?.fechaUltimaSesion == e2?.fechaUltimaSesion &&
        listEquality.equals(e1?.misIntereses, e2?.misIntereses) &&
        e1?.suscripcionActiva == e2?.suscripcionActiva;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userName,
        e?.bio,
        e?.isFollowed,
        e?.isProfileComplete,
        e?.isAccountCreateWithPhone,
        e?.listaSeguidos,
        e?.listaSeguidores,
        e?.web,
        e?.bgURL,
        e?.listaBloqueados,
        e?.numeroNotiticaciones,
        e?.listaPostFavoritos,
        e?.listCollections,
        e?.referente,
        e?.listaReferidos,
        e?.rating,
        e?.numberOfRating,
        e?.rol,
        e?.password,
        e?.cuentaPrivada,
        e?.listadeUsuarioenEspera,
        e?.estatusDeSesion,
        e?.fechaUltimaSesion,
        e?.misIntereses,
        e?.suscripcionActiva
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
