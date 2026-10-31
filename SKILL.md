---
name: x-grab-codex-analyze
description: 任何时候需要抓取或分析 X（Twitter）内容时使用：bot 只抓取并存 JSON，分析和写报告交给 Codex，省 bot 额度。
---
# X 抓取 + Codex 分析

目的：bot 只当“抓手”，把耗额度的分析交给云电脑上已登录的 Codex CLI。

## 步骤
1. 用 X 工具（get_posts_by_id、search_posts_recent 等）抓取所需帖子。抓取过程中不要在对话里做分析、总结或排版。
2. 把原始结果原样写成 JSON 文件：`/workspace/materials/x-grab/<YYYYMMDD-HHMM>-<主题>.json`（用 Shell 写入，不要把内容回显到对话里）。
3. 调用 Codex 分析：`/workspace/materials/x-analyze.sh <json路径> "<用户的分析要求>"`。这一步可能要几分钟，用 block_until_ms 0 放后台跑，完成通知会自动回来。脚本输出报告路径，报告存在 `/workspace/materials/x-reports/`。
4. 读报告，用一两句话把结论转给用户，长报告直接作为附件发送，不要自己再重写一遍。

## 注意
- 只抓一两条帖子、用户只要一句话答案时，可以直接回答，不必走 Codex。
- 如果 Codex 未登录（`codex login status` 显示 Not logged in），用 `codex login --device-auth` 让用户重新登录。
- 币安/加密货币相关内容不要推送到微信。
