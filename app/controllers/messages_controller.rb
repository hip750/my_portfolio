class MessagesController < UsersController
  def apply_form
    @message = Message.new
    @user = User.find_by(params[:id])
    @recruit = Recruit.find_by(params[:id])
  end

  def confirm
    @recruit = Recruit.find_by(params[:id])
    @message = Message.new(message_params)
    if @message.valid?
      render :action => 'confirm'
    else
      render :action => 'apply_form'
    end
  end

  def done
    @message = Message.new(message_params)
    if params[:back]
      render :action => 'apply_form'
    else
      MessageMailer.received_email(@message).deliver_now
      render :action => 'done'
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:name, :email, :first_name, :last_name, :first_name_ruby,
                                    :last_name_ruby, :gender, :age, :license, :career, :postcode,
                                    :prefecture_code, :city, :street, :phone_number, :self_promotion,
                                    :work_times)
  end
end
