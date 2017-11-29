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

    describe "#Aged brie" do
      it "aged brie sell_in reduces by 1" do
        items = [Item.new(name="Aged Brie", sell_in=2, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].sell_in).to eq 1
      end
      it "aged brie quality increases by 1 with sell_in > 0" do
        items = [Item.new(name="Aged Brie", sell_in=2, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 1
      end
      it "aged brie quality increases by 2 with sell_in = 0" do
        items = [Item.new(name="Aged Brie", sell_in=0, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 2
      end
      it "aged brie quality can't go above 50" do
        items = [Item.new(name="Aged Brie", sell_in=2, quality=50)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 50
      end
    end

    describe "#Backstage passes" do
      it "backstage passes sell_in reduces by 1" do
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=2, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].sell_in).to eq 1
      end
      it "backstage passes quality increases by 1 with sell_in > 10" do
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=11, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 1
      end
      it "backstage passes quality increases by 1 with sell_in < 11 & > 5" do
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 2
      end
    end
  end

end
