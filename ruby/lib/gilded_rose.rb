class GildedRose
  def self.items
    return @items
  end

  def self.set_items(items)
    @items = items
  end

  def self.update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        if item.quality < 50
          item.quality += 1
        end

        item.sell_in = item.sell_in - 1

        if item.sell_in < 0 && item.quality < 50
          item.quality += 1
        end
      when "Sulfuras, Hand of Ragnaros"
        # do nothing
      else
        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          if item.quality < 50
            item.quality = item.quality + 1

            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end

            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        else
          if item.quality > 0
              item.quality -= 1
          end
        end

        item.sell_in -= 1

        if item.sell_in < 0
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        end

      end

    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
