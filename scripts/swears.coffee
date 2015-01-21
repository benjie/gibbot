# Description:
#   Count swears
#
# Commands:
#   hubot how much is in the swear jar? - Displays the amount of money hubot thinks everyone owes him for foul language
#   hubot how much do I owe the swear jar? - Displays the amount of money hubot thinks you owe him for foul language
#   hubot how much does <name> owe the swear jar? - Displays the amount of money hubot thinks <name> owes him for foul language
#   hubot who owes the swear jar? - Displays the amount each person owes the swear jar
#
# Author:
#   rowanmanning

_ = require 'underscore'
numeral = require 'numeral'

badSwears = ///
\b
  ( (mother)?fuck(ing|er|ed|s)?
  | shit(e|ting|ter|ty|test|s)?
  | piss(ing|er|ed|s)?
  | cunt(ing|s)?
  | assholes?
  | arseholes?
  | wankers?
  | twats?
  )
\b
///i

moderateSwears = ///
\b
  ( bollo(ck|x)(ing|ed|s)?
  | wank(ing|ed|s)?
  | twat(ting|ted)
  | dick(s|heads?)?
  | cock(ing|s)?
  | asses?
  | arses?
  | bastard(ing|s)?
  )
\b
///i

lightSwears = ///
\b
  ( damn
  | crap(ped|ping|per|py|s)?
  | sod(ding|s)?
  | bugger(ed|y|s)?
  )
\b
///i

module.exports = (robot) ->

  getJar = ->
    robot.brain.get('swearJar') || {users: {}, amount: 0}

  saveJar = (jar) ->
    robot.brain.set('swearJar', jar)

  incrementJar = (userId, amount) ->
    jar = getJar()
    jar.amount += amount
    jar.users[userId] ?= 0
    jar.users[userId] += amount
    saveJar(jar)

  formatAmount = (amount) ->
    '£' + numeral(amount).format('0,0.00')

  # Silently log swears
  robot.hear badSwears, (msg) ->
    incrementJar msg.message.user.id, 1
  robot.hear moderateSwears, (msg) ->
    incrementJar msg.message.user.id, 0.5
  robot.hear lightSwears, (msg) ->
    incrementJar msg.message.user.id, 0.3

  # Query swear jar
  robot.respond /how much( (money|cash))? is in the swear\s?jar/i, (msg) ->
    amount = formatAmount(getJar().amount)
    msg.send "There's #{amount} in the swear jar"

  # Check how much is owed
  robot.respond /how much do(es)? ([a-z0-9\s\-]+) owe the swear\s?jar/i, (msg) ->
    name = msg.match[2]
    jar = getJar()
    user = msg.message.user.id
    if name.toUpperCase() == 'I'
      amount = formatAmount(jar.users[user] || 0)
      msg.reply "You owe the swear jar #{amount}"
    else
      users = robot.brain.usersForFuzzyName name
      if users.length == 0
        msg.reply "I don't know who #{name} is"
      else if users.length > 1
        msg.reply 'I\'m not sure who you mean, one of these? ' + users.map((user) -> user.name).join(', ')
      else
        amount = formatAmount(jar.users[users[0].id] || 0)
        msg.reply "#{users[0].name} owes the swear jar #{amount}"

  # List amounts owed
  robot.respond /who owes the swear jar/i, (msg) ->
    jar = getJar()
    users = _.values(robot.brain.users()).slice().map((user) ->
      user.swearAmount = jar.users[user.id] || 0
      return user
    ).filter((user) ->
      user.swearAmount > 0
    )
    users = _.sortBy(users, 'swearAmount').reverse()
    users = ("#{user.name} - #{formatAmount(user.swearAmount)}" for user in users when user.name isnt 'FEDbot')
    msg.send 'Who owes money to the swear jar:\n' + users.join('\n')
