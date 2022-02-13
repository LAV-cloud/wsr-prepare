var searchResults: [String] {
    if search.isEmpty {
        return data
    } else {
        return data.filter { $0.contains(search) }
    }
}
