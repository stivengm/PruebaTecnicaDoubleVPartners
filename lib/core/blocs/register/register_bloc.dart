import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_doublevpartners/core/models/direccion.model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {

    on<HandlePercentStepRegister>((event, emit) {
      emit(state.copyWith(
        percentStepRegister: event.percentStepRegister
      ));
    });

    on<NextStepRegister>((event, emit) {
      emit(state.copyWith(
        currentStep: state.currentStep + 1,
        isNext: true,
      ));
    });

    on<NextStep>((event, emit) {
      if (state.currentStep == 0) {
        final formState = state.formStep1Key.currentState;
        final isValid = formState?.validate() ?? false;

        if (!isValid) {
          emit(state.copyWith(validationError: "Completa los campos del formulario"));
          emit(state.copyWith(validationError: ""));
          return;
        }

        formState?.save();
        emit(state.copyWith(currentStep: 1));
      } else if (state.currentStep == 1) {
        final formState = state.formStep2Key.currentState;
        final isValid = formState?.validate() ?? false;

        if (!isValid) {
          emit(state.copyWith(validationError: "Completa los campos del formulario"));
          emit(state.copyWith(validationError: ""));
          return;
        }

        formState?.save();
        emit(state.copyWith(currentStep: 2));
      } else if (state.currentStep == 2) {

        if (state.direcciones.isEmpty) {
          emit(state.copyWith(validationError: "Debes agregar por lo menos 1 dirección"));
          emit(state.copyWith(validationError: ""));
          return;
        }

        emit(state.copyWith(isCompleted: true));
      }
    });

    on<PreviousStep>((event, emit) {
      if (state.currentStep > 0) {
        emit(state.copyWith(currentStep: state.currentStep - 1));
      }
    });

    on<SavedForm1>((event, emit) {
      emit(state.copyWith(
        nombre: event.nombre,
        apellido: event.apellido,
        fechaDeNacimiento: event.fechaDeNacimiento,
      ));
    });

    on<SavedForm2>((event, emit) {
      emit(state.copyWith(
        telefono: event.telefono, 
        celular: event.celular
      ));
    });    

    on<SavedForm3>((event, emit) {
      emit(state.copyWith(
        direccion: event.direccion,
        complemento: event.complemento,
        departamento: event.departamento,
        municipio: event.municipio
      ));
    });

    on<GetDirection>((event, emit) {
      final formState = state.formStep3Key.currentState;
      final isValid = formState?.validate() ?? false;

      if (!isValid) {
        emit(state.copyWith(validationError: "Completa los campos del formulario"));
        emit(state.copyWith(validationError: ""));
        return;
      }

      formState?.save();
    });  

    on<SaveDireccion>((event, emit) {
      if (state.direccion.isNotEmpty &&
          state.departamento.isNotEmpty &&
          state.municipio.isNotEmpty) {
        final updated = List<DireccionModel>.from(state.direcciones)
          ..add(DireccionModel(
            direccion: state.direccion,
            complemento: state.complemento,
            departamento: state.departamento,
            municipio: state.municipio,
          ));

        emit(state.copyWith(
          direcciones: updated,
          direccion: '',
          complemento: '',
          departamento: '',
          municipio: '',
        ));
      }
    });

    on<ClearAddDireccionFlag>((event, emit) {
      emit(state.copyWith(shouldAddDireccion: false));
    });

    on<AddDireccion>((event, emit) {
      final updated = List<DireccionModel>.from(state.direcciones)..add(event.direccion);
      emit(state.copyWith(direcciones: updated));
    });  
  }
}
