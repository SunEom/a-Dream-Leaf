//
//  StoreMapViewModel.swift
//  aDreamLeaf
//
//  Created by 엄태양 on 2023/05/31.
//

import Foundation
import RxSwift
import RxRelay

struct StoreMapViewModel {
    let disposeBag = DisposeBag()
    let latitude: Double
    let longitude: Double
    let storeName: String
    let address: String
    let distance: Double
    
    init(_ data: Store) {
        self.latitude = data.refineWGS84Lat
        self.longitude = data.refineWGS84Logt
        self.storeName = data.storeName
        self.address = StringUtil.getSimpleAddress(with: data.refineRoadnmAddr)
        self.distance = data.curDist
    }
}
