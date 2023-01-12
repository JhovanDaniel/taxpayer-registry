class CompaniesController < ApplicationController
    
    before_action :set_company, only: [:show, :edit, :update, :destroy, :company_taxpayers]

    def index
        @companies = Company.all
    end
    
    def new
        @company = Company.new
    end
    
    def create
        @company = Company.new(company_params)
        if @company.save
            redirect_to companies_path
            flash[:notice] = "Company was created successfully"
        else 
            render 'new'
        end
    end
    
    def edit 
    end
    
    def update
        if @company.update(company_params)
            flash[:notice] = "Company was updated successfully"
            redirect_to @company
        else
            render 'edit'
        end
    end
    
    def show
    end
    
    def destroy 
        @company.destroy
        redirect_to companies_path
    end
    
    def datatable
        respond_to do |format|
            format.json { render json: CompanyDatatable.new(params, view_context: view_context) }
        end
    end
    
     private
    
    def set_company
        @company = Company.find(params[:id])
    end
    
    def company_params
        params.require(:company).permit(:ird_no, :name, :address, :entity_type, :activity_status, :paye_no)
    end
    
end
