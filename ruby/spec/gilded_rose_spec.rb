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
      item_name = "Aged Brie"
      it "aged brie sell_in reduces by 1" do
        items = [Item.new(name=item_name, sell_in=2, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].sell_in).to eq 1
      end
      it "aged brie quality increases by 1 with sell_in > 0" do
        items = [Item.new(name=item_name, sell_in=2, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 1
      end
      it "aged brie quality increases by 2 with sell_in = 0" do
        items = [Item.new(name=item_name, sell_in=0, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 2
      end
      it "aged brie quality increases by 2 with sell_in < 0" do
        items = [Item.new(name=item_name, sell_in= -1, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 2
      end
      it "aged brie quality can't go above 50" do
        items = [Item.new(name=item_name, sell_in=2, quality=50)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 50
      end
    end

    describe "#Backstage passes" do
      item_name = "Backstage passes to a TAFKAL80ETC concert"
      it "backstage passes sell_in reduces by 1" do
        items = [Item.new(name=item_name, sell_in=2, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].sell_in).to eq 1
      end
      it "backstage passes quality increases by 1 with sell_in > 10" do
        items = [Item.new(name=item_name, sell_in=11, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 1
      end
      it "backstage passes quality increases by 2 with sell_in < 11 & > 5" do
        items = [Item.new(name=item_name, sell_in=10, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 2
      end
      it "backstage passes quality increases by 3 with sell_in <= 5" do
        items = [Item.new(name=item_name, sell_in=5, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 3
      end
      it "backstage passes quality goes to zero with sell_in < 0" do
        items = [Item.new(name=item_name, sell_in=0, quality=10)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 0
      end
      it "backstage passes quality can't go above 50" do
        items = [Item.new(name=item_name, sell_in=2, quality=50)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 50
      end
    end

    describe "#Sulfuras" do
      item_name = "Sulfuras, Hand of Ragnaros"
      it "Sulfuras sell_in doesn't reduce" do
        items = [Item.new(name=item_name, sell_in=2, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].sell_in).to eq 2
      end
      it "Sulfuras quality doesn't reduce" do
        items = [Item.new(name=item_name, sell_in=2, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 0
      end
    end

    describe "#Elixir of the Mongoose" do
      item_name = "Elixir of the Mongoose"
      it "Elixir sell_in reduces by 1" do
        items = [Item.new(name=item_name, sell_in=2, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].sell_in).to eq 1
      end
      it "Elixir quality decreases by 1 with sell_in > 0" do
        items = [Item.new(name=item_name, sell_in=11, quality=1)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 0
      end
      it "Elixir quality decreases by 1 with sell_in = 0" do
        items = [Item.new(name=item_name, sell_in=10, quality=2)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 1
      end
      it "Elixir quality decreases by 2 with sell_in < 0" do
        items = [Item.new(name=item_name, sell_in=10, quality=2)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 1
      end
    end

    describe "#+5 Dexterity Vest" do
      item_name = "+5 Dexterity Vest"
      it "Dexterity Vest sell_in reduces by 1" do
        items = [Item.new(name=item_name, sell_in=2, quality=0)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].sell_in).to eq 1
      end
      it "Dexterity Vest quality decreases by 1 with sell_in > 0" do
        items = [Item.new(name=item_name, sell_in=11, quality=1)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 0
      end
      it "Dexterity Vest quality decreases by 1 with sell_in = 0" do
        items = [Item.new(name=item_name, sell_in=10, quality=2)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 1
      end
      it "Dexterity Vest quality decreases by 2 with sell_in < 0" do
        items = [Item.new(name=item_name, sell_in=10, quality=2)]
        gilded_rose.set_items(items)
        gilded_rose.update_quality()
        expect(gilded_rose::items[0].quality).to eq 1
      end
    end
  end
end
