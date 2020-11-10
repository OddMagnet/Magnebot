import Sword

let bot = Sword(token: Secrets.botToken)

bot.editStatus(to: "online", playing: "with Swords!")

bot.on(.messageCreate) { data in
    let msg = data as! Message

    switch msg.content {
        case "!ping":
            msg.reply(with: "Pong!")
            break
        case "!69":
            msg.reply(with: "Nice!")
            break
        case "!cdog":
            msg.reply(with: "No, dishwasher and washingmachines are not the same!")
            break
        default:
            break
    }
//    if msg.content == "!ping" {
//        msg.reply(with: "Pong!")
//    }
}

bot.connect()
