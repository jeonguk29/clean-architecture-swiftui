import UIKit

// 붕어빵 앙꼬
protocol GoldFishAnko {
    func haveABite()
}

// 팥앙꼬
class PotAnko : GoldFishAnko {
    func haveABite() {
        print("아 팥맛이 난다")
    }
}

// 슈크림 앙꼬
class ShuCreamAnko : GoldFishAnko {
    func haveABite() {
        print("아 달달한 슈크림맛이 난다")
    }
}

class GoldFish {
    var anko : GoldFishAnko
    init(anko: GoldFishAnko) {
        self.anko = anko
    }
    
    func haveABite() {
        self.anko.haveABite()
    }
}

//let goldFish = GoldFish(anko: PotAnko())
let goldFish = GoldFish(anko: ShuCreamAnko())
goldFish.haveABite()

// 뭘 넣느냐에따라 다르게 출력됨 의존성 주입의 핵심개념 리포지토리 패턴은 이렇게 의존성 주입이 들어감



// MARK: - 워커의 개념 (위 의존성 주입 개념을 이해해야함)
// 붕어빵 앙꼬
protocol PostStoreProtocol {
    func fetchPosts() -> [String]
}

// 팥앙꼬
// Realm - 로컬 저장소
class RealmPostStore : PostStoreProtocol {
    func fetchPosts() -> [String] {
        print("리얼앰에서 가져왔습니다")
        return []
    }
}

// 슈크림 앙꼬
// CoreData - 로컬 저장소
class CoreDataPostStore : PostStoreProtocol {
    func fetchPosts() -> [String] {
        print("코어데이터에서 가져왔습니다")
        return []
    }
}

// 피자 앙꼬
// API
class RealApiPostStore : PostStoreProtocol {
    func fetchPosts() -> [String] {
        print("실서버에서 가져왔습니다")
        return []
    }
}

// 고구마무스 앙꼬
// Firebase
class FirebasePostStore : PostStoreProtocol {
    func fetchPosts() -> [String] {
        print("파이어베이스에서 가져왔습니다")
        return []
    }
}

class PostWorker {
    var store : PostStoreProtocol
    
    init(store: PostStoreProtocol) {
        self.store = store
    }
    
    func fetchPosts() -> [String] { // 의존성 주입이 된 녀석의 것을 실행
        return store.fetchPosts()
    }
}

/*
 생성을 할때 주입을 시켜주는 것임
 주입된 녀석에 맞게 진행이됨
 
 - 이렇게 하면 테스트를 독립적으로 할 수 있음
 */
//let postWorker = PostWorker(store: RealApiPostStore())
let postWorker = PostWorker(store: RealmPostStore())
postWorker.fetchPosts()
