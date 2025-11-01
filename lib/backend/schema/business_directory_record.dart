import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessDirectoryRecord extends FirestoreRecord {
  BusinessDirectoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "businesses" field.
  List<DocumentReference>? _businesses;
  List<DocumentReference> get businesses => _businesses ?? const [];
  bool hasBusinesses() => _businesses != null;

  void _initializeFields() {
    _businesses = getDataList(snapshotData['businesses']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('businessDirectory');

  static Stream<BusinessDirectoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessDirectoryRecord.fromSnapshot(s));

  static Future<BusinessDirectoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BusinessDirectoryRecord.fromSnapshot(s));

  static BusinessDirectoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessDirectoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessDirectoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessDirectoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessDirectoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessDirectoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessDirectoryRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class BusinessDirectoryRecordDocumentEquality
    implements Equality<BusinessDirectoryRecord> {
  const BusinessDirectoryRecordDocumentEquality();

  @override
  bool equals(BusinessDirectoryRecord? e1, BusinessDirectoryRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.businesses, e2?.businesses);
  }

  @override
  int hash(BusinessDirectoryRecord? e) =>
      const ListEquality().hash([e?.businesses]);

  @override
  bool isValidKey(Object? o) => o is BusinessDirectoryRecord;
}
