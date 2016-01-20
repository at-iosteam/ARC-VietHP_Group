import Foundation

/*:
Định nghĩa lớp Person gồm 2 thuộc tính
* name kiểu String: Mỗi người thì có một cái tên
* card kiểu Optional: thẻ tín dụng họ sử dụng. Một người có thể có 1 thẻ tín dụng (là một đối tượng CreditCard) hoặc không có thẻ tín dụng nào (card là nil)
Khi một đối Person bị deallocate, hàm deinit sẽ được gọi
*/
class Person {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }

    deinit {
        print("Ông/bà \(name) đã về với cát bụi")
    }
}

/*:
Định nghĩa lớp CreditCard gồm 2 thuộc tính
* number kiểu Int: Mỗi thẻ tín dụng đều có một số thẻ
* owner: người sở hữu thẻ tín dụng, kiểu Optional. Mỗi thẻ tín dụng chắc chắn phải có một người sở hữu
Khi một đối tượng CreditCard bị deallocate, hàm deinit sẽ được gọi
*/

class CreditCard {
    let number: Int
    let owner: Person
    init(number: Int, owner: Person) {
        self.number = number
        self.owner = owner
    }

    deinit {
        print("thẻ tín dụng số \(number) đã bị huỷ")
    }
}
/*:
Khởi tạo một đối tượng Person có tên Ozawa
*/
var ozawa: Person? = Person(name: "Ozawa")

/*:
Khởi đối tượng ozawa đi đăng kí mở thẻ tín dụng
*/
var card69: CreditCard? = CreditCard(number: 69, owner: ozawa!)
ozawa?.card = card69


/*:
Khi đối tượng ozawa về với cát bụi thì huỷ thẻ tín dụng ozawa sở hữu
*/
ozawa = nil
card69 = nil

/*:
Hãy xem Debug Area phía dưới, nếu không thấy ấn tổ hợp phím Command + Shift + Y
Không có dòng log nào được in ra. Chứng tỏ ozawa và card69 vẫn chưa bị deallocate

*/

/*:
Trong class CreditCard, hãy thay dòng **````var owner: Person````** bằng dòng **````unowned var owner: Person````** và xem lại kết quả.
Lần nãy sẽ có 2 dòng log được in ra. Chứng tỏ ozawa và card69 đã bị allocate
*/
