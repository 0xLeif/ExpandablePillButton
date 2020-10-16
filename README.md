# ExpandablePillButton

ExpandablePillButton to show many actions

## Example Usage

```swift
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
```
