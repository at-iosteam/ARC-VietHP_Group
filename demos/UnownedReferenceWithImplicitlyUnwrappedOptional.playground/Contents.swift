import Foundation

/*:
Định nghĩa lớp Country gồm 2 thuộc tính
* name kiểu String: tên của đất nước
* capitalCity: thành phố thủ đô của đất nước. Một đất nước luôn luôn có một thành phố thủ đô
Khi một đối Country bị deallocate, hàm deinit sẽ được gọi
*/
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }

    deinit {
        print("Nước \(name) đã bị deallocate")
    }
}

/*:
Định nghĩa lớp City gồm 2 thuộc tính
* name kiểu String: tên của thành phố
* country kiểu Country: đất nước sỡ hữu thành phố. Mỗi thành phố luôn luôn thuộc về một đất nước.
Khi một đối tượng City bị deallocate, hàm deinit sẽ được gọi
*/

class City {
    let name: String
    let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }

    deinit {
        print("thành phố \(name) đã bị deallocate")
    }
}
/*:
Khởi tạo một đối tượng Country có tên French, thủ đô có tên là Paris
*/
var french: Country? = Country(name: "French", capitalName: "Paris")

/*:
Sáp nhập thêm một thành phố mới, và chọn thành phố mới này làm thành phố thủ đô mới
*/
var newCity: City? = City(name: "NewCity", country: french!)
french?.capitalCity = newCity!

/*:
Huỷ french và newCity
*/
french = nil
newCity = nil

/*:
Hãy xem Debug Area phía dưới, nếu không thấy ấn tổ hợp phím Command + Shift + Y
Không có một dòng log sau được in ra **thành phố Paris đã bị deallocate**. Chứng tỏ french và newCity vẫn chưa bị deallocate

*/

/*:
Trong class CreditCard, hãy thay dòng **````let country: Country````** bằng dòng **````unowned let country: Country````** và xem lại kết quả.
Lần nãy sẽ có 2 dòng log được in ra. Chứng tỏ french và newCity đã bị deallocate
*/
