class ReservationController < ApplicationController
  #####問い合わせフォーム画面の表示
  def index
    @tour = Tour.find(params[:id])
    @reservation = Reservation.new
    render action: "index"
  end
  
  #####問い合わせフォームから入力された内容をチェックする
  def confirm
    @tour = Tour.find(params[:id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.valid?
      #入力内容に間違いない場合、問い合わせ確認画面を表示
      render :action => "confirm"
    else
      # 間違いがある場合、問い合わせページを再表示
      render :action => "index"
    end
  end
  
  # 問い合わせ完了後の処理
  def thanks
    @tour = Tour.find(params[:id])
    @host = User.find(@tour.user_id)
    #問い合わせ内容をメール送信
    @reservation = Reservation.new(reservation_params)
    ReservationMailer.confirm_to_guest(@reservation, @tour).deliver
    ReservationMailer.confirm_to_host(@reservation, @host, @tour).deliver
    ReservationMailer.confirm(@reservation, @host, @tour).deliver

    #redirect_to reservation_thanks_tour_url, notice: 'Post was successfully created.'
    render :action => 'thanks'
  end
  
  def reservation_params
    params.require(:reservation).permit(:name, :email, :number, :date, :message)
  end
end
