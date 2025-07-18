// lib/models/note_model.dart

import 'package:flutter/foundation.dart';

@immutable
class Note {
  final String id;
  final String content;
  final String peakPeriod;
  final DateTime date;
  final DateTime? remindAt;

  const Note({
    required this.id,
    required this.content,
    required this.peakPeriod,
    required this.date,
    this.remindAt,
  });

  Note copyWith({
    String? id,
    String? content,
    String? peakPeriod,
    DateTime? date,
    DateTime? remindAt,
  }) {
    return Note(
      id: id ?? this.id,
      content: content ?? this.content,
      peakPeriod: peakPeriod ?? this.peakPeriod,
      date: date ?? this.date,
      remindAt: remindAt ?? this.remindAt,
    );
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] as String,
      content: json['content'] as String,
      peakPeriod: json['peakPeriod'] as String,
      date: DateTime.parse(json['date'] as String).toLocal(),
      remindAt: json['remindAt'] != null
          ? DateTime.parse(json['remindAt'] as String).toLocal()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'peakPeriod': peakPeriod,
      'date': date.toUtc().toIso8601String(),
      'remindAt': remindAt?.toUtc().toIso8601String(),
    };
  }
}