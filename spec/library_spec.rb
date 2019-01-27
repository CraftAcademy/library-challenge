require './lib/library.rb'


describe Library do
    let(:person) {instance_double('Person' , name: 'Superman')}

    before do 
        list = YAML.load_file('./lib/data.yml')
        File.open('./lib/data.yml', 'w') { |f| f.write list.to_yaml }
    end
end