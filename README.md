# HorizontalCrossFlowLayout
基于swift3.0的 水平横向排布流体布局


## 应用场景
- 当我们使用UICollectionView这种方式开发表情键盘的时候，我们一般会采用系统提供的FlowLayout，效果如下:
<br />
![采用系统FlowLayout](https://raw.githubusercontent.com/EastblueOkay/HorizontalCrossFlowLayout/master/readImages/Snip20160928_5.png)  
其中有个问题就是每一个Section虽然是水平排布的，但是其中的item却是垂直排布的，这就和有些需求相悖了，所以<code>HorizontalCrossFlowLayout</code>就在FlowLayout基础上实现了一种水平横向排布的布局，效果如下：  
<br />
![采用HorizontalCrossFlowLayout](https://raw.githubusercontent.com/EastblueOkay/HorizontalCrossFlowLayout/master/readImages/Snip20160928_4.png)


## 使用方法
```swift
/** 设置layout为HorizontalCrossFlowLayout**/
collectionView.collectionViewLayout = HorizontalCrossFlowLayout(colNumber: kColNumber, lineNumber: kLineNumber)

/** 进行一些其他的设置 **/
let layout = collectionView.collectionViewLayout as! HorizontalCrossFlowLayout
layout.itemSize = CGSize(width: collectionView.bounds.width / CGFloat(kColNumber), height: collectionView.bounds.height / CGFloat(kLineNumber))
layout.minimumLineSpacing = 0
layout.minimumInteritemSpacing  = 0

```
