import SwiftUI

struct CustomTextField: View {
    
    @Binding var value: String
    var placeholder: String = ""
    var type: CustomTextFieldType? = .text

    var body: some View {
        VStack(alignment: .leading) {
            Text(placeholder)
            if type == .password {
                SecureField("", text: $value)
                    .customTextFieldMod()
            } else {
                TextField("", text: $value)
                    .customTextFieldMod()
            }
        }
    }
}

struct CustomTextFieldMod: ViewModifier {
    func body(content: Content) -> some View {
    content
            .disableAutocorrection(true)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(.blue)
            .padding(10)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
    }
}

extension View {
    func customTextFieldMod() -> some View {
        modifier(CustomTextFieldMod())
    }
}

enum CustomTextFieldType {
    case password
    case text
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(value: .contant(""), placeholder: "Test", type: .text)
    }
}
