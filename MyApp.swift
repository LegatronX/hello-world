import SwiftUI
import AppIntents

// Définir un intent avec un paramètre
struct MySimpleIntent: AppIntent {
    static var title: LocalizedStringResource = "Run My Intent"
    
    // Paramètre pour personnaliser l'intent
    @Parameter(title: "Custom Message")
    var message: Int
    
    // Description de l'intent pour Raccourcis
    static var description: IntentDescription {
        IntentDescription(
            "Run my intent with a custom message",
            categoryName: "General"
        )
    }
    
    // Logique exécutée par l'intent
    func perform() async throws -> some IntentResult {
        return .result(dialog: "Message received: \(message)")
    }
}

// Structure principale de l'application
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    // Déclarer les intents et raccourcis dans l'application
    @AppShortcutsBuilder
    var appShortcuts: [AppShortcut] {
        // Créer un raccourci basé sur l'intent
        AppShortcut(
            intent: MySimpleIntent(message: "Bonjour"), phrases: "Coucou"
            
        )
    }
}

// Interface utilisateur simple
struct ContentView: View {
    var body: some View {
        Text("Welcome to MyApp!")
            .padding()
    }
}
