$ rails -v
Rails 6.0.4

$ruby -v
ruby 2.6.6p146 

gem 'redis'

今後

チャットルーム 追加時リアルタイム更新させる チャットルームチャンネル
無限スクロール{
    room_channel.jsに"scroll"イベントリスナーを設置、
    上までスクロールしたかどうかを監視
    一番上のメッセージのIDを変数に保管(Ajaxでコントローラに渡す用)
    一番上までスクロールしたことを検出したら、
    Ajax通信{
        
    }

    rooms_controllerのshow_additionallyとshow_additionally.js.erbが実行される{
        一番上のメッセージのその先の５個を取得
    }
}

SP対応