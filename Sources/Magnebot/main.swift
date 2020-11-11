import Sword

let botOptions = ShieldOptions(
    prefixes: ["!"]
    // requirements: <#T##CommandRequirements#>,
    // willBeCaseSensitive: <#T##Bool#>,
    // willDefaultHelp: <#T##Bool#>,
    // willIgnoreBots: <#T##Bool#>
)
//let bot = Sword(token: Secrets.botToken)
let bot = Shield(token: Secrets.botToken,
                 shieldOptions: botOptions)

bot.editStatus(to: "online", playing: "with Swords!")

bot.register("odd", message: "Magnet")
bot.register("echo") { msg, args in
    msg.reply(with: args.joined(separator: ", "))
}
bot.register("user") { msg, _ in
    msg.reply(with: "You are \(msg.author?.username ?? "n/a")")
}

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
            bot.addReaction("🤡", to: msg.id, in: msg.channel.id)
            msg.reply(with: "No, dishwasher and washingmachines are not the same!") { reply, error in
                guard let reply = reply else { return }
                bot.addReaction("🤡", to: reply.id, in: reply.channel.id)
            }
            break
        default:
            break
    }
//    if msg.content == "!ping" {
//        msg.reply(with: "Pong!")
//    }
}

bot.connect()
