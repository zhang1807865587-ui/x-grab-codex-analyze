#!/bin/bash
# 用法: x-analyze.sh <json文件> "分析要求"
# 让 Codex 读取抓取到的 X 数据并写报告，结果存到 x-reports/
f="$1"; ask="${2:-整理成通俗易懂的中文简报，提炼要点、热点和值得关注的帖子链接}"
out="/workspace/materials/x-reports/$(basename "${f%.json}")-report.md"
codex exec --skip-git-repo-check -C /workspace/materials -o "$out" "读取文件 $f（X 抓取的原始 JSON 数据）。要求：$ask。用中文输出 Markdown 报告，不要编造文件里没有的数据。" >/dev/null 2>&1
echo "$out"
