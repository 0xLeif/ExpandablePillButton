//
//  ExpandablePillButton.swift
//  ExpandablePillButton
//
//  Created by Zach Eriksen on 10/16/20.
//

import SwiftUI

public struct UniqueImageButton<Content: View>: View, Identifiable {
    public let id = UUID()
    public let label: Content
    public let action: () -> ()
    
    public init(label: Content, action: @escaping () -> ()) {
        self.label = label
        self.action = action
    }
    
    public var body: some View {
        Button(action: action, label: {
            label
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

public struct ExpandablePillButton<Content: View>: View {
    @State private var isExpanded = false
    
    private var actions: Content
    
    public init(@ViewBuilder actions: () -> Content) {
        self.actions = actions()
    }
    
    public var body: some View {
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
                        .foregroundColor(.white)
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
    
    private var expanded: some View {
        VStack(spacing: 44) {
            actions
            
            UniqueImageButton(label: Image(systemName: "xmark")) {
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
            UniqueImageButton(label: Image(systemName: "pencil")) {
                print("Hello World")
            }
            
            UniqueImageButton(label: Image(systemName: "tray.fill")) {
                print("Hello World")
            }
            
            UniqueImageButton(label: Image(systemName: "tray")) {
                print("Hello World")
            }
        }
    }
}
