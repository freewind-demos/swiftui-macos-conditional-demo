# SwiftUI macOS 条件布局

## 简介

演示 SwiftUI 中 if/else 条件布局的用法，根据状态显示或隐藏视图。

## 快速开始

```bash
cd swiftui-macos-conditional-demo
xcodegen generate
open SwiftUIConditionalDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### 基础 if 语句

```swift
if showDetails {
    DetailView()
}
```

### if-else 语句

```swift
if isLoggedIn {
    LoggedInView()
} else {
    LoginView()
}
```

### 三元运算符

```swift
Text(showDetails ? "详情" : "简洁")
```

### 动画切换

```swift
if showDetails {
    ViewA()
        .transition(.scale)
} else {
    ViewB()
        .transition(.opacity)
}
```

配合 `withAnimation` 使用：

```swift
Button("切换") {
    withAnimation {
        showDetails.toggle()
    }
}
```

## 完整示例

```swift
struct ContentView: View {
    @State private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            LoggedInView()
        } else {
            LoginView(onLogin: {
                isLoggedIn = true
            })
        }
    }
}
```

## 完整讲解（中文）

### 为什么用 if 而不是 ForEach

- `if` 用于条件渲染（0或1个视图）
- `ForEach` 用于列表渲染（0或多个视图）

### 动画效果

使用 `withAnimation` 可以让视图切换有动画效果：
- `.scale` - 缩放
- `.opacity` - 透明度
- `.move` - 移动

### 过渡效果

`.transition()` 定义视图出现和消失时的动画：
- `.asymmetric` 可以分别设置进入和退出动画
