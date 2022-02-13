struct Country: Identifiable {
    let id = UUID()
    let imageName: String
    let label: String
}


struct SelectCountryView: View {
    @State private var selectedCountry: Country? = nil
    private let countries = [
        Country(imageName: "egypt_flag", label: "Egypt"),
        Country(imageName: "aue_flag", label: "UAE"),
        Country(imageName: "ksa_flag", label: "KSA"),
    ]
    
    var body: some View {
        VStack {
            Text(selectedCountry?.label ?? "No selection yet")
            HRadioCollection(selectedData: $selectedCountry, data: countries) { country in
                HStack {
                    Image(country.imageName)
                    Text(country.label)
                        .font(Font.system(size: 14.relativeHeight))
                        .bold()
                }
            }
            .radioForegroundColor(.red)
            .padding()
        }
    }
}
