// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BusinessStruct extends FFFirebaseStruct {
  BusinessStruct({
    String? businessName,
    String? industry,
    String? businessAddress,
    String? businessImage,
    bool? promoted,
    bool? proLife,
    bool? proFamily,
    bool? proChurch,
    bool? proCharity,
    bool? sundays,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _businessName = businessName,
        _industry = industry,
        _businessAddress = businessAddress,
        _businessImage = businessImage,
        _promoted = promoted,
        _proLife = proLife,
        _proFamily = proFamily,
        _proChurch = proChurch,
        _proCharity = proCharity,
        _sundays = sundays,
        super(firestoreUtilData);

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  set businessName(String? val) => _businessName = val;

  bool hasBusinessName() => _businessName != null;

  // "industry" field.
  String? _industry;
  String get industry => _industry ?? '';
  set industry(String? val) => _industry = val;

  bool hasIndustry() => _industry != null;

  // "business_address" field.
  String? _businessAddress;
  String get businessAddress => _businessAddress ?? '';
  set businessAddress(String? val) => _businessAddress = val;

  bool hasBusinessAddress() => _businessAddress != null;

  // "business_image" field.
  String? _businessImage;
  String get businessImage => _businessImage ?? '';
  set businessImage(String? val) => _businessImage = val;

  bool hasBusinessImage() => _businessImage != null;

  // "promoted" field.
  bool? _promoted;
  bool get promoted => _promoted ?? false;
  set promoted(bool? val) => _promoted = val;

  bool hasPromoted() => _promoted != null;

  // "pro_life" field.
  bool? _proLife;
  bool get proLife => _proLife ?? false;
  set proLife(bool? val) => _proLife = val;

  bool hasProLife() => _proLife != null;

  // "pro_family" field.
  bool? _proFamily;
  bool get proFamily => _proFamily ?? false;
  set proFamily(bool? val) => _proFamily = val;

  bool hasProFamily() => _proFamily != null;

  // "pro_church" field.
  bool? _proChurch;
  bool get proChurch => _proChurch ?? false;
  set proChurch(bool? val) => _proChurch = val;

  bool hasProChurch() => _proChurch != null;

  // "pro_charity" field.
  bool? _proCharity;
  bool get proCharity => _proCharity ?? false;
  set proCharity(bool? val) => _proCharity = val;

  bool hasProCharity() => _proCharity != null;

  // "sundays" field.
  bool? _sundays;
  bool get sundays => _sundays ?? false;
  set sundays(bool? val) => _sundays = val;

  bool hasSundays() => _sundays != null;

  static BusinessStruct fromMap(Map<String, dynamic> data) => BusinessStruct(
        businessName: data['business_name'] as String?,
        industry: data['industry'] as String?,
        businessAddress: data['business_address'] as String?,
        businessImage: data['business_image'] as String?,
        promoted: data['promoted'] as bool?,
        proLife: data['pro_life'] as bool?,
        proFamily: data['pro_family'] as bool?,
        proChurch: data['pro_church'] as bool?,
        proCharity: data['pro_charity'] as bool?,
        sundays: data['sundays'] as bool?,
      );

  static BusinessStruct? maybeFromMap(dynamic data) =>
      data is Map ? BusinessStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'business_name': _businessName,
        'industry': _industry,
        'business_address': _businessAddress,
        'business_image': _businessImage,
        'promoted': _promoted,
        'pro_life': _proLife,
        'pro_family': _proFamily,
        'pro_church': _proChurch,
        'pro_charity': _proCharity,
        'sundays': _sundays,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'business_name': serializeParam(
          _businessName,
          ParamType.String,
        ),
        'industry': serializeParam(
          _industry,
          ParamType.String,
        ),
        'business_address': serializeParam(
          _businessAddress,
          ParamType.String,
        ),
        'business_image': serializeParam(
          _businessImage,
          ParamType.String,
        ),
        'promoted': serializeParam(
          _promoted,
          ParamType.bool,
        ),
        'pro_life': serializeParam(
          _proLife,
          ParamType.bool,
        ),
        'pro_family': serializeParam(
          _proFamily,
          ParamType.bool,
        ),
        'pro_church': serializeParam(
          _proChurch,
          ParamType.bool,
        ),
        'pro_charity': serializeParam(
          _proCharity,
          ParamType.bool,
        ),
        'sundays': serializeParam(
          _sundays,
          ParamType.bool,
        ),
      }.withoutNulls;

  static BusinessStruct fromSerializableMap(Map<String, dynamic> data) =>
      BusinessStruct(
        businessName: deserializeParam(
          data['business_name'],
          ParamType.String,
          false,
        ),
        industry: deserializeParam(
          data['industry'],
          ParamType.String,
          false,
        ),
        businessAddress: deserializeParam(
          data['business_address'],
          ParamType.String,
          false,
        ),
        businessImage: deserializeParam(
          data['business_image'],
          ParamType.String,
          false,
        ),
        promoted: deserializeParam(
          data['promoted'],
          ParamType.bool,
          false,
        ),
        proLife: deserializeParam(
          data['pro_life'],
          ParamType.bool,
          false,
        ),
        proFamily: deserializeParam(
          data['pro_family'],
          ParamType.bool,
          false,
        ),
        proChurch: deserializeParam(
          data['pro_church'],
          ParamType.bool,
          false,
        ),
        proCharity: deserializeParam(
          data['pro_charity'],
          ParamType.bool,
          false,
        ),
        sundays: deserializeParam(
          data['sundays'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'BusinessStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BusinessStruct &&
        businessName == other.businessName &&
        industry == other.industry &&
        businessAddress == other.businessAddress &&
        businessImage == other.businessImage &&
        promoted == other.promoted &&
        proLife == other.proLife &&
        proFamily == other.proFamily &&
        proChurch == other.proChurch &&
        proCharity == other.proCharity &&
        sundays == other.sundays;
  }

  @override
  int get hashCode => const ListEquality().hash([
        businessName,
        industry,
        businessAddress,
        businessImage,
        promoted,
        proLife,
        proFamily,
        proChurch,
        proCharity,
        sundays
      ]);
}

BusinessStruct createBusinessStruct({
  String? businessName,
  String? industry,
  String? businessAddress,
  String? businessImage,
  bool? promoted,
  bool? proLife,
  bool? proFamily,
  bool? proChurch,
  bool? proCharity,
  bool? sundays,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BusinessStruct(
      businessName: businessName,
      industry: industry,
      businessAddress: businessAddress,
      businessImage: businessImage,
      promoted: promoted,
      proLife: proLife,
      proFamily: proFamily,
      proChurch: proChurch,
      proCharity: proCharity,
      sundays: sundays,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BusinessStruct? updateBusinessStruct(
  BusinessStruct? business, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    business
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBusinessStructData(
  Map<String, dynamic> firestoreData,
  BusinessStruct? business,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (business == null) {
    return;
  }
  if (business.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && business.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final businessData = getBusinessFirestoreData(business, forFieldValue);
  final nestedData = businessData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = business.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBusinessFirestoreData(
  BusinessStruct? business, [
  bool forFieldValue = false,
]) {
  if (business == null) {
    return {};
  }
  final firestoreData = mapToFirestore(business.toMap());

  // Add any Firestore field values
  business.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBusinessListFirestoreData(
  List<BusinessStruct>? businesss,
) =>
    businesss?.map((e) => getBusinessFirestoreData(e, true)).toList() ?? [];
