//
//  ExpandablePillButton.swift
//  ExpandablePillButton
//
//  Created by Zach Eriksen on 10/16/20.
//

import SwiftUI

public struct UniqueImageButton: View, Identifiable {
    public let id = UUID()
    public let buttonImage: Image
    public let action: () -> ()
    
    public var body: some View {
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
                    Image("plus")
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
