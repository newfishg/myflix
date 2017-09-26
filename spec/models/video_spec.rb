require 'spec_helper'

describe Video do
  it { should belong_to(:category)}
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should have_many(:reviews).order("created_at DESC")}
  describe "search_by_title" do
    it "returns an empty array if there is no match" do
      Video.create(title: "456", description: "123")
      expect(Video.search_by_title('123')).to eq([])
    end

    it "returns an array of one video for an exact match" do
      video = Video.create(title: "Exact", description: "exact one video")
      expect(Video.search_by_title("Exact")).to eq([video])
    end
    it "returns an array of one video for an partial match" do
      video = Video.create(title: "Partial", description: "partial match")
      expect(Video.search_by_title("tia").first).to eq(video)
    end

    it "returns an array of all matches order by created_at" do
      video1 = Video.create(title: "hello", description: "this is a good video", created_at: 1.day.ago)
      video2 = Video.create(title: "ello", description: "this is also a good video")

      expect(Video.search_by_title("ell")).to eq([video2, video1])
    end

    it "returns an empty array for a search with a empty string" do
      video1 = Video.create(title: "hello", description: "this is a good video", created_at: 1.day.ago)
      video2 = Video.create(title: "ello", description: "this is also a good video")

      expect(Video.search_by_title("")).to eq([])
    end
  end
  
end