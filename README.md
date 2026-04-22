# FWWB-RAG-File

基于 RAGFlow 的文档智能处理演示项目，用于 A23 赛事文档智能处理展示。

## 🌟 Demo 预览

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Live-brightgreen)](https://lsyy1.github.io/fwwb-rag-file/)

在线演示地址：https://lsyy1.github.io/fwwb-rag-file/

> **注意**：当前 Demo 仅展示前端界面，完整功能需要部署后端服务。

## 📋 项目简介

本项目是 RAGFlow 前端应用的编译产物，提供以下功能：

- 📄 文档上传与解析
- 🔍 智能问答检索
- 📊 文档可视化展示
- 🤖 基于大语言模型的内容理解

## 🔗 访问方式

### 首页
```
https://lsyy1.github.io/fwwb-rag-file/
```

### 各功能页面
| 页面 | 路径 |
|------|------|
| 首页 | `/fwwb-rag-file/#/home` |
| 数据集 | `/fwwb-rag-file/#/datasets` |
| 文档填写 | `/fwwb-rag-file/#/form-fill` |
| 搜索 | `/fwwb-rag-file/#/searches` |
| 聊天 | `/fwwb-rag-file/#/chats` |
| 文件管理 | `/fwwb-rag-file/#/files` |
| 代理管理 | `/fwwb-rag-file/#/agents` |

> **说明**：由于使用 HashRouter，URL 中会包含 `/#/` 前缀。

## ⚠️ 关于 API 请求错误

当访问 Demo 页面时，浏览器控制台可能会看到类似以下的错误：

```
GET https://lsyy1.github.io/v1/user/info 404 (Not Found)
```

这是**正常现象**，原因如下：

1. **GitHub Pages 仅托管静态文件**，不提供后端 API 服务
2. 前端应用启动时会自动请求后端 API 获取用户信息等数据
3. 由于没有后端服务，这些请求会返回 404

如需完整功能，请部署后端服务（见下文）。

## 🐳 Docker 部署（完整功能）

### 方式一：使用官方镜像

```bash
# 拉取镜像
docker pull ragflow/ragflow:latest

# 启动容器（包含前端和后端）
docker run -d \
  -p 9222:9222 \
  -p 9380:9380 \
  -v /path/to/data:/app/data \
  --name ragflow \
  ragflow/ragflow:latest
```

### 方式二：本地构建运行

```bash
# 克隆源码仓库
git clone https://github.com/infiniflow/ragflow.git
cd ragflow

# 使用 Docker Compose 启动所有服务
cd docker
docker compose -f docker-compose.yml up -d
```

### 访问地址

- **前端界面**: http://localhost:9222
- **API 文档**: http://localhost:9380/api/docs

## 🛠️ 技术栈

| 分类 | 技术 |
|------|------|
| 前端框架 | React 18 + TypeScript |
| 构建工具 | Vite |
| 样式方案 | Tailwind CSS 3 |
| 状态管理 | Zustand |
| 路由管理 | React Router (HashRouter) |
| 图表库 | Recharts / AntV G6 |
| 后端框架 | Python Quart |
| 数据库 | MySQL / Elasticsearch |

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
├── 404.html         # 路由 fallback
├── logo.svg         # Logo
└── README.md        # 项目说明
```

## 🚀 快速开始

### 本地开发

```bash
# 安装依赖
npm install

# 启动开发服务器（需配合后端）
npm run dev

# 构建生产版本
npm run build
```

### 部署到 GitHub Pages

```bash
# 构建并部署
npm run build
cp -r dist/* ragflow-demo/
cd ragflow-demo
git add . && git commit -m "Update demo" && git push origin main
```

## 📝 更新记录

| 版本 | 更新内容 | 日期 |
|------|----------|------|
| v1.0.0 | 初始版本发布 | 2026-04 |
| v1.0.1 | 修复路由问题，改用 HashRouter | 2026-04 |

## 📄 License

MIT License

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

---

**注意**: 本仓库仅包含编译后的静态文件，完整源码请访问 [RAGFlow 官方仓库](https://github.com/infiniflow/ragflow)。
