# CollectionView: UICollectionView in SwiftUI

## Installation
### Swift Packages

`File -> Swift Packages -> Add Package Dependency...`
Paste the following link: `https://github.com/damienissa/CollectionView.git`

### Swift Package Manager
```swift
dependencies: [
.package(url: "https://github.com/damienissa/CollectionView.git", from: "0.1.0")
]
```


## Using

```swift
CollectionView(["1", "2", "3", "4", "5"], cell: { item in
    Text(item)
})
    .itemSize(width: (UIScreen.main.bounds.width - 70) / 3, height: 200)
    .spacing(space: 16)
    .padding(.horizontal, 16)
```

![CollectionView: UICollectionView in SwiftUI](https://raw.githubusercontent.com/damienissa/CollectionView/master/collectionView.png)
