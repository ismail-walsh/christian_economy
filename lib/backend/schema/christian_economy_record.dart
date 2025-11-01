import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChristianEconomyRecord extends FirestoreRecord {
  ChristianEconomyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "affirmedCreed" field.
  bool? _affirmedCreed;
  bool get affirmedCreed => _affirmedCreed ?? false;
  bool hasAffirmedCreed() => _affirmedCreed != null;

  // "affirmation1" field.
  bool? _affirmation1;
  bool get affirmation1 => _affirmation1 ?? false;
  bool hasAffirmation1() => _affirmation1 != null;

  // "affirmation2" field.
  bool? _affirmation2;
  bool get affirmation2 => _affirmation2 ?? false;
  bool hasAffirmation2() => _affirmation2 != null;

  // "affirmation3" field.
  bool? _affirmation3;
  bool get affirmation3 => _affirmation3 ?? false;
  bool hasAffirmation3() => _affirmation3 != null;

  // "affirmation4" field.
  bool? _affirmation4;
  bool get affirmation4 => _affirmation4 ?? false;
  bool hasAffirmation4() => _affirmation4 != null;

  // "affirmation5" field.
  bool? _affirmation5;
  bool get affirmation5 => _affirmation5 ?? false;
  bool hasAffirmation5() => _affirmation5 != null;

  // "affirmation6" field.
  bool? _affirmation6;
  bool get affirmation6 => _affirmation6 ?? false;
  bool hasAffirmation6() => _affirmation6 != null;

  // "affirmation7" field.
  bool? _affirmation7;
  bool get affirmation7 => _affirmation7 ?? false;
  bool hasAffirmation7() => _affirmation7 != null;

  void _initializeFields() {
    _affirmedCreed = snapshotData['affirmedCreed'] as bool?;
    _affirmation1 = snapshotData['affirmation1'] as bool?;
    _affirmation2 = snapshotData['affirmation2'] as bool?;
    _affirmation3 = snapshotData['affirmation3'] as bool?;
    _affirmation4 = snapshotData['affirmation4'] as bool?;
    _affirmation5 = snapshotData['affirmation5'] as bool?;
    _affirmation6 = snapshotData['affirmation6'] as bool?;
    _affirmation7 = snapshotData['affirmation7'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('christian_economy');

  static Stream<ChristianEconomyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChristianEconomyRecord.fromSnapshot(s));

  static Future<ChristianEconomyRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ChristianEconomyRecord.fromSnapshot(s));

  static ChristianEconomyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChristianEconomyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChristianEconomyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChristianEconomyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChristianEconomyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChristianEconomyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChristianEconomyRecordData({
  bool? affirmedCreed,
  bool? affirmation1,
  bool? affirmation2,
  bool? affirmation3,
  bool? affirmation4,
  bool? affirmation5,
  bool? affirmation6,
  bool? affirmation7,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'affirmedCreed': affirmedCreed,
      'affirmation1': affirmation1,
      'affirmation2': affirmation2,
      'affirmation3': affirmation3,
      'affirmation4': affirmation4,
      'affirmation5': affirmation5,
      'affirmation6': affirmation6,
      'affirmation7': affirmation7,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChristianEconomyRecordDocumentEquality
    implements Equality<ChristianEconomyRecord> {
  const ChristianEconomyRecordDocumentEquality();

  @override
  bool equals(ChristianEconomyRecord? e1, ChristianEconomyRecord? e2) {
    return e1?.affirmedCreed == e2?.affirmedCreed &&
        e1?.affirmation1 == e2?.affirmation1 &&
        e1?.affirmation2 == e2?.affirmation2 &&
        e1?.affirmation3 == e2?.affirmation3 &&
        e1?.affirmation4 == e2?.affirmation4 &&
        e1?.affirmation5 == e2?.affirmation5 &&
        e1?.affirmation6 == e2?.affirmation6 &&
        e1?.affirmation7 == e2?.affirmation7;
  }

  @override
  int hash(ChristianEconomyRecord? e) => const ListEquality().hash([
        e?.affirmedCreed,
        e?.affirmation1,
        e?.affirmation2,
        e?.affirmation3,
        e?.affirmation4,
        e?.affirmation5,
        e?.affirmation6,
        e?.affirmation7
      ]);

  @override
  bool isValidKey(Object? o) => o is ChristianEconomyRecord;
}
