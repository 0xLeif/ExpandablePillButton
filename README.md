# ExpandablePillButton

ExpandablePillButton to show many actions

## POC

```swift
import SwiftUI

struct UniqueImageButton: View, Identifiable {
    let id = UUID()
    let buttonImage: Image
    let action: () -> ()
    
    var body: some View {
        Button(action: action, label: {
            buttonImage
                .foregroundColor(.primary)
                .font(.title)
                .background(
                    Circle()
                        .frame(width: 44,
                               height: 44,
                               alignment: .center)
                )
        })
    }
}

struct ExpandablePillButton<Content: View>: View {
    @State private var isExpanded = false
    
    private var actions: Content
    
    init(@ViewBuilder actions: () -> Content) {
        self.actions = actions()
    }
    
    var body: some View {
        VStack(spacing: 44) {
            if isExpanded {
                expanded
                    .transition(.scale)
                    .animation(.default)
            } else {
                Button(action: {
                    withAnimation {
                        isExpanded = true
                    }
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.primary)
                        .font(.title)
                }
            }
        }
        .padding()
        .background(
            Capsule()
                .foregroundColor(.blue)
        )
        .transition(.scale)
        .animation(.default)
    }
    
    var expanded: some View {
        VStack(spacing: 44) {
            actions
            
            UniqueImageButton(buttonImage: Image(systemName: "xmark")) {
                withAnimation {
                    isExpanded = false
                }
            }
        }
    }
}

struct ExpandablePillButton_Previews: PreviewProvider {
    static var previews: some View {
        ExpandablePillButton {
            UniqueImageButton(buttonImage: Image(systemName: "pencil")) {
                print("Hello World")
            }
            
            UniqueImageButton(buttonImage: Image(systemName: "tray.fill")) {
                print("Hello World")
            }
            
            UniqueImageButton(buttonImage: Image(systemName: "tray")) {
                print("Hello World")
            }
        }
    }
}

```
