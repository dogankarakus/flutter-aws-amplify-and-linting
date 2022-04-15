/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import "package:amplify_core/amplify_core.dart";
import "package:flutter/foundation.dart";
import "package:node_interop/js.dart";

/** This is an auto generated class representing the Todo type in your schema. */
@immutable
class Todo extends Model {
  factory Todo(
      {required String? id,
      required String name,
      required String description,
      required bool isCompleted}) {
    return Todo._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        description: description,
        isCompleted: isCompleted,
        createdAt: null,
        updatedAt: null);
  }
  static const _TodoModelType classType = const _TodoModelType();
  String? id;
  final String name;
  String description;
  final bool isCompleted;
  TemporalDateTime? createdAt;
  TemporalDateTime? updatedAt;

  @override
  _TodoModelType getInstanceType() => classType;

  @override
  String getId() {
    return id!;
  }

  Todo._internal(
      {required this.id,
      required this.name,
      required this.description,
      required this.isCompleted,
      this.createdAt,
      this.updatedAt});

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Todo &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        isCompleted == other.isCompleted;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    StringBuffer buffer = new StringBuffer();

    buffer.write("Todo {");
    buffer.write("id=$id, ");
    buffer.write("name=$name, ");
    buffer.write("description=$description, ");
    buffer.write(
        "isCompleted=${isCompleted != null ? isCompleted.toString() : "null"}, ");
    buffer.write(
        "createdAt=${createdAt != null ? createdAt!.format() : "null"}, ");
    buffer
        .write("updatedAt=${updatedAt != null ? updatedAt!.format() : "null"}");
    buffer.write("}");

    return buffer.toString();
  }

  Todo copyWith(
      {required String? id,
      required String name,
      required String description,
      required bool isCompleted}) {
    return Todo._internal(
        id: id, name: name, description: description, isCompleted: isCompleted);
  }

  Todo.fromJson(Map<String, dynamic> json)
      : id = json["id"] as String,
        name = json["name"] as String,
        description = json["description"] as String,
        isCompleted = json["isCompleted"] as bool,
        createdAt = TemporalDateTime.fromString(json["createdAt"] as String),
        updatedAt = TemporalDateTime.fromString(json["updatedAt"] as String);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "isCompleted": isCompleted,
        "createdAt": createdAt?.format(),
        "updatedAt": updatedAt?.format()
      };

  static final QueryField ID = QueryField(fieldName: "todo.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField ISCOMPLETED = QueryField(fieldName: "isCompleted");
  static ModelSchema schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Todo";
    modelSchemaDefinition.pluralName = "Todos";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.DESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Todo.ISCOMPLETED,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: "createdAt",
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: "updatedAt",
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _TodoModelType extends ModelType<Todo> {
  const _TodoModelType();

  @override
  Todo fromJson(Map<String, dynamic> jsonData) {
    return Todo.fromJson(jsonData);
  }
}
