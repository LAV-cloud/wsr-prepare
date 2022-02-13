struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("First") { }
            Button("Second") { }
            Button("Third") { }
        }
    }
}

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
        }
    }
}

struct TVShow: Identifiable {
    var id: String { name }
    let name: String
}

struct ContentView: View {
    @State private var selectedShow: TVShow?

    var body: some View {
        VStack(spacing: 20) {
            Text("What is your favorite TV show?")
                .font(.headline)

            Button("Select Ted Lasso") {
                selectedShow = TVShow(name: "Ted Lasso")
            }

            Button("Select Bridgerton") {
                selectedShow = TVShow(name: "Bridgerton")
            }
        }
        .alert(item: $selectedShow) { show in
            Alert(title: Text(show.name), message: Text("Great choice!"), dismissButton: .cancel())
        }
    }
}
