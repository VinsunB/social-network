class InboxMessagesController < ApplicationController

def destroy 
@inbox_message = InboxMessage.find(params[:id])
@inbox_message.destroy
redirect_to current_user
end

end
