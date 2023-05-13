package com.DreamCoder.DreamLeaf.controller;


import com.DreamCoder.DreamLeaf.dto.StoreDto;
import com.DreamCoder.DreamLeaf.req.StoreReq;
import com.DreamCoder.DreamLeaf.req.UserCurReq;
import com.DreamCoder.DreamLeaf.service.StoreService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@Slf4j
@RequestMapping("/restaurant")
@RequiredArgsConstructor
public class StoreController {

    @Autowired
    private final StoreService storeService;

//    @PostMapping("/save")    //for test
//    public ResponseEntity save(@RequestBody StoreReq storeReq){
//        return ResponseEntity.status(HttpStatus.CREATED).body(storeService.create(storeReq));
//    }

    @GetMapping("/{storeId}")
    public Optional<StoreDto> showStoreDetail(@PathVariable int storeId){
        return storeService.findById(storeId);
    }

    @GetMapping("/findByKeyword")
    public List<StoreDto> findByKeyword(@RequestParam String q, @RequestBody UserCurReq userCurReq){       //거리 순으로 정렬
        return storeService.findByKeyword(q, userCurReq);
    }

    @GetMapping("/findByCur")
    public List<StoreDto> findByCur(@RequestBody UserCurReq userCurReq){
        return storeService.findByCur(userCurReq);
    }

}