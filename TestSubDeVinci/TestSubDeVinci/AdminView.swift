import SwiftUI
import Foundation


struct AdminView: View {
    @StateObject var viewModel = ContentViewUser()
    @State private var users: [User] = []
    
    var body: some View {
        VStack {
            Text("Bienvenue l'Admin")
                .font(.title)
                .padding()
            
            List(users, id: \.id) { user in
                VStack(alignment: .leading) {
                    Text("\(user.firstName) \(user.familyName)")
                        .font(.headline)
                    Text("Pseudo: \(user.pseudo)")
                        .font(.subheadline)
                    Text("Admin: \(user.isAdmin ? "Oui" : "Non")")
                        .font(.subheadline)
                }
                .padding()
            }
            .onAppear {
                // Charger la liste des utilisateurs lorsque la vue apparaît
                users = viewModel.getAllUsers()
            }
        }
    }
}

