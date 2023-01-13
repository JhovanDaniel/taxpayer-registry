class CompaniesController < ApplicationController
    
    before_action :authenticate_user!
    before_action :set_company, only: [:show, :edit, :update, :destroy, :company_taxpayers]

    def index
        @companies = Company.all
    end
    
    def new
        @company = Company.new
    end
    
    def create
        @company = Company.new(company_params)
        respond_to do |format|
            if @company.save
                format.html { redirect_to companies_path, notice: "Company was successfully created." }
                format.json { render :show, status: :created, location: @company }
            else 
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @company.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def edit 
    end
    
    def update
        respond_to do |format|
            if @company.update(company_params)
                format.html { redirect_to companies_path, notice: 'Company was successfully udpdated' }
                format.json { render :show, status: :ok, location: @company }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @company.errors, status: :unprocessable_entity }
            end    
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
