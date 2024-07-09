import UIKit

//의존성 주입 설명

Protocol Pet {
    func doCry()
}

class Cat : pet {
    func doCry() {
        print("야옹")
    }
}

class Dog : pet {
    func doCry() {
        print("멍멍")
    }
}

func cry(pet: Pet) {
    pet.doCry()
}

cry(pet: Cat())
cry(pet: Dog())
