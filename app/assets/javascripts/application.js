// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require bootstrap-sprockets

//= require underscore
//= require gmaps/google




function geoFindMe() {
	// GeoLocation APIに対応している場合
	if( navigator.geolocation ){
		navigator.geolocation.getCurrentPosition(
			// [第1引数] 取得に成功した場合の関数
			function( position ){
				// 取得したデータの整理
				var data = position.coords ;
				// データの整理
				var lat = data.latitude ;
				var lng = data.longitude ;
				// views/damages/new.html.slimの緯度・経度欄へ入力
				document.getElementById( "latitude" ).value = lat ;
				document.getElementById( "longitude" ).value = lng ;
			},

			// [第2引数] 取得に失敗した場合の関数
			function( error ){
				// エラー番号に対応したメッセージ
				var errorInfo = [
				"原因不明のエラーが発生しました…。" ,
				"位置情報の取得が許可されませんでした…。" ,
				"電波状況などで位置情報が取得できませんでした…。" ,
				"位置情報の取得に時間がかかり過ぎてタイムアウトしました…。"
				] ;
				// エラー番号
				var errorNo = error.code ;
				// エラーメッセージ
				var errorMessage = "[エラー番号: " + errorNo + "]\n" + errorInfo[ errorNo ] ;
				// アラート表示
				alert( errorMessage ) ;
			},

			// [第3引数] オプション
			{
				"enableHighAccuracy": false
			}
		)
	}

	// GeoLocation APIに対応していない場合
	else{
		// エラーメッセージ
		var errorMessage = "お使いの端末は、GeoLacation APIに対応していません。" ;
		// アラート表示
		alert( errorMessage ) ;
	}
}
