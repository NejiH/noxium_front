import SwiftUI

struct ShopCharacterScroll: View {
    @Binding var shopCharacterViewModel: ProductViewModel
    @State var selectedCharacter: ShopCharacter = ShopCharacter(name: "", image: "", price: 0, description: "")
    
    var body: some View {
        ShopCharacterScrollContent(selectedCharacter: $selectedCharacter, shopCharacterViewModel: $shopCharacterViewModel)
            .frame(width: 353, height: selectedCharacter.name.isEmpty ? 250 : 380)
            .applyGlassEffectIfAvailable()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black.opacity(0.25), lineWidth: 1)
            )
            .clipped()
                
        if selectedCharacter.price != 0 {
            
            Button(action: {
                //argentduUser -= selectedCharacter.price
            }, label: {
                HStack{ 
                    Image("coin")
                    Spacer()
                    Text("\(selectedCharacter.price)")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(width: 100)
                .background(.blue50)
                .foregroundStyle(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius:40))
            })
            
        } else {
            EmptyView()
        }
        
        
        Spacer(minLength: 40)
    }
    
    
}

private extension View {
    @ViewBuilder
    func applyGlassEffectIfAvailable() -> some View {
        if #available(iOS 26.0, *) {
            self.glassEffect(
                .clear.tint(.black.opacity(0.19)),
                in: .rect(cornerRadius: 20)
            )
        } else {
            self
        }
    }
}

#Preview {
    ShopCharacterScroll(shopCharacterViewModel: .constant(ProductViewModel()))
}
