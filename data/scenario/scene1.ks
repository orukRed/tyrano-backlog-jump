;ティラノスクリプトサンプルゲーム

*start

[cm  ]
[clearfix]
[start_keyconfig]


[bg storage="room.jpg" time="100"]

;メニューボタンの表示
@showmenubutton

;メッセージウィンドウの設定
[position layer="message0" left=160 top=500 width=1000 height=200 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="45" marginl="50" marginr="70" marginb="60"]


;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=28 bold=true x=180 y=510]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area"]

;このゲームで登場するキャラクターを宣言
;akane
[chara_new  name="akane" storage="chara/akane/normal.png" jname="あかね"  ]
;キャラクターの表情登録
[chara_face name="akane" face="angry" storage="chara/akane/angry.png"]
[chara_face name="akane" face="doki" storage="chara/akane/doki.png"]
[chara_face name="akane" face="happy" storage="chara/akane/happy.png"]
[chara_face name="akane" face="sad" storage="chara/akane/sad.png"]


;yamato
[chara_new  name="yamato"  storage="chara/yamato/normal.png" jname="やまと" ]

#
あ[m_l][r]
い[m_l][r]
う[m_p]
え[m_l][r]
お[m_l][r]
か[m_p]
き[m_l][r]
く[m_p]


～tyrano-backlog-jumpのテスト用シナリオ～[m_p]
@ptext x="aa" y="aasfe" layer="0" text="aaaaaaaaaa" 
; @pushlog text="おーい"
さて、ゲームが簡単に作れるというから、来てみたものの[m_p]
; @pushlog text="あ"
誰もいねぇじゃねぇか。[m_p]
; @pushlog text="え"
……[m_p]
; @pushlog text="ふぁ"
帰るか。。。[m_p]
; @pushlog text="ふぇ"
1[m_p]
2[m_p]
3[m_p]
4[m_p]
5[m_p]


[font  size="30"   ]
#?
ちょっとまったーーーーー[m_p]
[resetfont  ]

#
誰だ！？[m_p]

;キャラクター登場
[chara_show  name="akane"  ]
#?
こんにちは。[m_p]
私の名前はあかね。[m_p]
#あかね
もしかして、ノベルゲームの開発に興味があるの？[m_p]

[glink  color="blue"  storage="scene1.ks"  size="28"  x="360"  width="500"  y="150"  text="はい。興味あります"  target="*selectinterest"  ]
[glink  color="blue"  storage="scene1.ks"  size="28"  x="360"  width="500"  y="250"  text="興味あります！"  target="*selectinterest"  ]
[glink  color="blue"  storage="scene1.ks"  size="28"  x="360"  width="500"  y="350"  text="どちらかと言うと興味あり"  target="*selectinterest"  ]
[s  ]
*selectinterest

[chara_mod  name="akane" face="happy"  ]
#あかね
わー。興味あるなんて、嬉しいなー。[m_p]
#
・・・・・[m_p]
まぁ、作ってみたい気持ちはあるけど、むずかしいんでしょ？[m_p]
プログラミングとかやったことないし、、、[m_p]

[chara_mod name="akane" face="default"]

#あかね
そんな君に、耳寄りな情報があるんだけど[m_p]
ききたい？　ききたいよね？[m_p]
#
いや、べつに
#あかね
[cm]
[font size=40]
[delay speed=160]
ティラノスクリプトー[m_p]
[delay speed=30]
[resetfont]

#
・・・・[m_p]
#あかね
ティラノスクリプトを使うと、簡単に本格的なノベルゲームが簡単に作れてしまうのよ。[m_p]
#
へぇー。それはちょっと興味あるね。[m_p]

[chara_mod  name="akane" face="happy"  ]
#あかね
ほ、ほんと！？[m_p]
このゲームをプレイするだけで、ティラノスクリプトの機能を確認することができるから[m_p]
ぜひ、最後までつきあってね[m_p]

まず、ティラノスクリプトの特徴として[font color="red"]「HTML5」[resetfont]で動作するよ[m_p]


