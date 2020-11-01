require 'yaml'
require './lib/user.rb'

describe User do
    let (:user) { instance_double(name: 'Paulina')}

    it 'User is expected to have a name' do
        subject.user_name('Paulina')
        expect(subject.user).to eq 'Paulina'
    end
end