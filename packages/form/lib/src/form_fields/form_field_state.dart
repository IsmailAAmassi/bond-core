import 'package:bond_form/src/validation/rules.dart';
import 'package:meta/meta.dart' show nonVirtual;

/// Represents the state of a form field.
///
/// A form field can have a generic type `T` for its value.
/// such as the current value, error message, label, validation rules, and
/// whether it has been touched or should validate on updates.
abstract class FormFieldState<T> {
  /// The current value of the form field.
  final T value;

  /// The error message associated with the form field, if any.
  final String? error;

  /// The label or name of the form field.
  final String label;

  /// The list of validation rules to apply to the form field.
  final List<ValidationRule<T>> rules;

  /// Indicates whether validation should occur when the form field is updated.
  final bool validateOnUpdate;

  /// Indicates whether the form field has been touched (interacted with) by the user.
  final bool touched;

  /// Creates a new instance of [FormFieldState].
  ///
  /// - [value]: The initial value of the form field.
  /// - [error]: An optional error message initially associated with the field.
  /// - [label]: The label or name of the form field (required).
  /// - [touched]: Indicates whether the field has been touched (default is `false`).
  /// - [validateOnUpdate]: Indicates whether validation should occur on updates (default is `true`).
  /// - [rules]: The list of validation rules to apply to the form field (default is an empty list).
  FormFieldState({
    required this.value,
    this.error,
    required this.label,
    this.touched = false,
    this.validateOnUpdate = true,
    this.rules = const [],
  });

  /// Validates the form field against its validation rules.
  ///
  /// - [fields]: A map of form field states for cross-field validation.
  ///
  /// Returns an error message if validation fails, otherwise returns `null`.
  @nonVirtual
  String? validate(Map<String, FormFieldState> fields) {
    for (final rule in rules) {
      if (!rule.validate(value, fields)) {
        return rule.message(label);
      }
    }
    return null;
  }

  /// Creates a copy of the form field state with the specified changes.
  FormFieldState<T> copyWith({
    T? value,
    String? error,
    String? label,
    bool? touched,
    bool? validateOnUpdate,
    List<ValidationRule<T>>? rules,
  });
}
