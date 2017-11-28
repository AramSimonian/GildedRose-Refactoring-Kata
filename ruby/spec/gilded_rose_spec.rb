require File.join(File.dirname(__FILE__), '../lib/gilded_rose')

describe GildedRose do
  subject(:gilded_rose) { described_class }
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      gilded_rose.set_items(items)
      gilded_rose.update_quality()
      expect(gilded_rose::items[0].name).to eq "foo"
    end
    it "fresh brie sell_in reduces by 1" do
      items = [Item.new(name="Aged Brie", sell_in=2, quality=0)]
      gilded_rose.set_items(items)
      gilded_rose.update_quality()
      expect(gilded_rose::items[0].sell_in).to eq 1
    end
  end

end
