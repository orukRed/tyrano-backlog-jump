(function () {

	tyrano.plugin.kag.orukred_backlogJump = {
		savedForBacklogJumpData: [],//バックログジャンプに使うセーブデータ
		isShowBacklogText: false,
	}

	//バックログ画面表示
	tyrano.plugin.kag.menu.displayLog = function () {
		var that = this;
		that.kag.unfocus();
		this.kag.setSkip(false);

		var j_save = $("<div></div>");

		this.kag.html(
			"backlog",
			{
				novel: $.novel,
			},
			function (html_str) {
				var j_menu = $(html_str);

				var layer_menu = that.kag.layer.getMenuLayer();
				layer_menu.empty();
				layer_menu.append(j_menu);

				that.setMenuCloseEvent(layer_menu);
				that.setMenuScrollEvents(j_menu, { target: ".log_body", move: 60 });

				// スマホのタッチ操作でスクロールできるようにするために touchmove の伝搬を切る
				// (document まで伝搬するとそこのリスナで e.preventDefault() が呼ばれるため)
				j_menu.find(".log_body").on("touchmove", (e) => {
					e.stopPropagation();
				});

				var log_str = "";

				//バックログ全文をarray_logに入れる
				var array_log = that.kag.variable.tf.system.backlog;

				for (var i = 0; i < array_log.length; i++) {
					//追加箇所start------------------------------------------------
					log_str += `<div class="backlogSerialNumber${i}">${array_log[i]} <br /></div>`;
					//追加箇所end------------------------------------------------
				}

				layer_menu.find(".log_body").html(log_str);

				layer_menu.find(".log_body").css("font-family", that.kag.config.userFace);

				$.preloadImgCallback(
					layer_menu,
					function () {
						layer_menu.stop(true, true).fadeIn(300);
						//一番下固定させる
						layer_menu.find(".log_body").scrollTop(9999999999);
					},
					that,
				);

				$(".button_menu").hide();


				//追加箇所start------------------------------------------------
				//マウスオンの箇所をハイライト
				$(".backlog_text").hover(
					function () {
						$(this).css("background-color", "rgba(0, 0, 255, 0.1)");
					},
					function () {
						$(this).css("background-color", "rgba(255, 255, 255, 0)");
					}
				);

				//マウスクリックでジャンプ
				$(".backlog_text").click((e) => {
					if (tyrano.plugin.kag.orukred_backlogJump.savedForBacklogJumpData.length < 0) {
						return;
					}
					if (confirm("この位置にジャンプしますか？")) {
						//ロード処理
						$('.menu_close').trigger('click');
						const backlogSerialNumber = e.target.parentElement.className.replace("backlogSerialNumber", "");//backlogSerialNumber0を取得
						that.loadGameData($.extend(true, {}, tyrano.plugin.kag.orukred_backlogJump.savedForBacklogJumpData[backlogSerialNumber]), { auto_next: "yes", bgm_over: "false" });
						that.kag.setSkip(false);//スキップモード維持されることあったのでそれの防止
					}
				});
				//追加箇所end------------------------------------------------
			},
		);
	},

		//----------------------
		//snapSaveにsavedForBacklogJumpDataにsnapを保存する処理を追加
		//----------------------
		//セーブ状態のスナップを保存します。
		tyrano.plugin.kag.menu.snapSave = function (title, call_back, flag_thumb) {
			// ティラノイベント"snapsave-start"を発火
			var that = this;

			this.kag.trigger("snapsave-start");

			//画面のキャプチャも取るよ
			var _current_order_index = that.kag.ftag.current_order_index - 1;
			var _stat = $.extend(true, {}, $.cloneObject(that.kag.stat));

			//3Dオブジェクトが実装されてる場合復元させる。////////////////////

			var three = this.kag.tmp.three;
			var models = three.models;

			var three_save = {};

			three_save.stat = three.stat;
			three_save.evt = three.evt;

			var save_models = {};

			for (var key in models) {
				var model = models[key];
				save_models[key] = model.toSaveObj();
			}

			three_save.models = save_models;

			/////////////////////////////////////////////////////////////

			if (typeof flag_thumb == "undefined") {
				flag_thumb = this.kag.config.configThumbnail;
			}

			if (flag_thumb == "false") {
				//
				// サムネイルデータを作成しない場合
				//
				var img_code = "";
				var data = {};

				data.title = $(title).text();
				data.stat = _stat;
				data.three = three_save;
				data.current_order_index = _current_order_index;
				//１つ前
				data.save_date = that.getDateStr();
				data.img_data = img_code;

				//レイヤ部分のHTMLを取得
				var layer_obj = that.kag.layer.getLayeyHtml();
				data.layer = layer_obj;

				that.snap = $.extend(true, {}, $.cloneObject(data));

				//追加箇所start------------------------------------------------
				if (title === "saveBacklogJump") {
					tyrano.plugin.kag.orukred_backlogJump.savedForBacklogJumpData.push(that.snap);
				}
				//追加箇所end------------------------------------------------
				if (call_back) {
					call_back();

					// ティラノイベント"snapsave-complete"を発火
					that.kag.trigger("snapsave-complete");
				}
			} else {
				var thumb_scale = this.kag.config.configThumbnailScale || 1;
				if (thumb_scale < 0.01) thumb_scale = 0.01;
				if (thumb_scale > 1) thumb_scale = 1;

				$("#tyrano_base").find(".layer_blend_mode").css("display", "none");

				setTimeout(function () {
					//
					// キャプチャ完了時コールバック
					//
					var completeImage = function (img_code) {
						var data = {};

						data.title = $(title).text();
						data.stat = _stat;
						data.three = three_save;

						data.current_order_index = _current_order_index;
						//１つ前
						data.save_date = that.getDateStr();
						data.img_data = img_code;

						//レイヤ部分のHTMLを取得
						var layer_obj = that.kag.layer.getLayeyHtml();
						data.layer = layer_obj;

						that.snap = $.extend(true, {}, $.cloneObject(data));

						//追加箇所start------------------------------------------------
						if (title === "saveBacklogJump") {
							tyrano.plugin.kag.orukred_backlogJump.savedForBacklogJumpData.push(that.snap);
						}
						//追加箇所end------------------------------------------------	
						if (call_back) {
							call_back();

							// ティラノイベント"snapsave-complete"を発火
							that.kag.trigger("snapsave-complete");
						}

						that.kag.hideLoadingLog();
					};

					if (that.kag.stat.save_img != "") {
						//
						// サムネイルに使う画像が[save_img]タグで直接指定されている場合
						//

						var img = new Image();
						img.src = _stat.save_img;
						img.onload = function () {
							var canvas = document.createElement("canvas");
							canvas.width = that.kag.config.scWidth * thumb_scale;
							canvas.height = that.kag.config.scHeight * thumb_scale;
							// Draw Image
							var ctx = canvas.getContext("2d");
							ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
							// To Base64
							var img_code = that.createImgCode(canvas);

							completeImage(img_code);
						};
					} else {
						//
						// html2canvas.jsでゲーム画面のキャプチャを実行する場合
						//

						that.kag.showLoadingLog("save");

						//ビデオをキャプチャするための仕組み
						let canvas = document.createElement("canvas"); // declare a canvas element in your html
						let ctx = canvas.getContext("2d");
						let videos = document.querySelectorAll("video");
						let w, h;
						for (let i = 0, len = videos.length; i < len; i++) {
							const v = videos[i];
							//if (!v.src) continue // no video here
							try {
								w = v.videoWidth;
								h = v.videoHeight;

								canvas.style.left = v.style.left;
								canvas.style.top = v.style.top;

								canvas.style.width = v.style.width;
								canvas.style.height = v.style.height;

								canvas.width = w;
								canvas.height = h;

								ctx.fillRect(0, 0, w, h);
								ctx.drawImage(v, 0, 0, w, h);
								v.style.backgroundImage = `url(${canvas.toDataURL()})`; // here is the magic
								v.style.backgroundSize = "cover";
								v.classList.add("tmp_video_canvas");

								ctx.clearRect(0, 0, w, h); // clean the canvas
							} catch (e) {
								continue;
							}
						}

						//canvasがある場合は、オリジナルをクローン。画面サイズによっては、カクつく問題が残る
						var flag_canvas = false;
						var array_canvas = [];
						$("#tyrano_base")
							.find("canvas")
							.each(function (index, element) {
								array_canvas.push(element);
							});
						if (array_canvas.length > 0) {
							flag_canvas = true;
						}

						var tmp_base;

						//canvasがある場合。
						if (flag_canvas) {
							tmp_base = $("#tyrano_base");
						} else {
							tmp_base = $("#tyrano_base").clone();
							tmp_base.addClass("snap_tmp_base");
							$("body").append(tmp_base);
						}

						var tmp_left = tmp_base.css("left");
						var tmp_top = tmp_base.css("top");
						var tmp_trans = tmp_base.css("transform");

						tmp_base.css("left", 0);
						tmp_base.css("top", 0);
						tmp_base.css("transform", "");
						tmp_base.find(".layer_menu").hide();

						var opt = {
							scale: thumb_scale,
							height: that.kag.config.scHeight,
							width: that.kag.config.scWidth,
							logging: that.kag.config["debugMenu.visible"] === "true",
						};

						html2canvas(tmp_base.get(0), opt).then(function (canvas) {
							$("#tyrano_base").find(".layer_blend_mode").css("display", "");
							$("#tyrano_base").find(".tmp_video_canvas").css("backgroundImage", "");

							// キャプチャした画像をDOMに追加してクオリティチェック
							// コメントトグル:  ⌘ + /  または  Ctrl + /
							// $("body").css({
							//     overflow: "scroll",
							// });
							// $(canvas)
							//     .css({
							//         position: "absolute",
							//         top: $.getViewPort().height,
							//     })
							//     .appendTo("body");
							// console.log(canvas)
							var img_code = that.createImgCode(canvas);

							completeImage(img_code);
						});

						tmp_base.hide();

						tmp_base.css("left", tmp_left);
						tmp_base.css("top", tmp_top);
						tmp_base.css("transform", tmp_trans);
						tmp_base.find(".layer_menu").show();
						$("body").find(".snap_tmp_base").remove();

						tmp_base.show();
					}
				}, 20);
			}
		}


}());
