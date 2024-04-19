import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewUser()
    @State private var pseudo: String = ""
    @State private var password: String = ""
    @State private var signInPseudo: String = ""
    @State private var signInpassword: String = ""
    @State private var firstName: String = ""
    @State private var familyName: String = ""
    @State private var isAdmin: Bool = false
    @State private var isConnected: Bool = false
    @State private var adminIsCo: Bool = false
    
    @State private var showRegistrationForm: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if !isConnected && !adminIsCo {
                    // Formulaire de connexion
                    VStack(alignment: .leading) {
                        Text("Connexion")
                            .font(.title)
                            .padding(.bottom, 10)
                        TextField("Pseudo", text: $pseudo)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 5)
                        SecureField("Mot de passe", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 10)
                        Button(action: {
                            let resultConnexion = viewModel.connexionUser(pseudo: pseudo, password: password)
                            switch resultConnexion {
                            case .connected:
                                print("Connexion reussi")
                                isConnected = true
                            case .loginUnavailable:
                                print("Login inexistant")
                            case .badPassword:
                                print("Mauvais password")
                            case .adminCo:
                                print("Admin Co")
                                adminIsCo = true
                            }
                            
                        }) {
                            Text("Se connecter")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                    }
                    .padding()
                    
                    // Formulaire d'inscription
                    if showRegistrationForm {
                        VStack(alignment: .leading) {
                            Text("Inscription")
                                .font(.title)
                                .padding(.bottom, 10)
                            TextField("Prénom", text: $firstName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.bottom, 5)
                            TextField("Nom de famille", text: $familyName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.bottom, 5)
                            TextField("Pseudo", text: $signInPseudo)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.bottom, 5)
                            Toggle("Administrateur", isOn: $isAdmin)
                                .padding(.bottom, 5)
                            SecureField("Mot de passe", text: $signInpassword)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.bottom, 10)
                            Button(action: {
                                // Appel à la fonction d'ajout d'utilisateur
                                viewModel.addUser(pseudo: signInPseudo, firstName: firstName, familyName: familyName, isAdmin: isAdmin, password: signInpassword)
                                print("Utilisateur ajouté avec succès")
                                // Réinitialiser les champs après l'ajout de l'utilisateur
                                signInpassword = ""
                                signInPseudo = ""
                                firstName = ""
                                familyName = ""
                                isAdmin = false
                            }) {
                                Text("S'inscrire")
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
                        }
                        .padding()
                    } else {
                        Button(action: {
                            // Afficher le formulaire d'inscription lorsque le bouton est cliqué
                            self.showRegistrationForm.toggle()
                        }) {
                            Text("Créer un compte")
                                .padding()
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Spacer()
                }
            }
            if isConnected {
                NavigationLink("QCM", destination: QcmView(questions: Model().questions))
                    .padding()
            }
            if adminIsCo {
                NavigationLink("Admin acces", destination: AdminView())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

