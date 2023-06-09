package com.DreamCoder.DreamLeaf.service;

import com.DreamCoder.DreamLeaf.dto.*;
import com.DreamCoder.DreamLeaf.repository.AccountRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class AccountService {

    @Autowired
    private final AccountRepository AccountRepositoryImpl;

    public AccountDto create(AccountCreateDto accountCreateDto){
        return AccountRepositoryImpl.save(accountCreateDto);
    }

    public String delete(AccountDelDto accountDelDto){
        return AccountRepositoryImpl.delete(accountDelDto);
    }

    public String update(AccountUpDto accountUpDto){
        return AccountRepositoryImpl.update(accountUpDto);
    }

    public SimpleAccountDto simpleInquire(AccountInqDto accountInqDto){
        return AccountRepositoryImpl.inquire(accountInqDto);
    }

    public String setAccount(AccountSetDto accountSetDto){
        return AccountRepositoryImpl.set(accountSetDto);
    }

    public List<AccountListResultDto> readAccount(AccountListDto accountListDto){
        return AccountRepositoryImpl.search(accountListDto);
    }
}
