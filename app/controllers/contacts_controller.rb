class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save then
      ContactMailer.contact_mail(@contact).deliver
      redirect_to new_contact_path
    end
  end

  private

  def contact_params
     params.require(:contact).permit(:email, :name, :message)
  end

end
