import SwiftUI

struct Tea: Codable {
    var name: String
    var description: String
    var caffeine_content: String
    var type: String
    var origin_country: String
    var image: String
    var flavor: String
    var brewing_method: String
    var health_benefits: String
}

struct HomeView: View {
    @State private var teas: [Tea] = []
    @State private var searchText = ""
    
    var filteredTeas: [Tea] {
        if searchText.isEmpty {
           return teas
        } else {
            return teas.filter { tea in
                tea.name.localizedCaseInsensitiveContains(searchText) || tea.description.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationView {
            List(filteredTeas, id: \.name) { tea in
                NavigationLink(destination: TeaDetail(tea: tea)) {
                    VStack(alignment: .leading) {
                        Text(tea.name)
                            .font(.headline)
                        Text(tea.description)
                            .font(.subheadline)
                    }
                }
            }
            .navigationBarTitle("Tea List")
            .searchable(text: $searchText)
        }
        .onAppear {
            if let fileLocation = Bundle.main.url(forResource: "db", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: fileLocation)
                    let decodedData = try JSONDecoder().decode([String:[Tea]].self, from: data)
                    if let teas = decodedData["herbs"] {
                        self.teas = teas
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
