# FWWB-RAG-File

基于 RAGFlow 的文档智能处理演示项目，用于 A23 赛事文档智能处理展示。

## 🌟 Demo 预览

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Live-brightgreen)](https://lsyy1.github.io/fwwb-rag-file/)

在线演示地址：https://lsyy1.github.io/fwwb-rag-file/

## 📋 项目简介

本项目是 RAGFlow 前端应用的编译产物，提供以下功能：

- 📄 文档上传与解析
- 🔍 智能问答检索
- 📊 文档可视化展示
- 🤖 基于大语言模型的内容理解

## 🐳 Docker 部署

### 方式一：使用官方镜像

```bash
# 拉取镜像
docker pull ragflow/ragflow:latest

# 启动容器
docker run -d \
  -p 9222:9222 \
  -v /path/to/data:/app/data \
  --name ragflow \
  ragflow/ragflow:latest
```

### 方式二：本地构建

```bash
# 克隆源码仓库
git clone https://github.com/your-repo/ragflow.git
cd ragflow

# 构建镜像
docker build -t ragflow:local .

# 启动容器
docker run -d -p 9222:9222 ragflow:local
```

## 🛠️ 技术栈

- **前端框架**: React 18 + TypeScript
- **构建工具**: Vite
- **样式方案**: Tailwind CSS 3
- **状态管理**: Zustand
- **路由管理**: React Router
- **图表库**: Recharts / AntV G6

## 📁 项目结构

```
fwwb-rag-file/
├── assets/          # 静态资源（CSS、图片等）
├── chunk/           # 代码块（按需加载）
├── entry/           # 入口文件
├── pdfjs-dist/      # PDF 预览依赖
├── vs/              # Monaco 编辑器依赖
├── conf.json        # 配置文件
├── iconfont.js      # 字体图标
├── index.html       # 入口 HTML
└── logo.svg         # Logo
```

## 🚀 快速开始

### 本地开发

```bash
# 安装依赖
npm install

# 启动开发服务器
npm run dev

# 构建生产版本
VITE_BASE_URL=/fwwb-rag-file/ npm run build
```

### 部署到 GitHub Pages

```bash
# 构建并部署
VITE_BASE_URL=/fwwb-rag-file/ npm run build
cp -r dist/* ragflow-demo/
cd ragflow-demo
git add . && git commit -m "Update demo" && git push origin main
```

## 📝 更新记录

- **v1.0.0** - 初始版本发布，包含文档上传、智能问答等核心功能

## 📄 License

MIT License

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

---

**注意**: 本仓库仅包含编译后的静态文件，源码仓库请联系项目管理员获取。
