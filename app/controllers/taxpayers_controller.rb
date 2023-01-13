class TaxpayersController < ApplicationController
    
    before_action :authenticate_user!
    before_action :set_taxpayer, only: [:show, :edit, :update, :destroy]

    
    def new
        @taxpayer = Taxpayer.new
    end
    
    def create
        @taxpayer = Taxpayer.new(taxpayer_params)
        respond_to do |format|
            if @taxpayer.save
                format.html { redirect_to taxpayers_path, notice: "Taxpayer was successfully created." }
                format.json { render :show, status: :created, location: @taxpayer }
            else 
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @taxpayer.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def index
        @taxpayers = Taxpayer.all
    end
    
    def show
    
    end
    
    def edit
        
    end
    
    def update
        respond_to do |format|
            if @taxpayer.update(taxpayer_params)
                format.html { redirect_to taxpayers_path, notice: 'Taxpayer was successfully udpdated' }
                format.json { render :show, status: :ok, location: @taxpayer }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @taxpayer.errors, status: :unprocessable_entity }
            end    
        end
    end
    
    def destroy 
        @taxpayer.destroy
        redirect_to taxpayers_path
    end
    
    def datatable
        respond_to do |format|
            format.json { render json: TaxpayerDatatable.new(params, view_context: view_context) }
        end
    end
    
    
    private
    
    def set_taxpayer
        @taxpayer = Taxpayer.find(params[:id])
    end
    
    def taxpayer_params
        params.require(:taxpayer).permit(:ird_no, :old_ird_no, :first_name, :middle_name, :last_name, :address, :entity_type, :active_status, :company_id)
    end
    
    def redirect_to_index
        redirect_to taxpayers_path
    end
    
    helper_method :redirect_to_index
end