#
つ、つまり？[m_p]
#あかね
一度ティラノスクリプトで作ったゲームは多くの環境で動作させることができるってこと！[m_p]
#
へぇー。それはいいね。[m_p]
せっかく作ったらたくさんの人に遊んでもらいたいもんね。[m_p]

#あかね
ウィンドウズ用のPCアプリケーションはもちろん。[m_p]
マック用のアプリケーションにだって対応するわよ。[m_p]
あと、HTML5だから、ブラウザゲームとしても発表できるわよ。[m_p]
ウェブサイトに貼り付けて遊んでもらえるから、気軽にゲームをプレイしてもらうことができるね。[m_p]
主要なブラウザはすべてサポートしているから、安心してね。[m_p]
#
やるなぁ。。[m_p]

でも、最近スマホが復旧してて、僕のサイトにもスマホで訪れる人が増えたんだけど[m_p]
スマホからは遊べない？[m_p]

#あかね
ティラノスクリプトで作ったゲームはスマートフォンからでも遊べるよ！[m_p]
アイフォーン、アンドロイドはもちろん。アイパッドとかのタブレットでも問題ないわ。[m_p]
#
おぉー。[m_p]

#あかね
AppStoreやGooglePlayに向けてアプリ化して販売することもできるから[m_p]
#
おぉぉ、、やっとの貧困生活から脱出できるかも[m_p]
#あかね
まぁ、おもしろいゲームつくらないと、売れもしないけどな！[m_p]
#
くっ。。[m_p]

#あかね
じゃあ、次に場面を移動してみるね[m_p]
廊下に移動するよ[m_p]
[bg  time="3000"  method="crossfade" storage="rouka.jpg"  ]

#
お、廊下に移動したね。[m_p]

#あかね
寒いよぉ〜。はやく教室に戻ろう。[m_p]

[bg  time="1000" method="slide"  storage="room.jpg" ]
#
あれ、今、場面の移動がちょっと違ったね。[m_p]
#あかね
うん。急いでたからね。[m_p]
ティラノスクリプトでは、いろいろな演出を加える事ができて[m_p]
画面を切り替えるだけでも１０種類以上の演出がつかえるよ。[m_p]
#
ふむ。便利だ[m_p]

#あかね
次にメッセージの表示方法を変えてみるね[m_p]
ティラノスクリプトでは、今みたいなアドベンチャーゲームの他に[r]
ビジュアルノベルのような全画面表示のゲームもつくれるよ。[m_p]

#

;キャラクター非表示
[chara_hide name="akane"]


;メッセージを全画面に切り替え
[position layer="message0" left=20 top=40 width=1200 height=660 page=fore visible=true ]

どうかな? 物語をじっくり読ませたい場合はこの方式が便利ですね[m_l][r]
ティラノスクリプトは非常に強力で、柔軟な表現が可能です。[m_l][cm]

[font size=40]文字のサイズを変更したり
[m_l][r]
[resetfont]
[font color="pink"]色を変更したり
[resetfont][m_l][r]

[ruby text=る]ル[ruby text=び]ビを[ruby text=ふ]振ることだって[ruby text=かん]簡[ruby text=たん]単にできます[m_l]
[cm]

;たて書きにする
[position vertical=true layer=message0 page=fore margint="45" marginl="0" marginr="70" marginb="60"]

このように縦書きで記述することもできます。[r][m_l]
縦書きでも、横書きの時と同じ機能を使うことができます。[r][m_l]

;横書きに戻す
[position vertical=false]

横書きと縦書きをシーンによって使い分けることもできます[r][m_l]
じゃあ、アドベンチャー形式に戻しますね[m_p]

;メッセージボックスを元に戻す
[position layer="message0" left=160 top=500 width=1000 height=200 page=fore visible=true]

@chara_show name="akane"

#akane
メッセージボックスは、自分の好きな画像を使うこともできるよ[m_p]



[font color="0x454D51"]
[deffont color="0x454D51"]


;名前部分のメッセージレイヤ削除
[free name="chara_name_area" layer="message0"]

