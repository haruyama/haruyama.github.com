# Marp CLI はピン留めして呼ぶ（このLTの題材＝サプライチェーン対策と同じ流儀）。
# 現在の最新は `npm view @marp-team/marp-cli version` で確認してから上げること。
# renovate: datasource=npm depName=@marp-team/marp-cli
MARP_VERSION := 4.2.1

MARP := npx --yes --package @marp-team/marp-cli@$(MARP_VERSION) -- marp

.PHONY: html pdf watch clean

# GitHub Pages 用に index.html を生成（自己完結HTML）
html:
	$(MARP) --html --bespoke.progress slides.md -o index.html

pdf:
	$(MARP) --pdf --allow-local-files slides.md -o slides.pdf

# 編集中プレビュー（ブラウザが開く）
watch:
	$(MARP) -w -s .

clean:
	rm -f index.html slides.pdf
