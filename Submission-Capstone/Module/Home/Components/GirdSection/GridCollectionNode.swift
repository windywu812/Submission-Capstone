//
//  GridCollectionNode.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import AsyncDisplayKit

class GridCollectionNode: ASDKViewController<ASCollectionNode> {
    
    private let presenter: SeeAllPresenter
    
    init(presenter: SeeAllPresenter) {
        
        self.presenter = presenter
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 24
        layout.scrollDirection = .vertical
        
        super.init(node: ASCollectionNode(frame: .zero, collectionViewLayout: layout, layoutFacilitator: nil))
        
        node.style.preferredSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        node.showsVerticalScrollIndicator = false
        
        node.delegate = self
        node.dataSource = self
        
        node.automaticallyManagesSubnodes = true
        node.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        node.backgroundColor = .systemBackground
        
        title = "See all"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            self.view.alpha = 1
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
            self.view.alpha = 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension GridCollectionNode: ASCollectionDelegate, ASCollectionDataSource {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return presenter.movies.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        let cellNodeBlock = { [weak self] () -> ASCellNode in
            guard let self = self else { return ASCellNode() }
            return GridCellNode(imageUrl: self.presenter.movies[indexPath.row].posterPath, title: self.presenter.movies[indexPath.row].title)
            
        }
        
        return cellNodeBlock
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, didSelectItemAt indexPath: IndexPath) {
        presenter.goToDetail(idMovie: presenter.movies[indexPath.row].idMovie)
    }
    
}
