# X 抓取 + Codex 分析（Grok Bot 省额度技能）

思路：Grok Bot 只当“抓手”，把 X 上抓到的原始数据存成 JSON 文件；最耗额度的清洗、总结、写报告交给 Codex CLI 去做，用 Codex 的额度。

## 安装
1. 在 Grok Bot 的云电脑上安装并登录 Codex：
   `npm i -g @openai/codex && codex login --device-auth`
   （如提示需要开启设备代码登录，到 ChatGPT 设置的「安全」里打开 Codex 设备代码授权）
2. 把 `scripts/x-analyze.sh` 放到 `/workspace/materials/` 并 `chmod +x`，再建好 `/workspace/materials/x-grab/` 和 `x-reports/` 两个文件夹。
3. 把 `SKILL.md` 的内容发给你的 Grok Bot，让它保存为技能。

## 用法
`x-analyze.sh <json文件> "分析要求"`，报告输出到 `/workspace/materials/x-reports/`。
