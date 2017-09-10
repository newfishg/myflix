require 'spec_helper'

describe Category do
  it { should have_many(:videos) }

  describe '#recent_videos' do
    it 'returns the videos in the reverse chronical order by created_at' do
      commedies = Category.create(name: 'TV Commedies')
      south_park = Video.create(title: 'South Park', description: 'funny video', category: commedies, created_at: 1.day.ago)
      futurama = Video.create(title: 'Futurama', description: 'funny video', category: commedies)
      expect(commedies.recent_videos).to eq([futurama, south_park])
    end
    it 'returns 6 videos if videos in a category are more than 6' do
      commedies = Category.create(name: 'TV Commedies')
      south_park1 = Video.create(title: 'South Park1', description: 'funny video', category: commedies, created_at: 6.day.ago)
      south_park2 = Video.create(title: 'South Park2', description: 'funny video', category: commedies, created_at: 5.day.ago)
      south_park3 = Video.create(title: 'South Park3', description: 'funny video', category: commedies, created_at: 4.day.ago)
      south_park4 = Video.create(title: 'South Park4', description: 'funny video', category: commedies, created_at: 3.day.ago)
      south_park5 = Video.create(title: 'South Park5', description: 'funny video', category: commedies, created_at: 2.day.ago)
      south_park6 = Video.create(title: 'South Park6', description: 'funny video', category: commedies, created_at: 1.day.ago)
      south_park7 = Video.create(title: 'South Park7', description: 'funny video', category: commedies)
      expect(commedies.recent_videos.count).to eq(6)
    end
    it 'returns videos descending order by created_at' do
      commedies = Category.create(name: 'TV Commedies')
      south_park1 = Video.create(title: 'South Park1', description: 'funny video', category: commedies, created_at: 6.day.ago)
      south_park2 = Video.create(title: 'South Park2', description: 'funny video', category: commedies, created_at: 5.day.ago)
      south_park3 = Video.create(title: 'South Park3', description: 'funny video', category: commedies, created_at: 4.day.ago)
      south_park4 = Video.create(title: 'South Park4', description: 'funny video', category: commedies, created_at: 3.day.ago)
      south_park5 = Video.create(title: 'South Park5', description: 'funny video', category: commedies, created_at: 2.day.ago)
      south_park6 = Video.create(title: 'South Park6', description: 'funny video', category: commedies, created_at: 1.day.ago)
      south_park7 = Video.create(title: 'South Park7', description: 'funny video', category: commedies)
      expect(commedies.recent_videos).not_to include(south_park1)
      expect(commedies.recent_videos.first).to eq(south_park7)
    end

    it 'returns an empty array if category does not have any videos' do
      commedies = Category.create(name: 'TV Commedies')
      expect(commedies.recent_videos).to eq([])
    end
  end
end