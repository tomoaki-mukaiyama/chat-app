class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  protect_from_forgery except: :show_additionally

  def first_room
    redirect_to "/rooms/#{Room.first.id}"
  end
  
  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all.order(created_at: :desc)
  end
  
  # GET /rooms/1 or /rooms/1.json
  def show
    @last_messages = @room.messages.last(15)
    @user = User.find_by(id: current_user.id)
  end

  # GET/rooms/show_additionally?room_id=":id" sctollTOP => request AJAX
  # メッセージを上までスクロールしたらroom_channel.jsで設定した'scroll'イベントリスナーによってajaxによってこの関数が呼び出される
  # この後show_additionally.js.erbが実行される
  def show_additionally
    # 一番上のメッセージid取得
    last_id = params[:oldest_message_id].to_i
    #現在の部屋id取得
    room_id = Message.find(last_id).room_id
    # last_idとroom_idを使って、読み込みたい５件を取得
    @messages = Message.where(id: 1..last_id, room_id: room_id).where.not(id: last_id).last(5)
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)
    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: "Room was successfully created." }
      else
        format.html { render :new , status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: "Room was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy
    redirect_to rooms_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name)
    end
end
