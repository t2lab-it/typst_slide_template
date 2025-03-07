# typst_slide_template

typstの日本語テンプレート

## テンプレートの使い方

1. 個人アカウント（`user`）でTypst文書を管理する新たなレポジトリ（ここでは`repository`という名前を例にする）を作成する
2. そのレポジトリを自分のPCにクローンする
   ```bash
   gh repo clone user/repository
   ```
4. このレポジトリをサブモジュールとして登録する
   ```bash
   cd repository
   git submodule add git@github.com:t2lab-it/typst_slide_template.git
   ```
5. `main.typ`をコピーする
   ```bash
   cp typst_slide_template/main.typ main.typ
   ```
6. `main.typ`内の1行目を次のように書き換える
   ```typst
   #import "typst_slide_template/lib.typ": *
   ```

## 文献の追加方法

1. `ref.bib`を追加する
   ```bash
   touch ref.bib
   ```
2. `ref.bib`の中にbibtexを入れる
3. `main.typ`の参考文献の`/* */`を外す

## テンプレートへの更新を取り入れるとき

1. サブモジュール内をpullする

   ```bash
   cd typst_slide_template
   git pull origin HEAD
   ```

## 拡張機能について

- 新たに拡張機能，或いは修正を作成した場合は，直接mainブランチに統合せずに，Pull requestsに出してください．
- 新たに欲しい拡張機能や修正などがあれば，Issuesに書いてください．
