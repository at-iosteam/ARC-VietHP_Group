import Foundation

/*:
Định nghĩa lớp Person gồm 2 thuộc tính
* name kiểu String: Mỗi người thì có một cái tên
* appartment kiểu Optional: căn hộ mà họ ở. Một người có thể có 1 chỗ ở (là một đối tượng Appartment) hoặc vô gia cư (appartment là nil)
khi một đối Person bị deallocate, hàm deinit sẽ được gọi
*/
class Person {
    let name: String
    var appartment: Appartment?
    init(name: String) {
        self.name = name
    }

    deinit {
        print("Ông/bà \(name) đã về với cát bụi")
    }
}

/*:
Định nghĩa lớp Appartment gồm 2 thuộc tính
* number kiểu Int: Mỗi căn hộ thì có một số để chỉ địa chỉ của căn hộ
* owner: căn hộ mà họ ở, kiểu Optional. Mỗi căn hộ sẽ có một người thuê (owner là một đối tượng Person) hoặc chưa có ai thuê (owner là nil)
khi một đối tượng Appartment bị deallocate, hàm deinit sẽ được gọi
*/

class Appartment {
    let number: Int
    var owner: Person?
    init(number: Int) {
        self.number = number
    }

    deinit {
        print("Phòng số \(number) đã bị đập phá")
    }
}
/*:
Khởi tạo một đối tượng Person có tên Ozawa
*/
var ozawa: Person? = Person(name: "Ozawa")

/*:
Khởi tạo một đối tượng Appartment có số phòng là 69
*/
var number69: Appartment? = Appartment(number: 69)

/*:
Khi đối tượng ozawa đến thuê appartment number69
*/
ozawa?.appartment = number69
number69?.owner = ozawa

/*:
Khi đối tượng ozawa về với cát bụi và appartment number69 bị đập phá
*/
ozawa = nil
number69 = nil

/*:
Hãy xem Debug Area phía dưới, nếu không thấy Debug Area hiện ra thì ấn tổ hợp phím Command + Shift + Y để hiện Debug Area
Không có dòng log nào được in ra. Chứng tỏ ozawa và number69 vẫn chưa bị deallocate

*/

/*:
Trong class Appartment, hãy thay dòng **````var owner: Person?````** bằng dòng **````weak var owner: Person?````** và xem lại kết quả.
Lần nãy sẽ có 2 dòng log được in ra. Chứng tỏ ozawa và number69 đã bị allocate
*/
