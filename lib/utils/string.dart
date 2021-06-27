bool isNullOrEmpty(String? text) {
  return text == null || text.isEmpty;
}

bool containsIgnoreCase({
  required String stringToSearch,
  required String searchQuery,
}) {
  assert(
    !isNullOrEmpty(stringToSearch) && !isNullOrEmpty(searchQuery),
    'do not pass in empty strings',
  );
  return stringToSearch.toLowerCase().contains(searchQuery.toLowerCase());
}

String returnInitials({
  required String firstName,
  required String lastName,
}) =>
    (firstName.substring(0, 1) + lastName.substring(0, 1)).toUpperCase();
