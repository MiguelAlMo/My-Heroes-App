import Foundation


// ******* DEFAULT DATA *******
var allHeroes: [Heroe] = []

func loadDefaultData() {
    loadHeroes()
}


// ******* LOAD JSON DATA *******


private func loadHeroes() {
    
    guard let pathURL = Bundle.main.url(forResource: "Heroes_data", withExtension: "json") else {
        print("Can not find `Heroes_data` resource")
        return
    }
    
    do {
        let data = try Data(contentsOf: pathURL)
        allHeroes = try JSONDecoder().decode([Heroe].self, from: data)
    } catch {
        print("Can not find `Heroes_data` resource")
    }
}

