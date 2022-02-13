struct ContentView: View {
    @State var location: String = ""

    var body: some View {
        let binding = Binding<String>(get: {
            self.location
        }, set: {
            self.location = $0
            // do whatever you want here
        })

        return VStack {
            Text("Current location: \(location)")
            TextField("Search Location", text: binding)
        }

    }
}
