import Foundation

class ContentViewUser: ObservableObject {
    var userController = UserController.shared
    
    func connexionUser(pseudo: String, password: String) -> ResultConnect {
        return userController.connexionUser(pseudo: pseudo, password: password)
    }
    
    func getAllUsers() -> [User] {
        return userController.getAllUsers()
    }
    func addUser(pseudo: String, firstName: String, familyName: String, isAdmin: Bool, password: String) {
           userController.addUser(pseudo: pseudo, firstName: firstName, familyName: familyName, isAdmin: isAdmin, password: password)
       }
}

