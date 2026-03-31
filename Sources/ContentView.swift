import SwiftUI

struct ContentView: View {
    @State private var showDetails = false
    @State private var isLoggedIn = false
    @State private var userName = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                // 基础 if 语句
                Section {
                    Toggle("显示详情", isOn: $showDetails)

                    if showDetails {
                        Text("这里是详情内容")
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                    }
                } header: {
                    Text("1. 基础 if 语句")
                        .font(.headline)
                }

                Divider()

                // if-else 语句
                Section {
                    if isLoggedIn {
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .font(.title)
                            Text("欢迎, \(userName.isEmpty ? "用户" : userName)")
                            Spacer()
                            Button("退出") {
                                isLoggedIn = false
                            }
                        }
                        .padding()
                        .background(Color.green.opacity(0.1))
                    } else {
                        VStack(spacing: 10) {
                            TextField("输入用户名", text: $userName)
                                .textFieldStyle(.roundedBorder)
                            Button("登录") {
                                if !userName.isEmpty {
                                    isLoggedIn = true
                                }
                            }
                        }
                        .padding()
                        .background(Color.orange.opacity(0.1))
                    }
                } header: {
                    Text("2. if-else 切换")
                        .font(.headline)
                }

                Divider()

                // 三元运算符
                Section {
                    HStack {
                        Text(showDetails ? "详情模式" : "简洁模式")
                        Spacer()
                        Toggle("", isOn: $showDetails)
                            .labelsHidden()
                    }
                    .padding()
                    .background(showDetails ? Color.blue.opacity(0.1) : Color.gray.opacity(0.1))
                } header: {
                    Text("3. 三元运算符")
                        .font(.headline)
                }

                Divider()

                // 视图切换动画
                Section {
                    Button("切换视图") {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            showDetails.toggle()
                        }
                    }

                    if showDetails {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("视图 A")
                                .font(.headline)
                            Text("这是视图 A 的内容，带有动画效果")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color.purple.opacity(0.1))
                        .transition(.asymmetric(
                            insertion: .scale(scale: 0.8).combined(with: .opacity),
                            removal: .opacity
                        ))
                    } else {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("视图 B")
                                .font(.headline)
                            Text("这是视图 B 的内容")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color.orange.opacity(0.1))
                        .transition(.asymmetric(
                            insertion: .scale(scale: 0.8).combined(with: .opacity),
                            removal: .opacity
                        ))
                    }
                } header: {
                    Text("4. 动画切换")
                        .font(.headline)
                }

                Divider()

                // 组合条件
                Section {
                    let isVIP = userName.hasPrefix("VIP")
                    let showVIPContent = isLoggedIn && isVIP

                    VStack(alignment: .leading, spacing: 5) {
                        Text("用户: \(userName.isEmpty ? "未登录" : userName)")
                        Text("VIP: \(isVIP ? "是" : "否")")
                        Text("VIP 内容: \(showVIPContent ? "显示" : "隐藏")")
                    }
                    .padding()
                    .background(showVIPContent ? Color.yellow.opacity(0.2) : Color.gray.opacity(0.1))
                } header: {
                    Text("5. 组合条件")
                        .font(.headline)
                }
            }
            .padding(30)
        }
    }
}
