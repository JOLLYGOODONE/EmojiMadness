//
//  EmojiData.swift
//  Emoji Madness
//
//  Created by BRIAN VALENTINE on 4/21/25.
//

import Foundation

struct EmojiRebus: Identifiable
{
    let id = UUID()
    let question: String
    let possibleAnswers: [String]
    let answer: String
    let phoneticAnswer: String
    let actualAnswer: String
}

enum Level: String, CaseIterable, Identifiable 
{
    case elementary = "Emoji Newbie"
    case middleSchool = "Emoji Apprentice"
    case highSchool = "Emoji Sleuth"
    case college = "Emoji Expert"
    case phd = "Emoji Master"

    var id: String { rawValue }
    
    var emoji: String {
        switch self {
        case .elementary: return "👶"
        case .middleSchool: return "🧑‍🎓️"
        case .highSchool: return "🕵"
        case .college: return "🧑‍💻"
        case .phd: return "🥷"
            
        }
    }


    var emojiGrid: [String] {
        switch self {
        case .elementary: return Array(repeating: "👶", count: 20)
        case .middleSchool: return Array(repeating: "🧑‍🎓️", count: 20)
        case .highSchool: return Array(repeating: "🕵", count: 20)
        case .college: return Array(repeating: "🧑‍💻", count: 20)
        case .phd: return Array(repeating: "🥷", count: 20)
        }
    }
}

