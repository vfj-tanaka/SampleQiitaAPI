//
//  QiitaViewModel.swift
//  SampleQiitaAPI
//
//  Created by mtanaka on 2022/08/29.
//

import Foundation
import RxSwift
import RxCocoa
import RxMoya
import Moya

final class QiitaViewModel {
    
    var models = BehaviorRelay<[QiitaModel]>(value: [])
    private var disposeBag = DisposeBag()
    let provider = MoyaProvider<QiitaAPI>()
    
    func requestDataSource() {
        
        provider.rx.request(.user)
            .filterSuccessfulStatusCodes()
            .map([QiitaModel].self)
            .subscribe { response in
                self.models.accept(response)
            } onFailure: { error in
                print(error)
            }.disposed(by: disposeBag)
    }
}
