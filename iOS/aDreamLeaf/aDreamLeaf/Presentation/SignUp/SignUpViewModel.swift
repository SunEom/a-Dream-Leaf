//
//  SignUpViewModel.swift
//  aDreamLeaf
//
//  Created by 엄태양 on 2023/03/30.
//

import Foundation
import RxSwift
import RxRelay

struct SignUpViewModel {
    let disposeBag = DisposeBag()
    
    let loading = BehaviorSubject<Bool>(value: false)
    
    let email = PublishSubject<String>()
    let password = PublishSubject<String>()
    let passwordCheck = PublishSubject<String>()
    
    let signUpBtnTap = PublishRelay<Void>()
    
    let signUpResult = PublishSubject<RequestResult<Void>>()
    
    init(_ repo: SignUpRepository = SignUpRepository()) {
        
        signUpBtnTap
            .withLatestFrom(Observable.combineLatest(email, password, passwordCheck))
            .flatMap(repo.signUp)
            .bind(to: signUpResult)
            .disposed(by: disposeBag)
        
        signUpResult
            .filter { $0.success }
            .withLatestFrom(Observable.combineLatest(email, password))
            .subscribe(onNext: { (email, pwd) in
                repo.sendEmailValification(email: email, pwd: pwd)
            })
            .disposed(by: disposeBag)
        
        //MARK: - Loading
        
        signUpBtnTap
            .map { return true }
            .bind(to: loading)
            .disposed(by: disposeBag)
        
        signUpResult
            .map { _ in return false }
            .bind(to: loading)
            .disposed(by: disposeBag)
    }
}
