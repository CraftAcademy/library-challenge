require './lib/library_main.rb'
describe Library_main do
  #let(:visitor) {instance_double('visitor')
  subject { described_class.new }

  it 'expects a library to have a list of its books' do
    expect(subject.collection).not_to be nil
    puts subject.collection
  end
  
 # it 'check available' do
 #   expect(subject.check_avl("Pippi Långstrump","Astrid Lindgren") ).to eq true
 #   expect(subject.check_avl("Osynligt med Alfons","Gunilla Bergström") ).to eq true
 # end

 # it 'check unavailable' do
 #   expect(subject.check_avl("Skratta lagom! Sa pappa Åberg","Gunilla Bergström") ).to eq false 
 # end  

  it 'check_out' do
    if subject.check_avl("Alfons och soldatpappan","Gunilla Bergström") == false 
      subject.check_in("Alfons och soldatpappan","Gunilla Bergström")
      expect(subject.check_avl("Alfons och soldatpappan","Gunilla Bergström") ).to eq true
    else
      subject.check_out("Alfons och soldatpappan","Gunilla Bergström")
      expect(subject.check_avl("Alfons och soldatpappan","Gunilla Bergström") ).to eq false
    end
    if subject.check_avl("Pippi Långstrump","Astrid Lindgren") == false 
      subject.check_in("Pippi Långstrump","Astrid Lindgren")
      expect(subject.check_avl("Pippi Långstrump","Astrid Lindgren") ).to eq true
    else
      subject.check_out("Pippi Långstrump","Astrid Lindgren")
      expect(subject.check_avl("Pippi Långstrump","Astrid Lindgren") ).to eq false
    end
  end

end
