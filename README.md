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
3. `[p]`タグの代わりに`[m_p]`を使ってください。バックログからィリック待ちとなっている箇所へジャンプができるようになります。

## 改造箇所

|  ファイル名  |  関数名  |
| ---- | ---- |
|  kag.menu.js  |  displayLog  |
|  kag.menu.js  |  snapSave  |

## 動作確認

ティラノスクリプト v514b

## 免責

このプラグインを使用したことにより生じた損害・損失に対して制作者は一切責任を負いません。

## 利用規約

- 改造・再配布は自由です。ただし、有償での再配布は禁止します。  

## 製作者

[orukRed](https://orukred.github.io/)

## issues

バグなどを見つけたもしくは不明点がある場合、以下のいずれかでご連絡ください。

- [Googleフォームから報告](https://orukred.github.io/Contact.html)
- [Twitter(@orukred)でリプライやDM](https://twitter.com/OrukRed)
- [Githubにissueを立てる（バグのみ）](https://github.com/orukRed/tyrano-backlog-jump/issues)
