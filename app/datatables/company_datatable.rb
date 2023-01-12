class CompanyDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  include CompaniesHelper, ApplicationHelper
    
  def_delegators :@view, :edit_company_path, :company_path, :link_to
  
  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      ird_no:               { source: "Company.ird_no", cond: :like, searchable: true, orderable: true},
      paye_no:         { source: "Company.paye_no", cond: :like, searchable: true, orderable: true},
      name:          { source: "Company.name", cond: :like, searchable: true, orderable: true },
      address:        { source: "Company.address", cond: :like, searchable: true, orderable: true},
      entity_type:        { source: "Company.entity_type", cond: :like, searchable: true, orderable: true},
      activity_status:        { source: "Company.activity_status", cond: :like, searchable: true, orderable: true},
      actions:        { source: "", searchable: false, orderable: false},
    }
  end

  def data
    records.map do |record|
        #custom actions
        actions = '<button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown" aria-expanded="false">Actions</button>'
        actions +='<div class="dropdown-menu dropdown-menu-end" style="">'
        actions += link_to('View', company_path(record), class:'dropdown-item')
        actions += link_to('Edit', edit_company_path(record), class:'dropdown-item')
        actions += link_to "Delete",  company_path(record),class:'dropdown-item',  method: :delete, data: { turbo_method: :delete, turbo_confirm: 'Are you sure?' }
        actions += '</div>'
        
      {
        ird_no:      record.ird_no,
        paye_no: record.paye_no,
        name:  record.name,
        address:  record.address,
        entity_type:  record.entity_type,
        activity_status:  record.activity_status,
        actions: actions.html_safe,
      }
    end
  end

  def get_raw_records
    Company.all
  end

end
