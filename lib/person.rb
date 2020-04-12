class Person
    attr_accessor :name, :receipts, :id, :active, :born_date, :role, :phone
    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @phone = attrs[:phone] || nil
        @id = assign_id(attrs[:id])
        @born_date = attrs[:born_date] || nil
        @active = attrs[:active].nil? ? true : attrs[:active]
        @role = attrs[:role] || 'User'
        @receipts = []
    end

    def show_receipts
        @receipts.each {|rec| 
            puts rec[:receipt]
        }
        @receipts.length
    end

    private

    def set_name(name)
        name.nil? ? (raise 'Person must have a name') : name
    end

    def assign_id(id)
        if (id == nil)
            YAML.load_file('./lib/users.yml').map {|user| user[:id]}.max + 1
        else 
            @id = id
        end
    end
end