import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meta.dart';
import 'model.dart';
import 'response_converter.dart';

part 'list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ListResponse<T extends Model> extends Equatable {
  const ListResponse({
    required this.data,
    this.meta,
    this.message,
  });

  @ResponseConverter()
  final List<T> data;
  final Meta? meta;
  final String? message;

  factory ListResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListResponseToJson(this);

  @override
  List<Object?> get props => [data, meta, message];
}
