import SwiftUI

struct TeaDetail: View {
    let tea: Tea

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            VStack(alignment: .leading, spacing: 5) {
                Text("Description:")
                    .font(.headline)

                Text(tea.description)
                     .font(.body)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("Caffeine content:")
                    .font(.headline)

                Text(tea.caffeine_content)
                    .font(.body)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("Type:")
                    .font(.headline)

                Text(tea.type)
                    .font(.body)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("Country of origin:")
                    .font(.headline)

                Text(tea.origin_country)
                    .font(.body)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("Flavor:")
                    .font(.headline)

                Text(tea.flavor)
                    .font(.body)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("Brewing method:")
                    .font(.headline)

                Text(tea.brewing_method)
                    .font(.body)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("Health benefits:")
                    .font(.headline)

                Text(tea.health_benefits)
                    .font(.body)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle(tea.name)
    }
}
