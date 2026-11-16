class ValidatorForm {
  static String? ValidateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Es necesario un correo';
    }

    final email = value.trim().toLowerCase();

    if (!email.contains('@')) {
      return 'El correo debe contener @';
    }

    if (!email.endsWith('@udla.edu.co')) {
      return 'El correo debe terminar en @udla.edu.co';
    }

    final localPart = email.split('@').first;

    if (localPart.isEmpty) {
      return 'Falta el nombre antes de @udla.edu.co';
    }

    if (!RegExp(r'^[a-z.]+$').hasMatch(localPart)) {
      return 'Solo se permiten letras y un punto antes de @';
    }

    if (!localPart.contains('.')) {
      return 'El correo debe tener el formato\nnombre.apellido@udla.edu.co';
    }

    if (localPart.startsWith('.') ||
        localPart.endsWith('.') ||
        '.'.allMatches(localPart).length > 1) {
      return 'El correo debe tener un solo punto entre el nombre y el\napellido';
    }

    return null;
  }

  static String? ValidateLoginPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Es necesario una contraseña ';
    }
    if (value.length < 8) {
      return 'La contraseña debe tener mínimo 8 caracteres';
    }
    return null;
  }

  static String? ValidateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Es necesario un nombre de usuario ';
    }
    return null;
  }

  static String? ValidateRegisterPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Es necesario una contraseña';
    }
    if (value.length < 8) {
      return 'La contraseña debe tener mínimo 8 caracteres';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'La contraseña debe tener al menos una mayúscula';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'La contraseña debe tener al menos un número';
    }
    return null;
  }

  static String? Function(String?) ValidateConfirmPassword(String password) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return 'Es necesario confirmar la contraseña';
      }
      if (value != password) {
        return 'Las contraseñas no coinciden';
      }
      return null;
    };
  }

  static double PasswordStrength(String value) {
    if (value.isEmpty) return 0.0;

    double score = 0.0;

    if (value.length >= 8) score += 0.25;
    if (value.length >= 12) score += 0.15;
    if (RegExp(r'[A-Z]').hasMatch(value)) score += 0.20;
    if (RegExp(r'[a-z]').hasMatch(value)) score += 0.10;
    if (RegExp(r'\d').hasMatch(value)) score += 0.15;
    if (RegExp(r'[^A-Za-z0-9]').hasMatch(value)) score += 0.15;

    return score.clamp(0.0, 1.0);
  }
}
