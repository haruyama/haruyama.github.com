---
marp: true
theme: default
paginate: true
size: 16:9
title: リモート開発環境のサプライチェーン攻撃対策
author: HARUYAMA Seigo (@haruyama)
---

<style>
section {
  font-size: 34px;
  line-height: 1.55;
}
h1 { font-size: 56px; }
h2 { font-size: 44px; }
h3 { font-size: 36px; }
ul, ol { line-height: 1.6; }
code { font-size: 0.92em; }
pre code { font-size: 26px; line-height: 1.4; }
section.lead h1 { font-size: 64px; }
strong { color: #b34700; } /* CUD: 朱色寄り（赤緑色覚でも黒と識別しやすい）。明るめにするなら #d55e00 */
table { font-size: 30px; }
footer { font-size: 20px; }
</style>

<!-- _class: lead -->

# リモート開発環境のサプライチェーン攻撃対策

### 〜 個人の dotfiles 系リポジトリでやった対策 〜

HARUYAMA Seigo (@haruyama)
Cyber-sec+ Meetup vol.9 / 2026-06-18

---

## なぜ dotfiles が危ないのか

- 開発環境を **`make` 一発** で全自動セットアップ
- その裏で大量のツールを **ダウンロードして実行** している
  - npm / go install / cargo / pipx / uv / `curl | bash`
- 取得元やパッケージが汚染されたら？
  - → **開発環境（＝鍵も認証情報もある）が即陥落**
- 近年の現実
  - npm を這い回る自己増殖ワーム（Shai-Hulud 系）
  - Laravel-Lang

---

## リポジトリの攻撃面

https://github.com/haruyama/Settings

| 経路 | 例 |
|------|----|
| npm global | textlint / prettier / codex / gemini-cli … |
| go install | gopls / golangci-lint / pinact / k9s |
| cargo / pipx / uv | mcat / pyright / flake8 |
| `curl \| bash` | asdf / uv / rustup / claude install.sh |
| NeoVim プラグイン | git の HEAD を追従 |

**どれも「最新を取ってきて実行」がデフォルトだった** → ここを塞ぐ

---

## 方針 = 4 本の柱

1. **固定 (Pin)** — 何を入れるか曖昧にしない
2. **検証 (Verify)** — 取得物のハッシュを確認する
3. **待つ (Cooldown)** — 公開直後の版を踏まない
4. **自動追従 (Renovate)** — 固定を腐らせず安全に更新する

---

## ① 固定 — すべてバージョン指定

- Makefile: `FOO_VERSION := vX.Y.Z` で全ツール固定
- `.tool-versions` / `.default-npm-packages` も **`name@version`**
- **「latest」を使わない**・`npx <pkg>` を無指定で叩かない
- NeoVim プラグインは **commit SHA** で固定

```make
# renovate: datasource=go depName=github.com/derailed/k9s
K9S_VERSION := v0.51.0
```

---

## ② 検証 — ハッシュで取得物を確認

`curl | bash` をやめ、**DL → ハッシュ照合 → 実行**

```make
curl -fsSL -o $$tmp https://claude.ai/install.sh && \
  echo "$(CLAUDE_INSTALL_SCRIPT_SHA256)  $$tmp" | sha256sum -c - && \
  bash $$tmp
```

- asdf / uv / rustup も同様に **SHA256 を固定して照合**
- `go install` は **手動ハッシュ不要** — Go が公式チェックサムDB
  (`sum.golang.org`) で全モジュールの改竄を自動検証
- `cargo install --locked` で lockfile のハッシュを尊重

---

## ③ 待つ — Cooldown + 信頼できる入口

- npm `.npmrc`: **`min-release-age=3`** （公開後 3 日は入れない）
- uv `uv.toml`: **`exclude-newer = "3 days"`**
- Renovate: **`minimumReleaseAge: '3 days'`**

> 汚染版が **yank される前に踏む** のを防ぐ時間稼ぎ

- 入口を [**Takumi Guard**](https://flatt.tech/takumi/features/guard) (npm, uv) に

---

## ④ 自動追従 — pin を腐らせない

固定は「更新されない＝脆弱性が残る」リスクと裏表

- **Renovate の custom managers** が comment 駆動で全 pin を追跡
- **1 更新 = 1 PR** → 差分をレビューしてからマージ

---

<!-- _class: lead -->

## まとめ

- ソフトウェアサプライチェーンにとって今は過渡期と思われる
- やれることはやった
- やれてないこともある
    - ブラウザ拡張など
