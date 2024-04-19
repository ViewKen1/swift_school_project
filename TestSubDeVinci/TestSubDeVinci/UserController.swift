import Foundation
import CoreData

class UserController: ObservableObject {
    static var shared = UserController()
    
    let container: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    private init() {
        container = NSPersistentContainer(name: "UserStorage")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Erreur lors du chargement de CoreData: \(error.localizedDescription)")
            }
        }
    }
    
    // Fonction pour vérifier la connexion de l'utilisateur
    func connexionUser(pseudo: String, password: String) -> ResultConnect {
        // Récupérer tous les utilisateurs depuis Core Data
        let allUsers = getAllUsers()
        
        // Vérifier si le pseudo est présent dans la liste des utilisateurs
        if allUsers.contains(where: { $0.pseudo == pseudo }) {
            // Récupérer l'utilisateur correspondant au pseudo donné
            if let user = allUsers.first(where: { $0.pseudo == pseudo }) {
                // Vérifier si le mot de passe correspond
                if user.password == password {
                    if user.isAdmin {
                        return .adminCo
                    }else {
                        return .connected
                    }
                } else {
                    // Mot de passe incorrect
                    return .badPassword
                }
            }
        }
        // Pseudo incorrect
        return .loginUnavailable
    }


    func getAllUsers() -> [User] {
        let request: NSFetchRequest<User> = User.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            print("Erreur lors de la récupération des utilisateurs: \(error.localizedDescription)")
            return []
        }
    }
    
    func addUser(pseudo: String, firstName: String, familyName: String, isAdmin: Bool, password: String) {
        let context = container.viewContext
        let newUser = User(context: context)
        newUser.pseudo = pseudo
        newUser.firstName = firstName
        newUser.familyName = familyName
        newUser.isAdmin = isAdmin
        newUser.password = password
        
        do {
            try context.save()
        } catch {
            fatalError("Erreur lors de l'ajout de l'utilisateur : \(error)")
        }
    }
    
    func addInitialUsers() {
        let users = [
            ("JMartin", "Jean", "Martin", true, "12345ABC"),
            ("MDupont", "Marie", "Dupont", true, "J@imeLesM0tsDeP@sseDifficiles")
        ]
        
        for user in users {
            addUser(pseudo: user.0, firstName: user.1, familyName: user.2, isAdmin: user.3, password: user.4)
        }
    }
}

enum ResultConnect {
    case connected
    case loginUnavailable
    case badPassword
    case adminCo
}

