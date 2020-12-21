//
//  EventsPresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import RxSwift

class EventsPresenter {
    weak var delegate: EventsViewControllerProtocol?
    private let disposebag = DisposeBag()
    private let service: StoriesService
    var eventsList: [EventsModel] = []

    init(service: StoriesService) {
        self.service = service
    }

    func viewLoaded() {
        executeGet()
    }

    private func executeGet() {
        delegate?.showAnimation()
        service.execute()
            .subscribe(onNext: { [weak self] response in
                self?.eventsList = response.data.results
                print(response)
                DispatchQueue.main.async {
                    self?.delegate?.hideAnimation()
                    self?.successFetchEvents()
                }
            }, onError: { error in
                debugPrint(error)
            })
            .disposed(by: disposebag)
    }

    private func successFetchEvents() {
        delegate?.setupView(eventsList)
    }
}
