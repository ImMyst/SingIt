import SwiftUI

struct ContentView: View {
    private var listCountry = ["France", "Angola", "Danemark", "UK"]

    @State var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(countries, id: \.self) {
                    country in HStack {
                        Text(country.capitalized)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("SingIt")
        }
    }

    var countries: [String] {
        let lcCountries = listCountry.map { $0.lowercased() }

        return searchText == "" ? lcCountries : lcCountries.filter { $0.contains(searchText.lowercased())}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