struct EmojiData 
{
    static let rebus: [Level: [EmojiRebus]] = [
        .elementary: [
            
            EmojiRebus(question: "🧈 + 🪰 =", possibleAnswers: ["🦋", "⚾️", "🥞", "🛩", "🪟", "🚬", "🌮", "🍛", "🍙", "🥟"].shuffled(), answer: "🦋", phoneticAnswer: "Butter + Fly", actualAnswer: "Butterfly"),
            EmojiRebus(question: "🌧️ + 🎀 =", possibleAnswers: ["🌈", "🤵", "🍩", "🍎", "🥗", "🍔", "🌮", "🍛", "🍙", "🥟"].shuffled(), answer: "🌈", phoneticAnswer: "Rain + Bow", actualAnswer: "Rainbow"),
            EmojiRebus(question: "💦 + 🍈 =", possibleAnswers: ["🍉", "🍕", "🍩", "🍎", "🥗", "🍔", "🌮", "🍛", "🍙", "🥟"].shuffled(), answer: "🍉", phoneticAnswer: "Water + Melon", actualAnswer: "Watermelon"),
            EmojiRebus(question: "🥤 + 🎂 =", possibleAnswers: ["🧁", "🍕", "🍩", "🍎", "🥗", "🍔", "🌮", "🍛", "🍙", "🥟"].shuffled(), answer: "🧁", phoneticAnswer: "Cup + Cake", actualAnswer: "Cupcake"),
            EmojiRebus(question: "🥵 + 🐕 =", possibleAnswers: ["🌭", "🔥", "😓", "🍎", "🥗", "🍔", "🌮", "🍛", "🍙", "🥟"].shuffled(), answer: "🌭", phoneticAnswer: "Hot + Dog", actualAnswer: "Hot Dog"),
            EmojiRebus(question: "🦷 + 🖌 =", possibleAnswers: ["🪥", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "🪥", phoneticAnswer: "Tooth + Brush", actualAnswer: "Toothbrush"),
            EmojiRebus(question: "📖 + ✔️ =", possibleAnswers: ["🔖", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "🔖", phoneticAnswer: "Book + Mark", actualAnswer: "Bookmark"),
            EmojiRebus(question: "🔥 + 🥊 =", possibleAnswers: ["🧑‍🚒️", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "🧑‍🚒️", phoneticAnswer: "Fire + Fighter", actualAnswer: "Firefighter"),
            EmojiRebus(question: "👄 + 🏑 =", possibleAnswers: ["💄", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "💄", phoneticAnswer: "Lips + Stick", actualAnswer: "Lipstick"),
            EmojiRebus(question: "☀️ + 👓 =", possibleAnswers: ["😎", "👀", "🕶", "🤓", "🧠", "🎓", "📖", "🔬", "👓", "📚"].shuffled(), answer: "😎", phoneticAnswer: "Sun + Glasses", actualAnswer: "Sunglasses"),
            EmojiRebus(question: "🌊 + 🛹 =", possibleAnswers: ["🏄", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "🏄", phoneticAnswer: "Surf + Board", actualAnswer: "Surfboard"),
            EmojiRebus(question: "📩 + 📦 =", possibleAnswers: ["📪", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "📪", phoneticAnswer: "Mail + Box", actualAnswer: "Mailbox"),
            EmojiRebus(question: "👱 + ☎️☎️ =", possibleAnswers: ["🎧", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "🎧", phoneticAnswer: "Head + Phones", actualAnswer: "Headphones"),
            EmojiRebus(question: "😃 + 🏑 =", possibleAnswers: ["🕹", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "🕹", phoneticAnswer: "Joy + Stick", actualAnswer: "Joystick"),
            EmojiRebus(question: "🗝 + 🛹 =", possibleAnswers: ["⌨️", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "⌨️", phoneticAnswer: "Key + Board", actualAnswer: "Keyboard"),
            EmojiRebus(question: "👱 + 🪨 =", possibleAnswers: ["🪦", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "🪦", phoneticAnswer: "Head + Stone", actualAnswer: "Headstone"),
            EmojiRebus(question: "☀️ + 🌼 =", possibleAnswers: ["🌻", "👀", "🕶", "🤓", "🧠", "🎓", "📖", "🔬", "👓", "📚"].shuffled(), answer: "🌻", phoneticAnswer: "Sun + Flower", actualAnswer: "Sunflower"),
            EmojiRebus(question: "🥚 + 🪴 =", possibleAnswers: ["🍆", "👀", "🕶", "🤓", "🧠", "🎓", "📖", "🔬", "👓", "📚"].shuffled(), answer: "🍆", phoneticAnswer: "Egg + Plant", actualAnswer: "Eggplant"),
            EmojiRebus(question: "🍯 + 🅱️ =", possibleAnswers: ["🐝", "👀", "🕶", "🤓", "🧠", "🎓", "📖", "🔬", "👓", "📚"].shuffled(), answer: "🐝", phoneticAnswer: "Honey + B", actualAnswer: "Honeybee"),
            EmojiRebus(question: "♭ + 🍞 =", possibleAnswers: ["🫓", "👀", "🕶", "🤓", "🧠", "🎓", "📖", "🔬", "👓", "📚"].shuffled(), answer: "🫓", phoneticAnswer: "Flat + Bread", actualAnswer: "Flatbread"),
        ],
        .middleSchool: [
            EmojiRebus(question: "✌️ + 👄 =", possibleAnswers: ["🌷🌷", "🇳🇱", "🕑", "🐫", "😘", "👥", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "🌷🌷", phoneticAnswer: "Two + Lips", actualAnswer: "Tulips"),
            EmojiRebus(question: "🧠 + ⛈️ =", possibleAnswers: ["💡", "☂️", "🌪", "⚡", "🤓", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "💡", phoneticAnswer: "Brain + Storm", actualAnswer: "Brainstorm"),
            EmojiRebus(question: "☀️ + 📆 =", possibleAnswers: ["🍨", "⛪", "🏖️", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🍨", phoneticAnswer: "Sun + Day", actualAnswer: "Sundae"),
            EmojiRebus(question: "🅰️ + 🧂 =", possibleAnswers: ["🤜🤕", "🥨", "🌊", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🤜🤕", phoneticAnswer: "A + Salt", actualAnswer: "Assault"),
            EmojiRebus(question: "👋 + 🤴 =", possibleAnswers: ["🥾", "🥨", "🌊", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🥾", phoneticAnswer: "Hi + King", actualAnswer: "Hiking"),
            EmojiRebus(question: "🐄 + 👦 =", possibleAnswers: ["🤠", "🥨", "🌊", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🤠", phoneticAnswer: "Cow + Boy", actualAnswer: "Cowboy"),
            EmojiRebus(question: "🌲 + 🍏 =", possibleAnswers: ["🍍", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🍍", phoneticAnswer: "Pine + Apple", actualAnswer: "Pineapple"),
            EmojiRebus(question: "🍾 + 🌽 =", possibleAnswers: ["🍿", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🍿", phoneticAnswer: "Pop + Corn", actualAnswer: "Popcorn"),
            EmojiRebus(question: "👩🏻‍🍳 + 🗝️ =", possibleAnswers: ["🍪", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🍪", phoneticAnswer: "Cook + Key", actualAnswer: "Cookie"),
            EmojiRebus(question: "☀️ + ⬆️ =", possibleAnswers: ["🌅", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "🌅", phoneticAnswer: "Sun + Rise", actualAnswer: "Sunrise"),
            EmojiRebus(question: "📀 + 🅾️ =", possibleAnswers: ["🕺🪩", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "🕺🪩", phoneticAnswer: "Disc + O", actualAnswer: "Disco"),
            EmojiRebus(question: "🫧 + 🫖 =", possibleAnswers: ["🧋", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "🧋", phoneticAnswer: "Bubble + Tea", actualAnswer: "Bubble Tea"),
            EmojiRebus(question: "⛏️ + 🥤 =", possibleAnswers: ["🛻", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "🛻", phoneticAnswer: "Pick + Cup", actualAnswer: "Pickup"),
            EmojiRebus(question: "🦇 + 🌳 =", possibleAnswers: ["🔋", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "🔋", phoneticAnswer: "Bat + Tree", actualAnswer: "Battery"),
            EmojiRebus(question: "🌬 + 🐟 =", possibleAnswers: ["🐡", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "🐡", phoneticAnswer: "Blow + Fish", actualAnswer: "Blowfish"),
            EmojiRebus(question: "🎀 + 🆗 =", possibleAnswers: ["💐", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "💐", phoneticAnswer: "Bow + OK", actualAnswer: "Bouquet"),
            EmojiRebus(question: "🛑 + 🫣 =", possibleAnswers: ["⏱️", "🪒", "🧼", "🧴", "🧻", "🪞", "🧽", "🧯", "🧹", "🧺"].shuffled(), answer: "⏱️", phoneticAnswer: "Stop + Watch", actualAnswer: "Stopwatch"),
            EmojiRebus(question: "🐝 + 🍂 =", possibleAnswers: ["🙏", "🗼", "🥐", "⚜️", "🍷", "🥚", "🌮", "🍛", "🍙", "🥟"].shuffled(), answer: "🙏", phoneticAnswer: "Bee + Leaf", actualAnswer: "Belief"),
            EmojiRebus(question: "🪞 + ⚾️ =", possibleAnswers: ["🪩", "🗼", "🥐", "⚜️", "🍷", "🥚", "🌮", "🍛", "🍙", "🥟"].shuffled(), answer: "🪩", phoneticAnswer: "Mirror + Ball", actualAnswer: "Mirror Ball"),
            EmojiRebus(question: "🇫🇷 + 🍳 + 👀 =", possibleAnswers: ["🍟", "🗼", "🥐", "⚜️", "🍷", "🥚", "🌮", "🍛", "🍙", "🥟"].shuffled(), answer: "🍟", phoneticAnswer: "French + Fry + Eyes", actualAnswer: "French Fries"),
        ],
        .highSchool: [
            EmojiRebus(question: "🍣🥩 + 🧔🧔 =", possibleAnswers: ["🍜", "🍕", "🍩", "🍎", "🥗", "🍔", "🌮", "🍛", "🍙", "🥟"].shuffled(), answer: "🍜", phoneticAnswer: "Raw + Men", actualAnswer: "Ramen"),
            EmojiRebus(question: "⭐️ + 👊 =", possibleAnswers: ["🤩", "🗼", "🥐", "⚜️", "🍷", "🥚", "🌮", "🍛", "🍙", "🥟"].shuffled(), answer: "🤩", phoneticAnswer: "Star + Struck", actualAnswer: "Starstruck"),
            EmojiRebus(question: "🚣🏻 + 🦁 =", possibleAnswers: ["🥬", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🥬", phoneticAnswer: "Row + Mane", actualAnswer: "Romaine"),
            EmojiRebus(question: "🔥 + 🍘🦜 =", possibleAnswers: ["🧨", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🧨", phoneticAnswer: "Fire + Cracker", actualAnswer: "Firecracker"),
            EmojiRebus(question: "⏳️ + 🧙🧹 =", possibleAnswers: ["🥪", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🥪", phoneticAnswer: "Sand + Witch", actualAnswer: "Sandwich"),
            EmojiRebus(question: "🤥 + 🥱 =", possibleAnswers: ["🦁", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🦁", phoneticAnswer: "Lie + Yawn", actualAnswer: "Lion"),
            EmojiRebus(question: "🪚 + 🍋 + 🏝🏝 =", possibleAnswers: ["🇸🇧", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🇸🇧", phoneticAnswer: "Saw + Lemon + Islands", actualAnswer: "Solomon Islands"),
            EmojiRebus(question: "⬆️ + ➡️ + ⬇️ =", possibleAnswers: ["🙃", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🙃", phoneticAnswer: "Up + Side + Down", actualAnswer: "Upside Down"),
            EmojiRebus(question: "👀 + 😱 =", possibleAnswers: ["🍦", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🍦", phoneticAnswer: "Eyes + Scream", actualAnswer: "Ice Cream"),
            EmojiRebus(question: "🌅 + 🗝 =", possibleAnswers: ["🫏", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🫏", phoneticAnswer: "Dawn + Key", actualAnswer: "Donkey"),
            EmojiRebus(question: "🧔 + 🚦🏃 =", possibleAnswers: ["🥭", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🥭", phoneticAnswer: "Man + Go", actualAnswer: "Mango"),
            EmojiRebus(question: "🦌 + 🅰️ + 🦘 =", possibleAnswers: ["🤠", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🤠", phoneticAnswer: "Buck + A + Roo", actualAnswer: "Buckaroo"),
            EmojiRebus(question: "⛰ + 👂 =", possibleAnswers: ["🧗‍♂️", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🧗‍♂️", phoneticAnswer: "Mountain + Ear", actualAnswer: "Mountaineer"),
            EmojiRebus(question: "🛒 + 🛞 =", possibleAnswers: ["🤸‍♀️", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🤸‍♀️", phoneticAnswer: "Cart + Wheel", actualAnswer: "Cartwheel"),
            EmojiRebus(question: "📻 + 🏃🏋️‍♂️ =", possibleAnswers: ["☢️", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "☢️", phoneticAnswer: "Radio + Active", actualAnswer: "Radioactive"),
            EmojiRebus(question: "🅿️ + 🌳 + 🍽 =", possibleAnswers: ["🧫", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🧫", phoneticAnswer: "P + Tree + Dish", actualAnswer: "Petri Dish"),
            EmojiRebus(question: "🥧 + 🔥🚬 =", possibleAnswers: ["🧑‍✈️", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🧑‍✈️", phoneticAnswer: "Pie + Lit", actualAnswer: "Pilot"),
            EmojiRebus(question: "🗝 + 🙋🙋 =", possibleAnswers: ["🥝", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🥝", phoneticAnswer: "Key + We", actualAnswer: "Kiwi"),
            EmojiRebus(question: "🗓 + 🚣 =", possibleAnswers: ["🥙", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🥙", phoneticAnswer: "Year + Row", actualAnswer: "Gyro or Euro"),
            EmojiRebus(question: "💪 + 🙋 =", possibleAnswers: ["🪖", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🪖", phoneticAnswer: "Arm + Me", actualAnswer: "Army"),
        ],
        .college: [
            EmojiRebus(question: "😡 + 🅰️ + ⛽ + 🚗 =", possibleAnswers: ["🇲🇬", "👿", "🕶", "🤓", "🧠", "🎓", "📖", "🔬", "👓", "📚"].shuffled(), answer: "🇲🇬", phoneticAnswer: "Mad + A + Gas + Car", actualAnswer: "Madagascar"),
            EmojiRebus(question: "🪒🧔 + 🎲🎲 =", possibleAnswers: ["🍧", "🦾", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🍧", phoneticAnswer: "Shave + Dice", actualAnswer: "Shaved Ice"),
            EmojiRebus(question: "🐂🐂 + 👁️ =", possibleAnswers: ["🎯", "📍", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🎯", phoneticAnswer: "Bulls + Eye", actualAnswer: "Bullseye"),
            EmojiRebus(question: "💬🐑 + 🐂 + 🎤️ =", possibleAnswers: ["🥊", "📍", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🥊", phoneticAnswer: "Baa + Ox + Sing", actualAnswer: "Boxing"),
            EmojiRebus(question: "🤖 + 🦢 + 🅰️ =", possibleAnswers: ["🇧🇼", "🦾", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🇧🇼", phoneticAnswer: "Bot + Swan + A", actualAnswer: "Botswana"),
            EmojiRebus(question: "🗣 + 🤢 =", possibleAnswers: ["☠️", "🦾", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "☠️", phoneticAnswer: "Talk + Sick", actualAnswer: "Toxic"),
            EmojiRebus(question: "🖱➡️ + 🔫 =", possibleAnswers: ["🐉", "🦾", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🐉", phoneticAnswer: "Drag + Gun", actualAnswer: "Dragon"),
            EmojiRebus(question: "🥶 + 😋🍴 + 🦶 =", possibleAnswers: ["🌯🌯", "🦾", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🌯🌯", phoneticAnswer: "Brrr + Eat + Toes", actualAnswer: "Burritos"),
            EmojiRebus(question: "💬🐑 + 🌧 =", possibleAnswers: ["🇧🇭", "🦾", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🇧🇭", phoneticAnswer: "Baa + Rain", actualAnswer: "Bahrain"),
            EmojiRebus(question: "🫘 + 🧊 =", possibleAnswers: ["👋😀", "🦾", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "👋😀", phoneticAnswer: "Bean + Ice", actualAnswer: "Be nice"),
            EmojiRebus(question: "🛍️💵 + ☀️ =", possibleAnswers: ["🦬", "🦾", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🦬", phoneticAnswer: "Buy + Sun", actualAnswer: "Bison"),
            EmojiRebus(question: "🦠 + 💰 =", possibleAnswers: ["🇩🇪", "🦾", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🇩🇪", phoneticAnswer: "Germ + Money", actualAnswer: "Germany"),
            EmojiRebus(question: "🪚 + 🗝️ =", possibleAnswers: ["🍶", "🦾", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🍶", phoneticAnswer: "Saw + Key", actualAnswer: "Sake"),
            EmojiRebus(question: "🥫 + 🥱 =", possibleAnswers: ["🏞️", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🏞️", phoneticAnswer: "Can + Yawn", actualAnswer: "Canyon"),
            EmojiRebus(question: "🍀 + ✝️ =", possibleAnswers: ["🥍", "🥠", "⛪", "🇮🇪", "🧿", "🇱🇦", "🙅", "💥", "🧨", "🔥"].shuffled(), answer: "🥍", phoneticAnswer: "Luck + Cross", actualAnswer: "Lacrosse"),
            EmojiRebus(question: "🧬 + 🦵 =", possibleAnswers: ["🧞", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🧞", phoneticAnswer: "Gene + Knee", actualAnswer: "Genie"),
            EmojiRebus(question: "🛋 + ✔️ =", possibleAnswers: ["🇩🇰", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🇩🇰", phoneticAnswer: "Den + Mark", actualAnswer: "Denmark"),
            EmojiRebus(question: "🪓 + 🏑🏒 =", possibleAnswers: ["🥢", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🥢", phoneticAnswer: "Chop + Sticks", actualAnswer: "Chopsticks"),
            EmojiRebus(question: "🎤️ + 👘 =", possibleAnswers: ["🦠", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🦠", phoneticAnswer: "Mike + Robe", actualAnswer: "Microbe"),
            EmojiRebus(question: "🍐 + 🏃 + 🔫 =", possibleAnswers: ["🪂", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🪂", phoneticAnswer: "Pear + Rush + Shoot", actualAnswer: "Parachute"),
        ],
        .phd: [
            EmojiRebus(question: "🧑‍⚖️⚖️ + 🤾 + 🍾 =", possibleAnswers: ["🍭", "📍", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🍭", phoneticAnswer: "Law + Leap + Pop", actualAnswer: "Lollipop"),
            EmojiRebus(question: "🚐 + 🆕 + 🔌 + ✌️ =", possibleAnswers: ["🇻🇺", "📍", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🇻🇺", phoneticAnswer: "Van + New + Watt + Two", actualAnswer: "Vanuatu"),
            EmojiRebus(question: "🅰️ + 💬🐑 + 🤬 =", possibleAnswers: ["🧮", "📍", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🧮", phoneticAnswer: "A + Baa + Cuss", actualAnswer: "Abacus"),
            EmojiRebus(question: "🅾️ + 🛋 =", possibleAnswers: ["🍢", "🇴🇲", "🧿", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🍢", phoneticAnswer: "O + Den", actualAnswer: "Oden"),
            EmojiRebus(question: "🪨 + 🥫 + 👋🎲 =", possibleAnswers: ["🎸🤘", "🎰", "🔪", "🥩", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🎸🤘", phoneticAnswer: "Rock + Can + Roll", actualAnswer: "Rock and Roll"),
            EmojiRebus(question: "🇰🇷 - 💴 =", possibleAnswers: ["🍛", "🇰🇵", "🏚", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🍛", phoneticAnswer: "Korean - Yen", actualAnswer: "Curry"),
            EmojiRebus(question: "📌 + 🛥 + 🅰️ =", possibleAnswers: ["🪅", "🥧", "📱", "⚡", "🌈", "🌀", "🎇", "💥", "🧨", "🔥"].shuffled(), answer: "🪅", phoneticAnswer: "Pin + Yacht + A", actualAnswer: "Piñata"),
            EmojiRebus(question: "🚭 + ☕️ =", possibleAnswers: ["🪕", "🇰🇵", "🏚", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🪕", phoneticAnswer: "Ban + Joe", actualAnswer: "Banjo"),
            EmojiRebus(question: "⏳️ + 🪆 =", possibleAnswers: ["👡", "🇰🇵", "🏚", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "👡", phoneticAnswer: "Sand + Doll", actualAnswer: "Sandal"),
            EmojiRebus(question: "🥛 + 🗝 + ⚖️ =", possibleAnswers: ["🌌", "🇰🇵", "🏚", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🌌", phoneticAnswer: "Milk + Key + Weigh", actualAnswer: "Milky Way"),
            EmojiRebus(question: "🫵 + 🏗️ =", possibleAnswers: ["🇺🇦", "🇰🇵", "🏚", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🇺🇦", phoneticAnswer: "You + Crane", actualAnswer: "Ukraine"),
            EmojiRebus(question: "🥫 + 🎩 =", possibleAnswers: ["♋", "🇰🇵", "🏚", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "♋", phoneticAnswer: "Can + Sir", actualAnswer: "Cancer"),
            EmojiRebus(question: "🗣💬 + 🐚🐚 =", possibleAnswers: ["🇸🇨", "🇰🇵", "🏚", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🇸🇨", phoneticAnswer: "Say + Shells", actualAnswer: "Seychelles"),
            EmojiRebus(question: "🍫 + 🥶 =", possibleAnswers: ["💈", "🇰🇵", "🏚", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "💈", phoneticAnswer: "Bar + Brrr", actualAnswer: "Barber"),
            EmojiRebus(question: "🍣🥩 + 🐱 - 🔟 =", possibleAnswers: ["🚀", "🇰🇵", "🏚", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🚀", phoneticAnswer: "Raw + Kitten - Ten", actualAnswer: "Rocket"),
            EmojiRebus(question: "🎒🎒 + 🪡 + ☎️ =", possibleAnswers: ["🎷", "🇰🇵", "🏚", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🎷", phoneticAnswer: "Sacks + Sew + Phone", actualAnswer: "Saxophone"),
            EmojiRebus(question: "🥧 + ©️©️ =", possibleAnswers: ["♓", "🇰🇵", "🏚", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "♓", phoneticAnswer: "Pie + Cs", actualAnswer: "Pisces"),
            EmojiRebus(question: "🎤️ + 🅰️ + 🫗 =", possibleAnswers: ["🇸🇬", "🇵🇭", "🏚", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🇸🇬", phoneticAnswer: "Sing + A + Pour", actualAnswer: "Singapore"),
            EmojiRebus(question: "👋 + 🅰️ + 🎹 =", possibleAnswers: ["🪻", "🇰🇵", "🏚", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🪻", phoneticAnswer: "Hi + A + Synth", actualAnswer: "Hyacinth"),
            EmojiRebus(question: "🍲 + 💬🐈 + 🙋 + 🚣 =", possibleAnswers: ["🦸‍♂️", "🇰🇵", "🏚", "🥅", "🔘", "🔵", "🔴", "🔺", "📌", "⛳️"].shuffled(), answer: "🦸‍♂️", phoneticAnswer: "Soup + Purr + Here + Row", actualAnswer: "Superhero"),
        ]
    ]
}
