https://action-cable-tomo.herokuapp.com/

$ rails -v
Rails 6.0.4

$ruby -v
ruby 2.6.6p146 

gem 'redis'


部屋追加時リアルタイム更新させる chat_room_channel作成
無限スクロール
room_channel.jsに"scroll"イベントリスナーを設置、
上までスクロールしたかどうかを監視
一番上のメッセージのIDを変数に保管(Ajaxでコントローラに渡す用)
一番上までスクロールしたことを検出したら
rooms_controllerのshow_additionallyとshow_additionally.js.erbが実行される
一番上のメッセージのその先の５個を取得　上に挿入


SP対応