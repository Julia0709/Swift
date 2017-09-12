//: T Shirts Shop

//: Create a T-shirt struct that has size, color and material options. The size prices go from 3, 5, 7. The colors range from red, blue, and white. It should range from 2, 3, and 1. Finally, for material options, choose regular or organic. It should be 5 or 10. Print out the result in calculatePrice()


//: Here’s an example of creating a struct:
//: var tshirt = TShirt(size: “M”, color: “red”, material: “organic”)


//: **Ub3r H4ck3r Challenge** Refactor the code so that materials, color, and sizes are structs with a name and a price. Pass these structs into the TShirt and have it calculate the price


struct TShirt {
    var size: String
    var color: String
    var material: String

    mutating func calcPrice() -> Int {
        var price: Int = 0
        switch size {
            case "S":
                price += 3;
            case "M":
                price += 5;
            case "L":
                price += 7;
            default:
                price += 0;
        }

        switch color {
            case "red":
                price += 2;
            case "blue":
                price += 3;
            default:
                price += 1;
        }
        
        switch material {
            case "organic":
                price += 10;
            default:
                price += 5;
        }

    return price
    }
}

var tshirt = TShirt(size: "M", color: "red", material: "organic")
print("options: \(tshirt) \nprice: $\(tshirt.calcPrice())")
