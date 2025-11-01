import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobPostingRecord extends FirestoreRecord {
  JobPostingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "jobTitle" field.
  String? _jobTitle;
  String get jobTitle => _jobTitle ?? '';
  bool hasJobTitle() => _jobTitle != null;

  // "position" field.
  String? _position;
  String get position => _position ?? '';
  bool hasPosition() => _position != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "responsibilities" field.
  List<String>? _responsibilities;
  List<String> get responsibilities => _responsibilities ?? const [];
  bool hasResponsibilities() => _responsibilities != null;

  // "requirements" field.
  List<String>? _requirements;
  List<String> get requirements => _requirements ?? const [];
  bool hasRequirements() => _requirements != null;

  // "compensation" field.
  String? _compensation;
  String get compensation => _compensation ?? '';
  bool hasCompensation() => _compensation != null;

  // "employer" field.
  DocumentReference? _employer;
  DocumentReference? get employer => _employer;
  bool hasEmployer() => _employer != null;

  void _initializeFields() {
    _jobTitle = snapshotData['jobTitle'] as String?;
    _position = snapshotData['position'] as String?;
    _summary = snapshotData['summary'] as String?;
    _responsibilities = getDataList(snapshotData['responsibilities']);
    _requirements = getDataList(snapshotData['requirements']);
    _compensation = snapshotData['compensation'] as String?;
    _employer = snapshotData['employer'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jobPosting');

  static Stream<JobPostingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobPostingRecord.fromSnapshot(s));

  static Future<JobPostingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobPostingRecord.fromSnapshot(s));

  static JobPostingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JobPostingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobPostingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobPostingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobPostingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobPostingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobPostingRecordData({
  String? jobTitle,
  String? position,
  String? summary,
  String? compensation,
  DocumentReference? employer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'jobTitle': jobTitle,
      'position': position,
      'summary': summary,
      'compensation': compensation,
      'employer': employer,
    }.withoutNulls,
  );

  return firestoreData;
}

class JobPostingRecordDocumentEquality implements Equality<JobPostingRecord> {
  const JobPostingRecordDocumentEquality();

  @override
  bool equals(JobPostingRecord? e1, JobPostingRecord? e2) {
    const listEquality = ListEquality();
    return e1?.jobTitle == e2?.jobTitle &&
        e1?.position == e2?.position &&
        e1?.summary == e2?.summary &&
        listEquality.equals(e1?.responsibilities, e2?.responsibilities) &&
        listEquality.equals(e1?.requirements, e2?.requirements) &&
        e1?.compensation == e2?.compensation &&
        e1?.employer == e2?.employer;
  }

  @override
  int hash(JobPostingRecord? e) => const ListEquality().hash([
        e?.jobTitle,
        e?.position,
        e?.summary,
        e?.responsibilities,
        e?.requirements,
        e?.compensation,
        e?.employer
      ]);

  @override
  bool isValidKey(Object? o) => o is JobPostingRecord;
}
