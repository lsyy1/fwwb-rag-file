# FWWB-RAG-File

基于 RAGFlow 的文档智能处理演示项目，用于 A23 赛事文档智能处理展示。

## 🌟 Demo 预览

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Live-brightgreen)](https://lsyy1.github.io/fwwb-rag-file/)

在线演示地址：[https://lsyy1.github.io/fwwb-rag-file/](https://lsyy1.github.io/fwwb-rag-file/)

> **注意**：当前 Demo 仅展示前端界面，完整功能需要部署后端服务。

## 📋 项目简介

本项目是 RAGFlow 前端应用的编译产物，提供以下核心功能：

- 📄 文档上传与解析
- 🔍 智能问答检索
- 📊 文档可视化展示
- 🤖 基于大语言模型的内容理解
- ✨ **智能填表**（核心比赛功能）

## 🏆 评委一键部署指南

### 前置条件

| 项目 | 要求 |
|------|------|
| Docker | 24.0+ |
| Docker Compose | v2.0+ |
| 内存 | ≥ 16GB |
| 磁盘空间 | ≥ 20GB |

### 一键启动

```bash
# 1. 克隆仓库
git clone https://github.com/lsyy1/fwwb-rag-file.git
cd fwwb-rag-file

# 2. 进入 docker 目录
cd docker

# 3. 复制配置文件
cp .env.example .env

# 4. 启动服务（CPU 模式）
docker compose --profile cpu -f docker-compose.yml up -d
```

### 服务访问

| 服务 | 地址 | 说明 |
|------|------|------|
| 前端页面 | http://localhost:9222 | 主应用界面 |
| 智能填表 | http://localhost:9222/#/form-fill | 核心功能入口 |
| API 文档 | http://localhost:9380/api/docs | 后端 API 文档 |

### 验收步骤

1. **访问系统**：打开 http://localhost:9222
2. **注册账号**：点击「注册」，填写邮箱、用户名、密码
3. **登录系统**：使用注册账号登录
4. **配置模型**：点击右上角头像，选择左侧「模型提供商」，根据实际情况选择并配置大模型
5. **进入智能填表**：点击左侧「智能填表」菜单
6. **新建任务**：点击「新建任务」，输入任务名称
7. **上传文件**：
   - 上传数据源文件（Excel/Word）
   - 上传模板文件（Word）
8. **开始处理**：点击「开始处理」
9. **查看结果**：等待1-2分钟，查看准确率评测（≥95%）
10. **下载结果**：点击「下载结果」获取填写完成的文档

### 预期指标

| 指标 | 预期值 |
|------|--------|
| 字段匹配准确率 | ≥ 95% |
| 数据填充完整度 | ≥ 90% |
| 处理时间 | < 2 分钟 |

### 服务管理

```bash
# 查看日志
docker compose logs -f

# 停止服务
docker compose down

# 重启服务
docker compose restart
```

### 常见问题

- **端口占用**：修改 `.env` 文件中的 `SVR_WEB_HTTP_PORT`
- **内存不足**：确保服务器内存 ≥ 16GB，可修改 `.env` 中的 `MEM_LIMIT` 调整资源限制
- **镜像拉取失败**：检查网络连接或配置国内镜像源（如阿里云镜像）
- **模型配置失败**：确保已正确配置大模型 API Key，推荐使用支持的主流模型提供商
- **文件上传失败**：检查文件格式（支持 Excel/Word）和文件大小限制

### 💡 使用建议

1. **首次使用**：建议先完成模型配置，确保大模型连接正常后再创建任务
2. **文件准备**：数据源文件请确保格式规范，模板文件建议使用标准 Word 格式
3. **性能优化**：处理大量文件时，建议分批上传，避免单次处理过多数据
4. **结果验证**：处理完成后建议人工验证部分字段，确保准确率符合预期
5. **资源管理**：测试完成后及时停止容器，释放服务器资源

## 🔗 GitHub Pages 访问

### 首页
[https://lsyy1.github.io/fwwb-rag-file/](https://lsyy1.github.io/fwwb-rag-file/)

### 各功能页面

| 页面 | 路径 |
|------|------|
| 首页 | `/fwwb-rag-file/#/home` |
| 数据集 | `/fwwb-rag-file/#/datasets` |
| 智能填表 | `/fwwb-rag-file/#/form-fill` |
| 搜索 | `/fwwb-rag-file/#/searches` |
| 聊天 | `/fwwb-rag-file/#/chats` |
| 文件管理 | `/fwwb-rag-file/#/files` |
| 代理管理 | `/fwwb-rag-file/#/agents` |

> **说明**：由于使用 HashRouter，URL 中会包含 `/#/` 前缀。

## ⚠️ 关于 API 请求错误

当访问 Demo 页面时，浏览器控制台可能会看到 API 请求 404 错误，这是正常现象。原因是 GitHub Pages 仅托管静态文件，不提供后端 API 服务。如需完整功能，请使用 Docker Compose 部署后端服务。

## 🐳 Docker 部署

### 方式一：使用比赛专用镜像

```bash
docker pull lsyy1/ragflow-fwwb:1.0.0
```

### 方式二：使用官方镜像

```bash
docker pull ragflow/ragflow:latest
```

## 🛠️ 技术栈

| 分类 | 技术 |
|------|------|
| 前端框架 | React 18 + TypeScript |
| 构建工具 | Vite |
| 样式方案 | Tailwind CSS 3 |
| 状态管理 | Zustand |
| 路由管理 | React Router (HashRouter) |
| 后端框架 | Python Quart |
| 数据库 | MySQL / Elasticsearch |

## 📁 项目结构

```
fwwb-rag-file/
├── assets/          # 静态资源
├── chunk/           # 代码块（按需加载）
├── entry/           # 入口文件
├── pdfjs-dist/      # PDF 预览依赖
├── vs/              # Monaco 编辑器依赖
├── conf.json        # 配置文件
├── iconfont.js      # 字体图标
├── index.html       # 入口 HTML
├── 404.html         # 路由 fallback
├── logo.svg         # Logo
├── docker/          # Docker 配置
│   ├── .env.example # 配置模板
│   ├── docker-compose.yml # 编排文件
│   ├── docker-compose-base.yml # 基础服务配置
│   └── entrypoint.sh # 启动脚本
└── README.md        # 项目说明
```

## 📝 更新记录

| 版本 | 更新内容 | 日期 |
|------|----------|------|
| v1.0.0 | 初始版本发布 | 2026-04 |
| v1.0.1 | 修复路由问题，改用 HashRouter | 2026-04 |
| v1.0.2 | 修复资源路径问题 | 2026-04 |
| v1.0.3 | 添加评委一键部署指南和 Docker 配置 | 2026-04 |

## 📄 License

MIT License

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

---

**比赛专用镜像**: `lsyy1/ragflow-fwwb:1.0.0`