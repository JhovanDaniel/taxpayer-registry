class TaxpayerDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  include TaxpayerHelper, ApplicationHelper
    
  def_delegators :@view, :edit_taxpayer_path, :taxpayer_path, :link_to
  
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
      ird_no:               { source: "Taxpayer.ird_no", cond: :like, searchable: true, orderable: true},
      old_ird_no:          { source: "Taxpayer.old_ird_no", cond: :like, searchable: true, orderable: true },
      first_name:          { source: "Taxpayer.first_name", cond: :like, searchable: true, orderable: true },
      middle_name:           { source: "Taxpayer.middle_name",  cond: :like, searchable: true, orderable: true},
      last_name:        { source: "Taxpayer.last_name", cond: :like, searchable: true, orderable: true},
      address:        { source: "Taxpayer.address", cond: :like, searchable: true, orderable: true},
      entity_type:        { source: "Taxpayer.entity_type", cond: :like, searchable: true, orderable: true},
      company_id:        { source: "Taxpayer.company_id", cond: :like, searchable: true, orderable: true},
      active_status:        { source: "Taxpayer.active_status", cond: :like, searchable: true, orderable: true},
      actions:        { source: "", searchable: false, orderable: false},
    }
  end

  def data
    records.map do |record|
        #custom actions
        actions = '<button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown" aria-expanded="false">Actions</button>'
        actions +='<div class="dropdown-menu dropdown-menu-end" style="">'
        actions += link_to('View', taxpayer_path(record), class:'dropdown-item')
        actions += link_to('Edit', edit_taxpayer_path(record), class:'dropdown-item')
        actions += link_to "Delete",  taxpayer_path(record),class:'dropdown-item',  method: :delete, data: { turbo_method: :delete, turbo_confirm: 'Are you sure?' }
        actions += '</div>'
        
      {
        ird_no:      record.ird_no,
        old_ird_no: record.old_ird_no,
        first_name:  record.first_name,
        middle_name:  record.middle_name,
        last_name:  record.last_name,
        address:  record.address,
        entity_type:  record.entity_type,
        active_status:  record.active_status,
        company_id:  record.company.name,
        actions: actions.html_safe,
      }
    end
  end

  def get_raw_records
    Taxpayer.all
  end

end
