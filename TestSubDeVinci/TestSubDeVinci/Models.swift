
import Foundation

class Model {
    let questions: [MyQuestion] = [
        MyQuestion(
            statement: "Sur quel environnement peut-on utiliser XCode ?" ,
            proposal: [
                "Uniquement avec les PC Windows.",
                "Uniquement les Macs.",
                "Les deux. Ça n'a pas d'importance."
            ],
            answer: .two
        ),
        MyQuestion(
            statement: "Que signifie MVVM ?",
            proposal: [
                "Model, Value, View, Movement",
                "Model, View, ViewModel",
                "Modal, Value, ViewModal"
            ],
            answer: .two
        ),
        MyQuestion(
            statement: "Quel framework est utilisé par Swift ?",
            proposal: [
                "VirtualWire",
                "Cocoa Touch",
                "Serial"
            ],
            answer: .two
        ),
        MyQuestion(
            statement: "Quels sont les éléments d'une variable ?",
            proposal: [
                "Un type et une valeur.",
                "Un nom, un singleton et un type.",
                "Un nom, un type et une valeur."
            ],
            answer: .three
        ),
        MyQuestion(
            statement: "Avec UIKit, qu'utilise-t-on pour lier une vue au storyBoard ?",
            proposal: [
                "Le mot clé @IBOutlet",
                "Le mot clé @IBAction",
                "Le mot clé @Published"
            ],
            answer: .one
        ),
        MyQuestion(
            statement: "Quelle est l'utilité d'un singleton",
            proposal: [
                "Ce n'est pas la peine d'utiliser un Model.",
                "Il permet de rectifier les fichiers audio.",
                "Cela génère une instance unique."
            ],
            answer: .three
        ),
        MyQuestion(
            statement: "'struct MainView: some View' doit contenir",
            proposal: [
                "var body: someView",
                "#Preview { }",
                "Un initialiseur"
            ],
            answer: .one
        ),
        MyQuestion(
            statement: "Quel est ce type : Chien?",
            proposal: [
                "C'est Kiki !!! Je l'ai vu en rêve cette nuit.",
                "C'est un type Chien",
                "C'est un optionnel"
            ],
            answer: .three
        ),
        MyQuestion(
            statement: "Comment retourne-t-on une valeur avec un dictionnaire ?",
            proposal: [
                "Avec un index",
                "Avec une clé",
                "Par concaténation"
            ],
            answer: .two
        ),
        MyQuestion(
            statement: "Quel est le principe de la View et du Model",
            proposal: [
                "Ils ne se parlent pas",
                "Ils peuvent se voir de temps en temps",
                "Ils discutent en permanence"
            ],
            answer: .one
        )
    ]
}

struct MyQuestion {
    let statement: String
    let proposal: [String]
    let answer: possibleAnswers
}

enum possibleAnswers: Int {
    case one = 1
    case two = 2
    case three = 3
}
