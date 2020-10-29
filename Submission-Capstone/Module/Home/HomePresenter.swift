//
//  MainPresenter.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import Foundation
import RxSwift
import RxCocoa

class HomePresenter {
    
    private let interactor: HomeUseCase
    private let router = HomeRouter()
    
    private let disposeBag = DisposeBag()
    
    var nowPlayingMovies = BehaviorSubject<[MovieModel]>(value: [])
    var topRatedMovies = BehaviorSubject<[MovieModel]>(value: [])
    var popularMovies = BehaviorSubject<[MovieModel]>(value: [])
    var upcomingMovies = BehaviorSubject<[MovieModel]>(value: [])
    
    init(interactor: HomeUseCase) {
        self.interactor = interactor
        
        getMovies()
    }
    
    func getMovies() {
        interactor.getNowPlayingMovies()
            .observeOn(MainScheduler.instance)
            .bind(to: nowPlayingMovies)
            .disposed(by: disposeBag)
        
        interactor.getTopRatedMovies()
            .observeOn(MainScheduler.instance)
            .bind(to: topRatedMovies)
            .disposed(by: disposeBag)
        
        interactor.getPopularMovies()
            .observeOn(MainScheduler.instance)
            .bind(to: popularMovies)
            .disposed(by: disposeBag)
        
        interactor.getUpcomingMovies()
            .observeOn(MainScheduler.instance)
            .bind(to: upcomingMovies)
            .disposed(by: disposeBag)
        
    }
    
    func goToDetailView(idMovie: Int) {
        router.goToDetailView(idMovie: idMovie)
    }
    
}