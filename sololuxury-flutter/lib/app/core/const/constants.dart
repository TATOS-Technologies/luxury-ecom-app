/// Guidelines for constants
/// 1. Store related or similar constants in common file.
/// Eg. Put all constants for key values in the file key_value_constant.dart
/// Keep all constants for image asset name in a single file etc..
///
/// 2. Naming convention for constants: follow the format "k<feature><constantName>"
/// Eg. for the country code key in the local store [kLocalStoreCountryCodeKey] is used.
/// for notification channel id constant [knotificationChannelId].
/// This gives us a solid naming convention for constants, makes the names understandable and helps with autocomplete.
/// 3. Export the  feature constant file from this file if missing.

export "key_value_constants.dart";
