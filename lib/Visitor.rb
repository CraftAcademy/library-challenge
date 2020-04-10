class Visitor
    def show_list
        YAML.load_file('./lib/data.yml')
    end
end