//
//  FavoriteRouter.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import UIKit

class FavoriteRouter {
    
    func goToDetailView(idMovie: Int) -> UIViewController {
        let detailIntercator = Injection().provideDetailUseCase(idMovie: idMovie)
        let presenter = DetailPresenter(interactor: detailIntercator, idMovie: idMovie)
        let detailView = DetailViewController(presenter: presenter)
        
        return detailView
    }
    
}
