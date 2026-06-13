# dotfiles をサプライチェーン攻撃から守る

Cyber-sec+ Meetup vol.9（2026-06-18）の 5 分 LT スライド。

- 題材リポジトリ: <https://github.com/haruyama/Settings>
- ツール: [Marp](https://marp.app/)（Markdown でスライド）

## ビルド

```sh
# 公開用 index.html を生成
make html

# 編集しながらプレビュー
make watch

# PDF が必要なら
make pdf
```

`Makefile` の `MARP_VERSION` はバージョン固定にしてある。上げる前に
`npm view @marp-team/marp-cli version` で実在する最新版を確認すること。

## 公開

`index.html` を生成すれば `https://haruyama.github.io/cybersec_20260618/`
で表示される（既存スライドと同じ構成）。