;メッセージウィンドウの設定
[position layer="message0" width="1280" height="210" top="510" left="0"]
[position layer="message0" frame="frame.png" margint="50" marginl="100" marginr="100" opacity="230" page="fore"]

;名前枠の設定
[ptext name="chara_name_area" layer="message0" color="0xFAFAFA" size="28" bold="true" x="100" y="514"]
[chara_config ptext="chara_name_area"]



どうかな？[m_p]
ゲームに合わせて自分の好きなデザインを作ってくださいね[m_p]

あと、デフォルトだとセーブやロードは画面右下のボタンからできるけど[m_p]
ウィンドウをカスタマイズすれば、、、、[m_p]

;メニューボタン非表示
@hidemenubutton

;ロールボタン追加;;;;;;;;;;;;;;


; ロールボタン配置

;クイックセーブボタン
[button name="role_button" role="quicksave" graphic="button/qsave.png" enterimg="button/qsave2.png" x="40" y="690"]

;クイックロードボタン
[button name="role_button" role="quickload" graphic="button/qload.png" enterimg="button/qload2.png" x="140" y="690"]

;セーブボタン
[button name="role_button" role="save" graphic="button/save.png" enterimg="button/save2.png" x="240" y="690"]

;ロードボタン
[button name="role_button" role="load" graphic="button/load.png" enterimg="button/load2.png" x="340" y="690"]

;オートボタン
[button name="role_button" role="auto" graphic="button/auto.png" enterimg="button/auto2.png" autoimg="button/auto3.png" x="440" y="690"]

;スキップボタン
[button name="role_button" role="skip" graphic="button/skip.png" enterimg="button/skip2.png" skipimg="button/skip3.png" x="540" y="690"]

;バックログボタン
[button name="role_button" role="backlog" graphic="button/log.png" enterimg="button/log2.png" x="640" y="690"]

;フルスクリーン切替ボタン
[button name="role_button" role="fullscreen" graphic="button/screen.png" enterimg="button/screen2.png" x="740" y="690"]

;コンフィグボタン（※sleepgame を使用して config.ks を呼び出しています）
[button name="role_button" role="sleepgame" graphic="button/sleep.png" enterimg="button/sleep2.png" storage="config.ks" x="840" y="690"]

;メニュー呼び出しボタン（※ロールボタンを使うなら不要）
[button name="role_button" role="menu" graphic="button/menu.png" enterimg="button/menu2.png" x="940" y="690"]

;メッセージウィンドウ非表示ボタン
[button name="role_button" role="window" graphic="button/close.png" enterimg="button/close2.png" x="1040" y="690"]

;タイトルに戻るボタン
[button name="role_button" role="title" graphic="button/title.png" enterimg="button/title2.png" x="1140" y="690"]

;;ロールボタン追加終わり


こんな風にゲームに必要な機能を画面の上に持たせることも簡単にできるよ[m_p]
これはロールボタンといって、ボタンに特別な機能を持たせる事ができます。[m_p]
標準で用意されているのは、[m_l]
セーブ、[m_l]
ロード、[m_l][cm]
タイトルへ戻る、
メニュー表示、
メッセージ非表示、
スキップ、
バックログ、
フルスクリーン切り替え、
クイックセーブ、
クイックロード、
オートモード！
[m_p]

はぁ、はぁ[m_p]

#
大丈夫？[m_p]
これだけあれば、ゲームを作るには困らなそうだね[m_p]

#あかね
さて、もちろん音楽を鳴らすこともできるよ[m_l][cm]
それじゃあ、再生するよ？[m_l][cm]

[link target=*playmusic]【１】うん。再生してください[endlink][r]
[link target=*noplay]【２】いや。今は再生しないで！[endlink]
[s]

*playmusic

[cm]
よし、再生するよ。[m_l]
@playbgm time="3000" storage=music.ogg loop=true
徐々にフェードインしながら再生することもできるんだ[m_l][cm]

@jump target="*common_bgm"

*noplay
[cm]
うん。わかった。再生はしないね。[m_l][cm]
また、試してみてね[m_l][cm]

