part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class HandlePercentStepRegister extends RegisterEvent {
  final double percentStepRegister;

  const HandlePercentStepRegister(this.percentStepRegister);

  @override
  List<Object> get props => [ percentStepRegister ];
}

class NextStepRegister extends RegisterEvent {
  const NextStepRegister();

  @override
  List<Object> get props => [];
}

class SavedForm1 extends RegisterEvent {
  final String? nombre;
  final String? apellido;
  final String? fechaDeNacimiento;

  const SavedForm1({this.nombre, this.apellido, this.fechaDeNacimiento});

  @override
  List<Object> get props => [];
}

class SavedForm2 extends RegisterEvent {
  final String? telefono;
  final String? celular;

  const SavedForm2({this.telefono, this.celular});

  @override
  List<Object> get props => [];
}

class SavedForm3 extends RegisterEvent {
  final String? direccion;
  final String? complemento;
  final String? departamento;
  final String? municipio;

  const SavedForm3({this.direccion, this.complemento, this.departamento, this.municipio});

  @override
  List<Object> get props => [];
}

class AddDireccion extends RegisterEvent {
  final DireccionModel direccion;
  const AddDireccion(this.direccion);

  @override
  List<Object> get props => [];
}

class GetDirection extends RegisterEvent {}
class SaveDireccion extends RegisterEvent {}
class ClearAddDireccionFlag extends RegisterEvent {}
class NextStep extends RegisterEvent {}
class PreviousStep extends RegisterEvent {}
class SubmitRegister extends RegisterEvent {}