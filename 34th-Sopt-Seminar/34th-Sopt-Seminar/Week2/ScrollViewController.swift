//
//  ScrollViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/6/24.
//

import UIKit

class ScrollViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(resource: .grey200)
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(resource: .orange200)
        return view
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setHierarchy()
        setLayout()
        setStyle()
    }

}

// MARK: - Private Methods

private extension ScrollViewController {
    
    func setHierarchy() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(redView,
                                orangeView,
                                yellowView,
                                greenView,
                                blueView,
                                purpleView)
    }
    
    func setLayout() {

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            // contentView의 height가 scrollView의 height보다 크거나 같도록 설정합니다. 우선순위는 낮습니다.
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        redView.snp.makeConstraints {
            $0.top.leading.equalTo(contentView)
            $0.width.equalTo(UIScreen.main.bounds.size.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.size.height / 3)
        }
        orangeView.snp.makeConstraints {
            $0.top.trailing.equalTo(contentView)
            $0.width.equalTo(UIScreen.main.bounds.size.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.size.height / 3)
        }
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalTo(contentView)
            $0.width.equalTo(UIScreen.main.bounds.size.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.size.height / 3)
        }
        greenView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.trailing.equalTo(contentView)
            $0.width.equalTo(UIScreen.main.bounds.size.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.size.height / 3)
        }
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalTo(contentView)
            $0.width.equalTo(UIScreen.main.bounds.size.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.size.height / 3)
            $0.bottom.equalTo(contentView)
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.trailing.equalTo(contentView)
            $0.width.equalTo(UIScreen.main.bounds.size.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.size.height / 3)
            $0.bottom.equalTo(contentView) // contentView의 마지막 요소로, bottom을 설정합니다.
        }
    }
    
    func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
    }
}
