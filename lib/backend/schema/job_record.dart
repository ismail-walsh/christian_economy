import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobRecord extends FirestoreRecord {
  JobRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "jobPostings" field.
  List<DocumentReference>? _jobPostings;
  List<DocumentReference> get jobPostings => _jobPostings ?? const [];
  bool hasJobPostings() => _jobPostings != null;

  void _initializeFields() {
    _jobPostings = getDataList(snapshotData['jobPostings']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('job');

  static Stream<JobRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobRecord.fromSnapshot(s));

  static Future<JobRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobRecord.fromSnapshot(s));

  static JobRecord fromSnapshot(DocumentSnapshot snapshot) => JobRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class JobRecordDocumentEquality implements Equality<JobRecord> {
  const JobRecordDocumentEquality();

  @override
  bool equals(JobRecord? e1, JobRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.jobPostings, e2?.jobPostings);
  }

  @override
  int hash(JobRecord? e) => const ListEquality().hash([e?.jobPostings]);

  @override
  bool isValidKey(Object? o) => o is JobRecord;
}
