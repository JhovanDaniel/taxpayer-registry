class TaxpayersController < ApplicationController
    
    before_action :set_taxpayer, only: [:show, :edit, :update, :destroy]

    
    def new
        @taxpayer = Taxpayer.new
    end
    
    def create
        @taxpayer = Taxpayer.new(taxpayer_params)
        if @taxpayer.save
            redirect_to taxpayers_path
            flash[:notice] = "Taxpayer was created successfully"
        else 
            render 'new'
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
        if @taxpayer.update(taxpayer_params)
            flash[:notice] = "Taxpayer was updated successfully"
            redirect_to @taxpayer
        else
            render 'edit'
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
