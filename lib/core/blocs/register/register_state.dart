part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final double percentStepRegister;
  final int currentStep;
  final bool isNext;
  final bool isCompleted;

  final GlobalKey<FormState> formStep1Key;
  final GlobalKey<FormState> formStep2Key;
  final GlobalKey<FormState> formStep3Key;

  final String validationError;

  final String nombre;
  final String apellido;
  final String fechaDeNacimiento;
  final String telefono;
  final String celular;
  final String direccion;
  final String complemento;
  final String departamento;
  final String municipio;

  final List<DireccionModel> direcciones;
  final bool shouldAddDireccion;
  

  const RegisterState({
    this.percentStepRegister = 0.0,
    this.currentStep = 0,
    this.isNext = true,
    this.isCompleted = false,
    required this.formStep1Key,
    required this.formStep2Key,
    required this.formStep3Key,
    this.validationError = "",
    this.nombre = '',
    this.apellido = '',
    this.fechaDeNacimiento = '',
    this.telefono = '',
    this.celular = '',
    this.direccion = '',
    this.complemento = '',
    this.departamento = '',
    this.municipio = '',
    this.direcciones = const [],
    this.shouldAddDireccion = false
  });

  RegisterState copyWith({
    double? percentStepRegister,
    int? currentStep,
    bool? isNext,
    bool? isCompleted,
    GlobalKey<FormState>? formStep1Key,
    GlobalKey<FormState>? formStep2Key,
    GlobalKey<FormState>? formStep3Key,
    String? validationError,
    String? nombre,
    String? apellido,
    String? fechaDeNacimiento,
    String? telefono,
    String? celular,
    String? direccion,
    String? complemento,
    String? departamento,
    String? municipio,
    List<DireccionModel>? direcciones,

    bool? shouldAddDireccion,
  }) {
    return RegisterState(
      percentStepRegister: percentStepRegister ?? this.percentStepRegister,
      currentStep: currentStep ?? this.currentStep,
      isNext: isNext ?? this.isNext,
      isCompleted: isCompleted ?? this.isCompleted,
      formStep1Key: formStep1Key ?? this.formStep1Key,
      formStep2Key: formStep2Key ?? this.formStep2Key,
      formStep3Key: formStep3Key ?? this.formStep3Key,
      validationError: validationError ?? this.validationError,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      fechaDeNacimiento: fechaDeNacimiento ?? this.fechaDeNacimiento,
      telefono: telefono ?? this.telefono,
      celular: celular ?? this.celular,
      direccion: direccion ?? this.direccion,
      complemento: complemento ?? this.complemento,
      departamento: departamento ?? this.departamento,
      municipio: municipio ?? this.municipio,
      direcciones: direcciones ?? this.direcciones,

      shouldAddDireccion: shouldAddDireccion ?? this.shouldAddDireccion
    );
  }
  
  @override
  List<Object> get props => [ percentStepRegister, currentStep, isNext, isCompleted, formStep1Key, formStep2Key, formStep3Key, validationError, nombre, apellido, fechaDeNacimiento, telefono, celular, direccion, complemento, departamento, municipio, direcciones ];
}

final class RegisterInitial extends RegisterState {
  RegisterInitial()
  : super(
    percentStepRegister: 0.3,
    currentStep: 0,
    isNext: true,
    formStep1Key: GlobalKey<FormState>(),
    formStep2Key: GlobalKey<FormState>(),
    formStep3Key: GlobalKey<FormState>(),
  );
}