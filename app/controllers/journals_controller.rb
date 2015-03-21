class JournalsController < ApplicationController
  layout 'home'
  before_action :authenticate_user!
  before_action :set_journal, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @journals = current_user.journals.all
    respond_with(@journals)
  end

  def show
    respond_with(@journal)
  end

  def new
    @journal = current_user.journals.new
    respond_with(@journal)
  end

  def edit
  end

  def create
    @journal = current_user.journals.new(journal_params)
    @journal.save
    redirect_to journals_url
  end

  def update
    @journal.update(journal_params)
    respond_with(@journal)
  end

  def destroy
    @journal.destroy
    respond_with(@journal)
  end

  private
    def set_journal
      @journal = Journal.find(params[:id])
    end

    def journal_params
      params.require(:journal).permit(:journal_date, :payee, :description, :account_id, :amount, :user_id, :is_posted, :expense_type_id)
    end
end
