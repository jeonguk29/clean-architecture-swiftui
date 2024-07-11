//
//  PostListPresenterTests.swift
//  dynamic_table_view_tutorial
//
//  Created by 정정욱 on 7/9/24.
//  Copyright (c) 2024 Tuentuenna. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import dynamic_table_view_tutorial
import XCTest

class PostListPresenterTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: PostListPresenter! // 테스트 대상
    
    
    
    // MARK: - 더미데이터
    let dummyPosts = ["하하", "호호", "허허"].map{Post(title: $0, content: $0)} // 더미 데이터
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupPostListPresenter()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupPostListPresenter()
    {
        sut = PostListPresenter()
    }
    
    // MARK: Test doubles
    
    class PostListDisplayLogicSpy: PostListDisplayLogic // 해당 프로토콜을 채택하여 스파이 구현
    {
        var displayPostListCalled = false
        
        func displayPostList(viewModel: PostList.FetchPostList.ViewModel)
        {
            displayPostListCalled = true
        }
    }
    
    // MARK: Tests
    
    func testPresentSomething()
    {
        // Given
        let spy = PostListDisplayLogicSpy()
        sut.viewController = spy
        let response = PostList.FetchPostList.Response(posts: dummyPosts)
        
        // When
        sut.presentPostList(response: response)
        
        // 응답 들어왔을때 displayPostListCalled가 호출 되었는지만 체크
        // Then
        XCTAssertTrue(spy.displayPostListCalled, "presentSomething(response:) should ask the view controller to display the result")
    }
}
