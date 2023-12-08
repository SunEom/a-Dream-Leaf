//
//  MockProfileRepository.swift
//  aDreamLeafNetworkTests
//
//  Created by 엄태양 on 12/8/23.
//

@testable import aDreamLeaf
import Foundation
import RxSwift

struct MockProfileRepository: ProfileRepository {
    func deleteAccount() -> RxSwift.Observable<aDreamLeaf.RequestResult<Void>> {
        return Observable.just(RequestResult(success: true, msg: nil))
    }
}
