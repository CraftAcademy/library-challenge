require 'yaml'
require './lib/user.rb'
require './lib/library.rb'

describe User do
    let (:user) { instance_double(name: 'Paulina')}

    it 'User is expected to have a name' do
        subject.user_name('Paulina')
        expect(subject.user).to eq 'Paulina'
    end

    #it 'User can checkout book' do
    #    expected_output = YAML.load_file('.lib/data')
    #end




end