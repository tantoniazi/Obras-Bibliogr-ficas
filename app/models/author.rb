class Author < ApplicationRecord

    before_save :create_formated


    def create_formated
        self.name_formated = get_name(self.name)
    end


    def get_name(name)
        self.name ~= 
    end
end
