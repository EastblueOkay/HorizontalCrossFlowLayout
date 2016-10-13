//
//  HomeViewController.swift
//  single
//
//  Created by 兰轩轩 on 2016/9/28.
//  Copyright © 2016年 兰轩轩. All rights reserved.
//  Example

import UIKit

private let kLineNumber : Int = 3
private let kColNumber : Int = 7
private let kReuseIdentifier = "kReuseIdentifier"

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //注册Cell
        collectionView.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: kReuseIdentifier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //设置自定义的 水平横向排布流体布局
        collectionView.collectionViewLayout = HorizontalCrossFlowLayout(colNumber: kColNumber, lineNumber: kLineNumber)
        let layout = collectionView.collectionViewLayout as! HorizontalCrossFlowLayout
        layout.itemSize = CGSize(width: collectionView.bounds.width / CGFloat(kColNumber), height: collectionView.bounds.height / CGFloat(kLineNumber))
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing  = 0
    }
}


// MARK: - UICollectionViewDataSource
extension HomeViewController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kLineNumber * kColNumber * 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kReuseIdentifier, for: indexPath) as! TestCollectionViewCell
        cell.titleLabel.text = "\(indexPath.section)-\(indexPath.item)"
        return cell
    }

}

fileprivate class TestCollectionViewCell : UICollectionViewCell{
    
    open lazy var titleLabel : UILabel = {
        let label = UILabel(frame: self.contentView.bounds)
        label.textColor = UIColor.red
        self.contentView.addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


