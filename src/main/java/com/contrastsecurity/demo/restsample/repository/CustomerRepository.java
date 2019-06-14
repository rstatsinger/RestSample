package com.contrastsecurity.demo.restsample.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.contrastsecurity.demo.restsample.model.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Long> {
	public List<Customer> findByFirstName(String firstName);
}
