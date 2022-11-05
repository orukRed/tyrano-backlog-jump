@loadjs storage="./plugin/tyrano-backlog-jump/define.js"
@loadcss file="./data/others/plugin/tyrano-backlog-jump/define.css"

; 実行ごとにsnapをsaveFileにpushするpタグ
@macro name="m_p"

  [iscript]
    //tyrano.plugin.kag.tmp.orukred.backlogJump.isShowBacklogText=true;//バックログにテキストを書き込むための準備
  [endscript]
  
  ;現在位置をsnapに保存して配列に保存する
  ;savesnapの中身は一部置き換えてある  
  @savesnap title="saveBacklogJump"
  [iscript]
    //tyrano.plugin.kag.tmp.orukred.backlogJump.isShowBacklogText=false;//バックログにテキストを書き込み終わったのでfalseにする
  [endscript]
  @p
@endmacro
