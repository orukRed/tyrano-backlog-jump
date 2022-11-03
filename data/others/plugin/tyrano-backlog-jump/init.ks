; ティラノで定義されている関数の再定義
@loadjs storage="./plugin/tyrano-backlog-jump/define.js"


; 実行ごとにsnapをsavedForBacklogJumpDataにpushするpタグ
@macro name="m_p"

  [iscript]
    //状態保持数<バックログ最大なら、バッグログ最大数まで画面情報保持データを減らす

    if(tyrano.plugin.kag.config.maxBackLogNum < tyrano.plugin.kag.orukred_backlogJump.savedForBacklogJumpData.length){
      tyrano.plugin.kag.orukred_backlogJump.savedForBacklogJumpData = tyrano.plugin.kag.orukred_backlogJump.savedForBacklogJumpData.slice(0,tyrano.plugin.kag.config.maxBackLogNum-1);
    }
    tyrano.plugin.kag.orukred_backlogJump.isShowBacklogText=true;
  [endscript]
  
  ;現在位置をsnapに保存して配列に保存する
  ;savesnapの中身は一部置き換えてある
  
  @savesnap title="saveBacklogJump"
  [iscript]
    tyrano.plugin.kag.orukred_backlogJump.isShowBacklogText=false;
  [endscript]

  @p
@endmacro
