# tyrano-backlog-jump

バックログに記載されている箇所へのジャンプを実装するティラノスクリプト用のプラグイン

## 概要

本プラグインはティラノスクリプトの処理を一部改造しています。
そのため導入することによって他のプラグインが正常に動作しなくなったり、動作に不具合が生じる可能性があります。

## 機能

バックログに表示されているログをクリックすると、そのテキスト表示された地点にジャンプ（戻る）することができます。

## 使い方

1. data/others/plugin/tyrano-backlog-jumpフォルダを全て`「data/others/plugin/」` へ入れてください。
2. `first.ks` 等のゲーム起動時に必ず通過するシナリオファイルに `[plugin name="tyrano-backlog-jump"]` を記述しプラグインを読み込みます。バックログにシナリオを書き込む前に本プラグインを読み込んでください。
3. その後通常通りに`[p]`タグを使うことで、バックログジャンプ用のデータ処理が行われます。
4. 任意のタイミングでバックログを開き、テキストをクリックすることでその箇所へジャンプすることができます。

## 改造箇所

本プラグインは既存の処理に改造を加えており、以下の変更が加わっています。

- ロード時にバックログの全消去
  - ロード後にバックログが残っている場合、意図せぬセーブデータのバックログへとジャンプしてしまうことによる混乱を防ぐため。
- [p]タグの上書き

改造した関数は以下です。
|  元の関数定義ファイル名  |上書きした関数定義ファイル名|  関数名  | 主な改造内容
| ---- | ---- | ---- |
|  kag.tag.js  | define.js |  tyrano.plugin.kag.tag.p |pタグ呼び出しごとにsavesnapタグを呼び出すように変更|
|  kag.tag_system.js  | define.js |  tyrano.plugin.kag.tag.pushlog  |joinパラメータがfalseの箇所にはバックログジャンプができないような処理を追加|
|  kag.tag.js  | define.js |  tyrano.plugin.kag.tag.text.pushTextToBackLog  |pushlogタグで追加したテキスト以外にの場合は中にcanBacklogJumpクラスを追加|
|  kag.menu.js  | define.js |  tyrano.plugin.kag.menu.loadGameData  |ゲームロード時にバックログを全消去する処理を追加|
|  kag.menu.js  | define.js |  tyrano.plugin.kag.menu.displayLog  |バックログのテキストをクリックできるようにし、クリックした地点へとジャンプできるように変更|
|  kag.menu.js  | define.js |  tyrano.plugin.kag.menu.snapSave  |m_pタグからsnapsaveタグを呼んだ場合にバックログ用の|

なお、上書きした関数の中で処理を追加した箇所については以下のように開始箇所と終了箇所を囲んでいます。
（つまりは元のティラノスクリプトから処理を追加したとこがわかるようになっています）
バックログジャンプ機能を改造・移植する際の参考にしてください。

```js:sample
//追加箇所start------------------------------------------------
hoge.foo();
//追加箇所end------------------------------------------------
```

## 動作確認

ティラノスクリプト v514b

## 免責

このプラグインを使用したことにより生じた損害・損失に対して制作者は一切責任を負いません。

## 利用規約

- 改造・再配布は自由です。

## 製作者

[orukRed](https://orukred.github.io/)

## issues

バグなどを見つけたもしくは不明点がある場合、以下のいずれかでご連絡ください。

- [Googleフォームから報告](https://orukred.github.io/Contact.html)
- [Twitter(@orukred)でリプライやDM](https://twitter.com/OrukRed)
- [Githubにissueを立てる（バグのみ）](https://github.com/orukRed/tyrano-backlog-jump/issues)
