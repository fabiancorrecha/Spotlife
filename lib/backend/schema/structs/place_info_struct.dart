// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceInfoStruct extends FFFirebaseStruct {
  PlaceInfoStruct({
    String? name,
    String? address,
    String? city,
    String? state,
    String? country,
    String? zipcode,
    LatLng? latLng,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _address = address,
        _city = city,
        _state = state,
        _country = country,
        _zipcode = zipcode,
        _latLng = latLng,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "zipcode" field.
  String? _zipcode;
  String get zipcode => _zipcode ?? '';
  set zipcode(String? val) => _zipcode = val;

  bool hasZipcode() => _zipcode != null;

  // "latLng" field.
  LatLng? _latLng;
  LatLng? get latLng => _latLng;
  set latLng(LatLng? val) => _latLng = val;

  bool hasLatLng() => _latLng != null;

  static PlaceInfoStruct fromMap(Map<String, dynamic> data) => PlaceInfoStruct(
        name: data['name'] as String?,
        address: data['address'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        country: data['country'] as String?,
        zipcode: data['zipcode'] as String?,
        latLng: data['latLng'] as LatLng?,
      );

  static PlaceInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? PlaceInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'address': _address,
        'city': _city,
        'state': _state,
        'country': _country,
        'zipcode': _zipcode,
        'latLng': _latLng,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'zipcode': serializeParam(
          _zipcode,
          ParamType.String,
        ),
        'latLng': serializeParam(
          _latLng,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static PlaceInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaceInfoStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        zipcode: deserializeParam(
          data['zipcode'],
          ParamType.String,
          false,
        ),
        latLng: deserializeParam(
          data['latLng'],
          ParamType.LatLng,
          false,
        ),
      );

  static PlaceInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PlaceInfoStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        address: convertAlgoliaParam(
          data['address'],
          ParamType.String,
          false,
        ),
        city: convertAlgoliaParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: convertAlgoliaParam(
          data['state'],
          ParamType.String,
          false,
        ),
        country: convertAlgoliaParam(
          data['country'],
          ParamType.String,
          false,
        ),
        zipcode: convertAlgoliaParam(
          data['zipcode'],
          ParamType.String,
          false,
        ),
        latLng: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PlaceInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlaceInfoStruct &&
        name == other.name &&
        address == other.address &&
        city == other.city &&
        state == other.state &&
        country == other.country &&
        zipcode == other.zipcode &&
        latLng == other.latLng;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, address, city, state, country, zipcode, latLng]);
}

PlaceInfoStruct createPlaceInfoStruct({
  String? name,
  String? address,
  String? city,
  String? state,
  String? country,
  String? zipcode,
  LatLng? latLng,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlaceInfoStruct(
      name: name,
      address: address,
      city: city,
      state: state,
      country: country,
      zipcode: zipcode,
      latLng: latLng,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlaceInfoStruct? updatePlaceInfoStruct(
  PlaceInfoStruct? placeInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    placeInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlaceInfoStructData(
  Map<String, dynamic> firestoreData,
  PlaceInfoStruct? placeInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (placeInfo == null) {
    return;
  }
  if (placeInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && placeInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placeInfoData = getPlaceInfoFirestoreData(placeInfo, forFieldValue);
  final nestedData = placeInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = placeInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlaceInfoFirestoreData(
  PlaceInfoStruct? placeInfo, [
  bool forFieldValue = false,
]) {
  if (placeInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(placeInfo.toMap());

  // Add any Firestore field values
  placeInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlaceInfoListFirestoreData(
  List<PlaceInfoStruct>? placeInfos,
) =>
    placeInfos?.map((e) => getPlaceInfoFirestoreData(e, true)).toList() ?? [];
