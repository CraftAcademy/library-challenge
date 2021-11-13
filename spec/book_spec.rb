require "./lib/book.rb"

describe Book do
  subject { described_class.new(title: "1984", author: "George Orwell") }

  it 'is expected to have title "1984" initialized' do
    expect(subject.title).to eq "1984"
  end

  it 'is expected to have author "George Orwell" initialized' do
    expect(subject.author).to eq "George Orwell"
  end

  it "is expected to raise an error if no title is set" do
    expect { described_class.new(author: "Paulo Coelho") }.to raise_error "A title is required"
  end

  it "is expected to raise an error if no author is set" do
    expect { described_class.new(title: "The Alchemist") }.to raise_error "An author is required"
  end

  it "is expected to being able to change title attribute" do
    expect { subject.title = "The Picture of Dorian Gray" }
      .to change { subject.title }.from("1984").to("The Picture of Dorian Gray")
  end

  it "is expected to being able to change author attribute" do
    expect { subject.author = "Oscar Wilde" }
      .to change { subject.author }.from("George Orwell").to("Oscar Wilde")
  end
end
