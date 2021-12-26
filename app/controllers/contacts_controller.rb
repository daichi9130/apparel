class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save then
      ContactMailer.contact_mail(@contact).deliver
      redirect_to contacts_complete_path
    else
      render :new
    end
  end

  def complete
  end

  private

  def contact_params
     params.require(:contact).permit(:email, :name, :message)
  end

end
