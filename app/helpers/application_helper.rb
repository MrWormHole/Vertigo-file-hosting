module ApplicationHelper
    def show_notice
        if !flash[:notice].blank?
            return flash[:notice]
        end
    end

    def show_error
        if !flash[:error].blank?
            return flash[:error]
        end
    end
end
