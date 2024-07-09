//
//  PostListViewController.swift
//  dynamic_table_view_tutorial
//
//  Created by 정정욱 on 7/8/24.
//  Copyright (c) 2024 Tuentuenna. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PostListDisplayLogic: AnyObject
{
    func displayPostList(viewModel: PostList.FetchPostList.ViewModel)
}

class PostListViewController: UIViewController, PostListDisplayLogic
{
    
    var interactor: PostListBusinessLogic?
    var router: (NSObjectProtocol & PostListRoutingLogic & PostListDataPassing)?
    
    // MARK: - IBOutlets
    
    @IBOutlet var myTableView: UITableView!
    typealias DisplayedPost = PostList.FetchPostList.ViewModel.DisplayedPost
    
    
    // MARK: - Properties
    var postList : [DisplayedPost] = [] // 뷰에서 사용하기 위한 데이터 뷰모델에서 받은 값
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    // 모든 VIP 셋팅을 여기서 함 ⭐️
    // 보면 사이클에 맞게 서로 시키기 위한 애들을 가지고 있음
    private func setup()
    {
        let viewController = self
        let interactor = PostListInteractor()
        let presenter = PostListPresenter()
        let router = PostListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureTableView()
        
        fetchPostList()
       
    }
    
    fileprivate func configureTableView(){
        // 쎌 리소스 파일 가져오기
        let myTableViewCellNib = UINib(nibName: String(describing: MyTableViewCell.self), bundle: nil)
        
        // 쏄에 리소스 등록
        self.myTableView.register(myTableViewCellNib, forCellReuseIdentifier: "myTableViewCellId")
        
        self.myTableView.rowHeight = UITableView.automaticDimension
        self.myTableView.estimatedRowHeight = 120
        
        // 아주 중요
        self.myTableView.dataSource = self
    }
    
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    // 뷰 -> 인터렉터에게 시키기 ⭐️
    func fetchPostList()
    {
        let request = PostList.FetchPostList.Request(count: 10)
        interactor?.fetchPostList(request: request)
    }
    
    // 프리젠터 -> 뷰로 화면을 그리는 것 ⭐️
    func displayPostList(viewModel: PostList.FetchPostList.ViewModel)
    {
        //nameTextField.text = viewModel.name
        self.postList = viewModel.displayedPosts
        self.myTableView.reloadData()
    }
}

extension PostListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCellId", for: indexPath) as? MyTableViewCell else {
            return UITableViewCell()
        }
        
        let cellData = postList[indexPath.row]
        
        cell.configureCell(post: cellData)
        
        return cell
    }
}
