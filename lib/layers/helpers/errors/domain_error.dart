enum DomainError {
  requiredField,
  somethingWrong,
  serviceDoesntExist,
  notFound,
  noInternet,
}

extension DomainErrorExtension on DomainError {
  String get message {
    switch (this) {
      case DomainError.somethingWrong:
        return 'Ouve um erro!';
      case DomainError.serviceDoesntExist:
        return 'O serviço parece estar indisponível!';
      case DomainError.notFound:
        return 'Não foi possível encontrar.';
      default:
        return 'Ouve um erro!!';
    }
  }
}

DomainError convertToDomainError(String error) {
  switch (error) {
    case 'Exception: Failed!':
      return DomainError.somethingWrong;
    case 'Exception: Invalid service: this service does not exist.':
      return DomainError.serviceDoesntExist;
    case 'Exception: The resource you requested could not be found.':
      return DomainError.notFound;
    default:
      return DomainError.somethingWrong;
  }
}
