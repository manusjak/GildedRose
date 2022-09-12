//
//  ContentView.swift
//  GildedRose
//
//  Created by Milan Anusjak on 12/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var items: [Item]

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(items) { item in
                        HStack(spacing: 15) {
                            HStack(spacing: 10) {
                                if item.name == "Aged Brie" || item.name == "Sulfuras, Hand of Ragnaros" || item.name == "Backstage passes to a TAFKAL80ETC concert" {
                                    Image(systemName: "star")
                                        .frame(width: 3, height: 3, alignment: .center)
                                } else if item.name == "Conjured Mana Cake" {
                                    Image(systemName: "drop")
                                        .frame(width: 3, height: 3, alignment: .center)
                                } else {
                                    Image(systemName: "suit.diamond")
                                        .frame(width: 3, height: 3, alignment: .center)
                                }
                                Text(item.name)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)

                            Text("\(item.sellIn)").frame(width: 30, alignment: .center)
                            Text("\(item.quality)").frame(width: 30, alignment: .center)
                        }
                    }
                } header: {
                    HStack(spacing: 15) {
                        Text("NAME").frame(maxWidth: .infinity, alignment: .leading)
                        Text("SEL").frame(width: 30, alignment: .center)
                        Text("QUA").frame(width: 30, alignment: .center)
                    }
                }
            }
            .navigationTitle(Text("Gilded Rose"))
            .toolbar {
                Button("Update") {
                    print("---------- UPDATE ----------")
                    updateQuality()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())

    }

    public func updateQuality() {
        for i in 0 ..< items.count {
            if items[i].name != "Aged Brie" && items[i].name != "Backstage passes to a TAFKAL80ETC concert" {
                if items[i].quality > 0 {
                    if items[i].name != "Sulfuras, Hand of Ragnaros" {
                        items[i].quality = items[i].quality - 1
                    }
                }
            } else {
                if items[i].quality < 50 {
                    items[i].quality = items[i].quality + 1

                    if items[i].name == "Backstage passes to a TAFKAL80ETC concert" {
                        if items[i].sellIn < 11 {
                            if items[i].quality < 50 {
                                items[i].quality = items[i].quality + 1
                            }
                        }

                        if items[i].sellIn < 6 {
                            if items[i].quality < 50 {
                                items[i].quality = items[i].quality + 1
                            }
                        }
                    }
                }
            }

            if items[i].name != "Sulfuras, Hand of Ragnaros" {
                items[i].sellIn = items[i].sellIn - 1
            }

            if items[i].sellIn < 0 {
                if items[i].name != "Aged Brie" {
                    if items[i].name != "Backstage passes to a TAFKAL80ETC concert" {
                        if items[i].quality > 0 {
                            if items[i].name != "Sulfuras, Hand of Ragnaros" {
                                items[i].quality = items[i].quality - 1
                            }
                        }
                    } else {
                        items[i].quality = items[i].quality - items[i].quality
                    }
                } else {
                    if items[i].quality < 50 {
                        items[i].quality = items[i].quality + 1
                    }
                }
            }
            print(items[i].description)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(items: [
            Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
            Item(name: "Aged Brie", sellIn: 2, quality: 0),
            Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7)
        ])
    }
}
