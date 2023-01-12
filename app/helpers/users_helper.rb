module UsersHelper
    
    @not_allowed_message = "Sorry, special premissions required to view content"
    
    def admin?
        current_user and current_user.admin?
    end
    
    def only_admin
        redirect_to authenticated_root_path, error: @not_allowed_message if !admin? 
    end
end
