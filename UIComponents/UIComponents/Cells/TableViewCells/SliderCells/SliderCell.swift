//
//  SliderCell.swift
//  UIComponents
//
//  Created by Gizem Duman on 15.11.2022.
//

import UIKit

public class SliderCell: UITableViewCell, ReusableView {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.register(SliderImageCell.self)
        colletionView.isPagingEnabled = true
        colletionView.bounces = false
        
        return colletionView
    }()
    
    private let indicatorView: TextIndicatorView = {
       let view = TextIndicatorView()
        return view
    }()
    
    private let pageIndicatorView: PageIndicatorView = {
       let view = PageIndicatorView()
        return view
    }()
    
    weak var viewModel: SliderCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
 
    public func set(viewModel: SliderCellProtocol) {
        self.viewModel = viewModel
        configureContents()
        collectionView.reloadData()
    }
}

// MARK: - UILayout
extension SliderCell {
    
    private func addSubViews() {
        addColletionView()
        addIndicatorView()
        addPageIndicatorView()
    }
    
    private func addColletionView() {
        contentView.addSubview(collectionView)
        collectionView.edgesToSuperview()
        let height = UIScreen.main.bounds.height * 0.40
        collectionView.height(height, priority: .defaultHigh)
    }
    
    private func addIndicatorView() {
        contentView.addSubview(indicatorView)
        indicatorView.topToSuperview(offset: 20)
        indicatorView.trailingToSuperview(offset: 20)
        indicatorView.size(.init(width: 70, height: 30))
    }
    
    private func addPageIndicatorView() {
        contentView.addSubview(pageIndicatorView)
        pageIndicatorView.centerXToSuperview()
        pageIndicatorView.bottomToSuperview(offset: -20)
        let width = contentView.frame.width * 0.50
        pageIndicatorView.size(.init(width: width, height: 30))
    }
}

// MARK: - ConfigureContents
extension SliderCell {
        
    private func configureContents() {
        configureCollectionViews()
        configureIndicatorView()
        configurePageIndicatorView()
    }
    
    private func configureCollectionViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func configureIndicatorView() {
        guard let totalPage = viewModel?.numberOfItemsInSection else { return }
        indicatorView.setView(totalPage: totalPage, currentPage: 1)
    }
    
    private func configurePageIndicatorView() {
        guard let totalPage = viewModel?.numberOfItemsInSection else { return }
        pageIndicatorView.numberOfPages = totalPage
    }
}

// MARK: - UIScrollViewDelegate
extension SliderCell: UIScrollViewDelegate {
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        let index = Int(offSet + horizontalCenter) / Int(width)
        guard let totalPage = viewModel?.numberOfItemsInSection else { return }
        indicatorView.setView(totalPage: totalPage, currentPage: index + 1)
        pageIndicatorView.currentPage = index
    }
}

// MARK: - UICollectionViewDelegate
extension SliderCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension SliderCell: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItemsInSection ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SliderImageCell = collectionView.dequeueReusableCell(for: indexPath)
        if let viewModel = viewModel?.cellForItemAt(indexPath: indexPath) {
            cell.set(viewModel: viewModel)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SliderCell: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = collectionView.frame
        return .init(width: frame.width, height: frame.height)
    }
}
