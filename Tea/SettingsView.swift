import SwiftUI

struct SettingsView: View {
    @State private var name = UserDefaults.standard.string(forKey: "name") ?? ""
    @State private var date = UserDefaults.standard.object(forKey: "date") as? Date ?? Date()
    @State private var temperatureUnit = UserDefaults.standard.string(forKey: "temperatureUnit") ?? "Celsius"
    
    let temperatureUnits = ["Celsius", "Fahrenheit"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Basic Information")) {
                    TextField("Name", text: $name)
                    DatePicker("Date of birth", selection: $date, displayedComponents: .date)
                }
                
                Section(header: Text("Information")) {
                    Link("Terms of Service", destination: URL(string: "https://github.com/")!)
                    Link("Privacy Policy", destination: URL(string: "https://github.com/")!)
                    Link("About Us", destination: URL(string: "https://github.com/")!)
                    Link("GitHub", destination: URL(string: "https://github.com/")!)
                }
            }
            .navigationTitle("Settings")
            .onChange(of: name) { value in
                UserDefaults.standard.set(value, forKey: "name")
            }
            .onChange(of: date) { value in
                UserDefaults.standard.set(value, forKey: "date")
            }
         }
    }
    
    func saveSettings() {
        let defaults = UserDefaults.standard
        defaults.set(name, forKey: "name")
        defaults.set(date, forKey: "date")
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

