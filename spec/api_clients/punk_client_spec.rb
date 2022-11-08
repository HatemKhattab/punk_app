require "spec_helper"

describe ApiClients::PunkClient do
  subject{described_class.new}

  describe "#search" do
    context "with matching result" do
      Given(:result){subject.search("blonde")}
      
      Then{expect(result.status).to eq 200}
      And{expect(result.body.size).to eq 3}
      And{expect(result.body.first["name"]).to eq "Trashy Blonde"}
    end

    context "wit no matching result" do
      Given(:result){subject.search("jfdlkj")}
      
      Then{expect(result.status).to eq 200}
      And{expect(result.body.size).to eq 0}
    end
  end

  describe "#get_beer" do
    context "matching" do
      Given(:result){subject.get_beer(1)}
      
      Then{expect(result.status).to eq 200}
      And{expect(result.body.size).to eq 1}
      And{expect(result.body.first["name"]).to eq "Buzz"}
    end

    context "non matching" do
      Given(:result){subject.get_beer(1548114)}

      Then{expect(result.status).to eq 404}
      And{expect(result.body["error"]).to eq "Not Found"}
    end
  end
end
