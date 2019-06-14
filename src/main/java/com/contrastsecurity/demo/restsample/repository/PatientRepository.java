package com.contrastsecurity.demo.restsample.repository;

import com.contrastsecurity.demo.restsample.model.Patient;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PatientRepository extends CrudRepository<Patient, Long> {
}
