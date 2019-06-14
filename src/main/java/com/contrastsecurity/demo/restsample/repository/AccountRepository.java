package com.contrastsecurity.demo.restsample.repository;

import com.contrastsecurity.demo.restsample.model.Account;
import org.springframework.data.repository.CrudRepository;

public interface AccountRepository extends CrudRepository<Account, Long> {

}
