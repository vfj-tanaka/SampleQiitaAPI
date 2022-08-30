//
//  ViewController.swift
//  SampleQiitaAPI
//
//  Created by mtanaka on 2022/08/29.
//

import UIKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let cell = UINib(nibName: "TableViewCell", bundle: nil)
            tableView.register(cell, forCellReuseIdentifier: "TableViewCell")
        }
    }
    
    private let viewModel = QiitaViewModel()
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        viewModel.requestDataSource()
    }
    
    private func bind() {
        
        viewModel.models
            .bind(to: tableView.rx.items(cellIdentifier: "TableViewCell", cellType: TableViewCell.self)) { _, element, cell in cell.configure(model: element) }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(QiitaModel.self)
            .subscribe(onNext: { response in
                guard let url = response.url,
                      let _url = URL(string: url) else {
                    return
                }
                UIApplication.shared.open(_url, options: [:], completionHandler: nil)
            })
            .disposed(by: disposeBag)
    }
}
