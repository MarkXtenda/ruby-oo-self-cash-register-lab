class CashRegister
    attr_accessor :total, :discount, :items, :price, :quantity
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @price = []
        @quantity = []
    end

    def add_item(title, price, quantity = 1)
        quantity.times do
            self.items << title
        end
        self.quantity << quantity
        self.price << price*quantity
        self.total += price*quantity
    end

    def apply_discount
        if (@discount != 0)
            self.total = @total * (1 - Float(@discount)/100)
            "After the discount, the total comes to $#{Integer(@total)}."
        else
            "There is no discount to apply."
        end
    end
    def void_last_transaction
        @quantity.last.times do 
            self.items.pop
        end
        (@items.size > 0) ? self.total += -@price.last : self.total = Float(0)
        self.price.pop
        @total
    end
end
