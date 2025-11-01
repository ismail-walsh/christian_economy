import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessRecord extends FirestoreRecord {
  BusinessRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "serviceName" field.
  String? _serviceName;
  String get serviceName => _serviceName ?? '';
  bool hasServiceName() => _serviceName != null;

  // "serviceDescription" field.
  String? _serviceDescription;
  String get serviceDescription => _serviceDescription ?? '';
  bool hasServiceDescription() => _serviceDescription != null;

  // "serviceCost" field.
  double? _serviceCost;
  double get serviceCost => _serviceCost ?? 0.0;
  bool hasServiceCost() => _serviceCost != null;

  // "affirmations" field.
  DocumentReference? _affirmations;
  DocumentReference? get affirmations => _affirmations;
  bool hasAffirmations() => _affirmations != null;

  // "businessName" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "businessDescription" field.
  String? _businessDescription;
  String get businessDescription => _businessDescription ?? '';
  bool hasBusinessDescription() => _businessDescription != null;

  // "businessLocation" field.
  String? _businessLocation;
  String get businessLocation => _businessLocation ?? '';
  bool hasBusinessLocation() => _businessLocation != null;

  void _initializeFields() {
    _serviceName = snapshotData['serviceName'] as String?;
    _serviceDescription = snapshotData['serviceDescription'] as String?;
    _serviceCost = castToType<double>(snapshotData['serviceCost']);
    _affirmations = snapshotData['affirmations'] as DocumentReference?;
    _businessName = snapshotData['businessName'] as String?;
    _businessDescription = snapshotData['businessDescription'] as String?;
    _businessLocation = snapshotData['businessLocation'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('business');

  static Stream<BusinessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessRecord.fromSnapshot(s));

  static Future<BusinessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BusinessRecord.fromSnapshot(s));

  static BusinessRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessRecordData({
  String? serviceName,
  String? serviceDescription,
  double? serviceCost,
  DocumentReference? affirmations,
  String? businessName,
  String? businessDescription,
  String? businessLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'serviceCost': serviceCost,
      'affirmations': affirmations,
      'businessName': businessName,
      'businessDescription': businessDescription,
      'businessLocation': businessLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessRecordDocumentEquality implements Equality<BusinessRecord> {
  const BusinessRecordDocumentEquality();

  @override
  bool equals(BusinessRecord? e1, BusinessRecord? e2) {
    return e1?.serviceName == e2?.serviceName &&
        e1?.serviceDescription == e2?.serviceDescription &&
        e1?.serviceCost == e2?.serviceCost &&
        e1?.affirmations == e2?.affirmations &&
        e1?.businessName == e2?.businessName &&
        e1?.businessDescription == e2?.businessDescription &&
        e1?.businessLocation == e2?.businessLocation;
  }

  @override
  int hash(BusinessRecord? e) => const ListEquality().hash([
        e?.serviceName,
        e?.serviceDescription,
        e?.serviceCost,
        e?.affirmations,
        e?.businessName,
        e?.businessDescription,
        e?.businessLocation
      ]);

  @override
  bool isValidKey(Object? o) => o is BusinessRecord;
}
