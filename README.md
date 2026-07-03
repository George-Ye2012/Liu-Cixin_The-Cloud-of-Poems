<h1 align="center">诗 云</h1>
<p align="center"><em>The Cloud of Poems</em></p>
<p align="center">基于 Three.js 的沉浸式 3D 诗词宇宙可视化</p>
<p align="center">灵感来自刘慈欣科幻小说《诗云》</p>

---

## ✨ 预览

1000+ 首中国古典诗词在三维空间中构成缓缓旋转的星云。每首诗是一颗发光的节点，节点之间以淡金色线条相连。鼠标拖拽旋转视角，点击节点即可阅读诗词全文。

开启 **AI 手势控制** 后，摄像头识别手部动作——单手旋转星云、双手控制缩放、双拳调节聚散——无需触碰键盘鼠标，像指挥星空一样浏览千年诗海。

---

## 🚀 快速开始

> **注意：** 手势控制依赖 HTTP 协议加载 AI 模型文件，不能直接双击 HTML 打开。

### 前提

- [Node.js](https://nodejs.org/) ≥ 18

### Windows 一键启动

双击 `启动诗云.bat`，自动完成以下步骤：

1.  检查 Node.js 环境
2.  释放端口 8080（如有占用）
3.  启动本地 HTTP 服务器
等待服务器就绪后手动打开浏览器,并打开网页http://127.0.0.1:8080/诗云.html

### Mac / Linux / 手动启动

```bash
cd 诗云
node server.js
# → 浏览器访问 http://127.0.0.1:8080/诗云.html
```

---

## 🎮 操作

| 操作       | 键鼠              | 手势（点右下角按钮开启）            |
| ---------- | ----------------- | ----------------------------------- |
| 旋转视角   | 鼠标左键拖拽      | 🖐️ 单手张开，手掌移动               |
| 缩放       | 鼠标滚轮          | 🤲 双手张开，改变双掌距离           |
| 平移       | 鼠标右键拖拽      | —                                   |
| 聚散切换   | <kbd>空格</kbd>   | ✊ 双拳握拳，靠近聚合 / 远离散开     |
| 节点密度   | 左下角滑块        | —                                   |
| 查看诗词   | 点击节点          | —                                   |

---

## 📁 项目结构

```
诗云/
├── 诗云.html                       主程序（~320 KB）
├── server.js                       本地 HTTP 服务器
├── 启动诗云.bat                    Windows 一键启动
├── README.md
└── mediapipe_hands/package/        MediaPipe 模型文件（~24 MB）
    ├── hands.js                    手部识别 JS 库
    ├── hands.binarypb              模型图
    ├── hand_landmark_full.tflite   全量特征模型（模型复杂度 1）
    ├── hand_landmark_lite.tflite   轻量特征模型（模型复杂度 0）
    ├── *_wasm_bin.wasm             WASM 运行时
    └── ...
```

---

## 🔧 技术栈

| 技术                                                                                 | 用途               |
| ------------------------------------------------------------------------------------ | ------------------ |
| [Three.js](https://threejs.org/) v0.160                                              | 3D 渲染引擎        |
| OrbitControls                                                                        | 键鼠轨道控制       |
| EffectComposer + UnrealBloomPass                                                     | 泛光后期特效       |
| [MediaPipe Hands](https://ai.google.dev/edge/mediapipe/solutions/vision/hand_landmarker) v0.4 | 21 点手部关键点识别 |
| Node.js                                                                              | 静态文件服务       |

---

## ❓ 常见问题

<details>
<summary><b>手势按钮显示"环境不支持手势控制"</b></summary>

请确认已通过 `http://127.0.0.1:8080/诗云.html` 访问（而非 `file://` 协议）。浏览器需要摄像头权限——点击地址栏左侧的锁图标 → 允许摄像头。
</details>

<details>
<summary><b>手势控制卡在"加载模型"</b></summary>

检查 `mediapipe_hands/package/` 目录是否完整（约 24 MB），确保 `.wasm`、`.tflite`、`.binarypb` 文件未缺失。如果从 GitHub 克隆，请确认该目录已完整下载。
</details>

<details>
<summary><b>页面加载很慢</b></summary>

Three.js 从 unpkg CDN 加载。国内网络可编辑 `诗云.html` 中的 `<script type="importmap">` 将 CDN 地址替换为国内镜像。
</details>

<details>
<summary><b>端口 8080 被占用</b></summary>

编辑 `server.js` 中的 `PORT` 变量，改为其他端口（如 3000）。启动脚本会自动尝试释放 8080 端口。
</details>

---

## 📝 背景

> *"你能写出比李白更好的诗吗？"*
> *"当然能。我可以写出所有的诗。"*
>
> —— 刘慈欣《诗云》

小说中，神级文明耗尽太阳系物质，穷举了所有可能的汉字组合，创造出一片包含过去、现在、未来一切诗的"诗云"。这个项目试图用代码重现那片璀璨——每一颗星，都是一首诗。

诗词库收录从先秦《诗经》到近现代共计 1000+ 首经典作品，涵盖李白、杜甫、苏轼、李清照、辛弃疾等数百位诗人。

---

## 📄 许可

MIT License

---

<p align="center">
  <a href="https://github.com/George-Ye2012">George-Ye2012</a> ·
  刘慈欣《诗云》致敬项目
</p>
