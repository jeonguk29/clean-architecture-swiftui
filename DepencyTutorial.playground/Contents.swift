import UIKit
//의존성 주입 설명

protocol Pet {
    func doCry()
    func apiCall() -> [String]
}

class Cat : Pet {
    func doCry(){
        print("야옹")
    }
    func apiCall() -> [String] {
        return ["실제","실제","실제","실제"]
    }
}

class CatTest : Pet {
    func doCry(){
        print("야옹!! 테스트")
    }
    
    func apiCall() -> [String] {
        return ["더미","더미","더미","더미"]
    }
}

class Dog : Pet {
    func doCry() {
        print("멍멍")
    }
    func apiCall() -> [String] {
        return ["실제","실제","실제","실제"]
    }
}

func cry(pet: Pet) {
    pet.doCry()
}

cry(pet: Cat())
cry(pet: Dog())
cry(pet: CatTest()) // 같은 함수지만 내부 로직이 다름 이게 의존성 주입의 개념임


func apiCall(pet: Pet) {
    pet.apiCall()
}

apiCall(pet: Cat())
apiCall(pet: CatTest())
