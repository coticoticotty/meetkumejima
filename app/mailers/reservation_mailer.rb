class ReservationMailer < ActionMailer::Base

  ##### 送信元アドレス
  default from: "info@kumejimalife.com"
  ##### 送信先アドレス
  # default to: "beruzebuscotty@gmail.com"

  def confirm_to_guest(reservation, tour)
    ##### メール件名

    @reservation = reservation
    @tour = tour
    mail to: @reservation.email, subject: "ツアー予約を受付ました。"
  end

  def confirm_to_host(reservation, host)
    ##### メール件名

    @reservation = reservation
    @host = host
    mail to: @host.email, subject: "ツアー予約を受付ました。"
  end
end