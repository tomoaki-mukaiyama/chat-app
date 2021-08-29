module RoomsHelper
    def remove_zero(target_time) # => 例:引数"09:30" の場合
        
        split_time = target_time.split ":" # => ["09", "30"]
        hour = split_time[0] # => "09"
        minute = split_time[1] # => "30"
        split_hour = hour.split "" # => ["0", "9"]
        
        if split_hour[0] == "0" # => "時間:分"の時間の1の位が0の場合、取り除く
            hour = split_hour[1]
        end
        
        "#{hour}:#{minute}" # => "9:30"
    end
end
