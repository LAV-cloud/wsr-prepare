enum Field {
    case search
}

@FocusState var focusSearch: Field?
.focused($focusSearch, equals: .search)
self.focusSearch = .search
