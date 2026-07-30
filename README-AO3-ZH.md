# Zapret AO3 Windows 版

这是基于 `Flowseal/zapret-discord-youtube` 的 AO3 适配版，用于 Windows 上访问
`archiveofourown.org`。程序通过 WinDivert 和 zapret 处理 DPI，不是 VPN，也不提供代理服务器。

## 使用方法

1. 下载并解压 `zapret-ao3-windows.zip`，路径不要包含中文或特殊字符。
2. 按照上游说明在浏览器或 Windows 11 中启用 Secure DNS。
3. 右键以管理员身份运行 `general (AO3).bat`。
4. 打开 `https://archiveofourown.org` 验证。
5. 如果专用策略在当前网络无效，可依次尝试其他 `general*.bat`；AO3 已加入通用域名列表。

需要开机自动运行时，启动 `service.bat`，选择 `Install Service`，再选择
`general (AO3).bat`。

## 诊断

在 `service.bat` 中选择 `Run Tests`，AO3 首页和作品列表会包含在标准测试中。
若域名解析失败，请先更换 Secure DNS；若 TLS 仍失败，再切换其他策略。

## 安全说明

WinDivert 是流量拦截驱动，杀毒软件可能将它标记为 RiskTool。二进制文件沿用上游项目，
来源和风险说明见主 [README.md](README.md)。本项目不会修改浏览器证书或解密 HTTPS 内容。
