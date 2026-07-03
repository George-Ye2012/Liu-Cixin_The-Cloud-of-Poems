# 诗云 — 沉浸式 3D 诗词宇宙

> 灵感来源：刘慈欣科幻短篇小说《诗云》

基于 **Three.js** 的 3D 诗词可视化项目。1000+ 首中国古诗词化作璀璨星云节点，支持 **手势控制**（单手旋转/双手缩放/双拳聚合）、键盘鼠标交互、节点点击赏诗。

![诗云](screenshot.png)

---

## ✨ 功能

- 🌌 **3D 诗词星云** — 千余首古诗词在三维空间构成旋转星云，节点间以淡金连线勾勒联系
- 🖐️ **AI 手势控制** — MediaPipe 手部识别，张开手掌旋转星云、双手缩放、双拳控制聚合度
- 📜 **诗词弹窗** — 点击节点查看完整诗词（含标题、作者、朝代），金墨书法风格动画呈现
- 🎚️ **节点密度调节** — 左下角滑块 100~2000 节点实时切换
- ⌨️ **键鼠交互** — 鼠标拖拽旋转、滚轮缩放、右键平移，空格键聚散切换
- 🌟 **后期泛光** — UnrealBloomPass 体积光效，营造浩瀚宇宙氛围

---

## 🚀 快速启动

本项目是一个**纯前端 HTML 页面**，但手势识别（MediaPipe）需通过 HTTP 协议加载模型文件，因此**不能直接双击 HTML 打开**。

### 前置要求

- [Node.js](https://nodejs.org/) ≥ 18

### 方法一：一键启动（Windows）

双击项目根目录的 `启动诗云.bat`，自动启动本地服务器并打开浏览器。

### 方法二：手动启动（Windows / Mac / Linux）

```bash
# 进入项目目录
cd 诗云

# 启动本地 HTTP 服务器（以下任选一种）
node -e "var http=require('http'),fs=require('fs'),path=require('path');var M={'.html':'text/html','.js':'application/javascript','.wasm':'application/wasm','.tflite':'application/octet-stream','.binarypb':'application/octet-stream','.data':'application/octet-stream'};http.createServer(function(req,res){var p=req.url.split('?')[0];try{p=decodeURIComponent(p)}catch(e){}var f=path.join(process.cwd(),p);var e=path.extname(f);res.setHeader('Content-Type',M[e]||'text/plain');res.setHeader('Access-Control-Allow-Origin','*');try{res.end(fs.readFileSync(f))}catch(e){res.statusCode=404;res.end('Not found')}}).listen(8080,'127.0.0.1',function(){console.log('http://127.0.0.1:8080/诗云.html')})"
```

或者在项目目录下用其他 HTTP 服务工具：

```bash
# Python
python -m http.server 8080

# npx
npx http-server -p 8080 -c-1
```

然后浏览器打开 **http://127.0.0.1:8080/诗云.html**

---

## 🎮 操作指南

| 操作 | 键鼠 | 手势（需点击右下角按钮开启） |
|------|------|------------------------------|
| 旋转星云 | 鼠标左键拖拽 | 🖐️ 单手张开放到摄像头前，移动手掌 |
| 缩放视野 | 鼠标滚轮 | 🤲 双手张开，拉近/拉远双掌距离 |
| 平移视野 | 鼠标右键拖拽 | — |
| 聚/散切换 | 空格键 | ✊ 双拳握拳，靠拢=聚合、分开=散开 |
| 查看诗词 | 点击节点 | — |

---

## 📁 项目结构

```
诗云/
├── 诗云.html                    # 主程序（单文件，~320KB）
├── 启动诗云.bat                 # Windows 一键启动脚本
├── README.md                    # 本文件
└── mediapipe_hands/package/     # MediaPipe 手势模型文件（~24MB）
    ├── hands.js                 # 手部识别库
    ├── hands.binarypb           # 模型图
    ├── hand_landmark_full.tflite # 全量特征模型
    ├── hand_landmark_lite.tflite # 轻量特征模型
    ├── hands_solution_simd_wasm_bin.wasm  # SIMD WASM 运行时
    └── ...                      # 其他 WASM 资源文件
```

---

## 🔧 技术栈

| 技术 | 用途 |
|------|------|
| [Three.js](https://threejs.org/) v0.160 | 3D 渲染引擎（CDN） |
| OrbitControls | 键鼠轨道控制 |
| EffectComposer + UnrealBloomPass | 后期泛光特效 |
| [MediaPipe Hands](https://ai.google.dev/edge/mediapipe/solutions/vision/hand_landmarker) v0.4 | 手部关键点识别 |
| Node.js | 本地静态文件服务器 |

---

## ⚠️ 常见问题

**Q: 手势按钮显示"环境不支持手势控制"？**
A: 需要 HTTPS 或 localhost 环境 + 摄像头权限。请通过 `http://127.0.0.1:8080/诗云.html` 访问，并允许浏览器使用摄像头。

**Q: 手势控制启动后卡在"加载模型"？**
A: 确保 `mediapipe_hands/package/` 目录完整（约 24MB），所有 `.wasm`、`.tflite`、`.binarypb` 文件齐全。

**Q: 页面加载慢？**
A: Three.js 从 unpkg CDN 加载。国内网络可考虑替换 importmap 中的 CDN 地址为国内镜像（如 bootcdn）。

---

## 📝 灵感来源

> "你能写出比李白更好的诗吗？"
> "当然能。我可以写出所有的诗。"
> —— 刘慈欣《诗云》

在小说中，神级文明耗尽太阳系物质，穷举了所有可能的汉字组合，创造出一片包含一切诗（过去、现在、未来）的"诗云"。本项目试图用代码重现那片璀璨。

---

© 2024 [George-Ye2012](https://github.com/George-Ye2012)