*common_bgm

あ、そうそう[m_l][cm]
今みたいな選択肢で物語を分岐することも、簡単にできるよ。[m_l][cm]

#あかね
ここらで、別のキャラクターに登場してもらいましょうか[m_l][cm]
やまとー[m_p]
[chara_show name="yamato"]

こんな風に。簡単です。[m_l][r]
キャラクターは何人でも登場させることができるから、試してみてね。[m_p]

#yamato
おい、俺もう、帰っていいかな？[m_l][cm]

#akane
あ、ごめんごめん。ありがとう[m_l][cm]

[chara_hide name="yamato"]

#akane
これでティラノスクリプトの基本機能の説明は終わりだけど[m_p]
どうだったかな？[m_p]

#
うん、これなら自分でも作れそうな気がしてきたよ[m_p]

#あかね
よかった！[m_p]
最初は、ティラノスクリプト公式ページのチュートリアルをやってみると良いと思うよ！[m_p]
もちろん、このゲームもティラノスクリプトで動いてるから、参考になると思うし。[m_p]
ぜひ、ゲーム制作にチャレンジしてみてね[m_p]
プレイしてくれてありがとう。[m_p]

最後にティラノスクリプトで役立つ情報へのリンクを表示しておくから
確認してみてね。[m_p]

[cm]

*button_link

@layopt layer=message0 visible=false
@layopt layer=fix visible=false
[anim name="akane" left=600 time=1000]

;リンクボタンを表示
[glink text="ティラノビルダーの紹介" size=20 width=500 x=30 y=100 color=blue target=tyranobuilder ]
[glink text="制作事例" size=20 width=500 x=30 y=160 color=blue target=example ]
[glink text="応用テクニック" size=20 width=500 x=30 y=220 color=blue target=tech ]
[glink text="役に立つ情報源" size=20 width=500 x=30 y=280 color=blue target=info ]
[glink text="タグリファレンス" size=20 width=500 x=30 y=340 color=blue target=tagref ]

[s]

*tyranobuilder

[cm]
@layopt layer=message0 visible=true
@layopt layer=fix visible=true;
[font color-"red"]
「ティラノビルダー」
[resetfont]
という無料の開発ツールもあります。[m_p]

[image layer=1 page=fore visible=true top=10 left=50 width=560 height=400  storage = builder.png]

これは、グラフィカルな画面でノベルゲームを作れるツールです[m_p]
スクリプトが苦手な人でもゲーム制作を行うことができるからぜひ試してね。[m_p]
[freeimage layer=1]

@jump target=button_link

[s]
*example
@layopt layer=message0 visible=true
@layopt layer=fix visible=true
これまで、ティラノスクリプトを使って沢山のゲームが作成されています。[m_p]
一部の制作事例を公式サイトに乗せているのでよければ確認してくださいね。[m_p]

[iscript]
window.open("http://tyrano.jp/home/example");
[endscript]

@jump target=button_link

[cm]
[s]

*tech
@layopt layer=message0 visible=true
@layopt layer=fix visible=true
このサンプルでは、ティラノスクリプトのごく一部の機能しか紹介できていません[m_p]
さらに出来ることを知りたい場合、スクリプトを丸ごとダウンロードできるようになっているので[m_p]
そのサンプルを触ってみることをオススメします！[m_p]

[iscript]
window.open("http://tyrano.jp/home/demo");
[endscript]

@jump target=button_link


*info
@layopt layer=message0 visible=true
@layopt layer=fix visible=true
ティラノスクリプトでわからないことがあったら[m_p]
公式掲示板で質問したり、Wikiなどもありますので参考にしてみてください[m_p]
@jump target=button_link

*tagref
@layopt layer=message0 visible=true
@layopt layer=fix visible=true
タグは詳細なリファレンスページが用意されています。[m_p]
このページでさらに詳細な使い方を身につけてください[m_p]

[iscript]
window.open("http://tyrano.jp/home/tag");
[endscript]

@jump target="*button_link"

[s]
