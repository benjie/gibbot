# Description:
#   Get Hubot to insult you
#
# Commands:
#   hubot insult me - Get a random insult
#
# Author:
#   rowanmanning

randomValue = require('./helpers/random').randomValue
randomBetween = require('./helpers/random').randomBetween

module.exports = (robot) ->
  robot.respond /insult ([a-z0-9\s\-]+)/i, (msg) ->
    who = msg.match[1]
    if who == 'me'
      msg.reply generateInsult()
    else
      users = robot.brain.usersForFuzzyName who
      if users.length == 0
        msg.reply "I don't know who #{who} is"
      else if users.length > 1
        msg.reply 'I\'m not sure who you mean, one of these? ' + users.map((user) -> user.name).join(', ')
      else
        msg.send users[0].name + ': ' + generateInsult()

generateInsult = ->
  randomValue(insultFormats)()

insultFormats = [
  -> "You make me #{randomValue(negativeReactions)}, you #{randomValue(negativeAdverbs)} #{randomValue(negativeAdjectives)} #{randomEntity()}"
  -> "Go back to #{randomValue(dwellings)}, you #{randomValue(negativeAdverbs)} #{randomValue(negativeAdjectives)} #{randomEntity()}"
  -> "You #{randomValue(negativeAdverbs)} #{randomValue(negativeAdjectives)} #{randomEntity()}"
]

randomEntity = ->
  if randomBetween(1, 4) == 1
    randomValue(entities)
  else
    "#{randomValue(entities)}-#{randomValue(entityModifiers)}"

entities = [
  'ass'
  'chicken'
  'goat'
  'horse'
  'pig'
  'piss'
  'puke'
  'sheep'
  'shit'
  'toad'
]

entityModifiers = [
  'eater'
  'farmer'
  'fiddler'
  'fucker'
  'king'
  'licker'
  'lord'
  'lover'
  'milker'
  'queen'
  'stirrer'
  'sucker'
  'suckler'
  'taster'
]

negativeAdjectives = [
  'aggressive'
  'aloof'
  'arrogant'
  'belligerent'
  'big-headed'
  'bitchy'
  'boastful'
  'bone-idle'
  'boring'
  'bossy'
  'callous'
  'cantankerous'
  'careless'
  'changeable'
  'clinging'
  'compulsive'
  'conservative'
  'cowardly'
  'cruel'
  'cunning'
  'cynical'
  'deceitful'
  'detached'
  'dishonest'
  'dogmatic'
  'domineering'
  'finicky'
  'flirtatious'
  'foolish'
  'foolhardy'
  'fussy'
  'greedy'
  'grumpy'
  'gullible'
  'harsh'
  'impatient'
  'impolite'
  'impulsive'
  'inconsiderate'
  'inconsistent'
  'indecisive'
  'indiscreet'
  'inflexible'
  'interfering'
  'intolerant'
  'irresponsible'
  'jealous'
  'lazy'
  'Machiavellian'
  'materialistic'
  'mean'
  'miserly'
  'moody'
  'narrow-minded'
  'nasty'
  'naughty'
  'nervous'
  'obsessive'
  'obstinate'
  'overcritical'
  'overemotional'
  'parsimonious'
  'patronizing'
  'perverse'
  'pessimistic'
  'pompous'
  'possessive'
  'pusillanimous'
  'quarrelsome'
  'quick-tempered'
  'resentful'
  'rude'
  'ruthless'
  'sarcastic'
  'secretive'
  'selfish'
  'self-centred'
  'self-indulgent'
  'silly'
  'sneaky'
  'stingy'
  'stubborn'
  'stupid'
  'superficial'
  'tactless'
  'timid'
  'touchy'
  'thoughtless'
  'truculent'
  'unkind'
  'unpredictable'
  'unreliable'
  'untidy'
  'untrustworthy'
  'vague'
  'vain'
  'vengeful'
  'vulgar'
  'weak-willed'
]

negativeAdverbs = [
  'alarmingly'
  'appallingly'
  'arrogantly'
  'atrociously'
  'bitterly'
  'boorishly'
  'brashly'
  'brazenly'
  'brutally'
  'cruelly'
  'dastardly'
  'deceptively'
  'defiantly'
  'deliberately'
  'deviously'
  'diabolically'
  'ferociously'
  'fiercely'
  'flagrantly'
  'formidably'
  'harmfully'
  'heinously'
  'horrendously'
  'insufferably'
  'insultingly'
  'intentionally'
  'malevolently'
  'maliciously'
  'menacingly'
  'monstrously'
  'notoriously'
  'obnoxiously'
  'obsessively'
  'offensively'
  'outlandishly'
  'outrageously'
  'potently'
  'powerfully'
  'preposterously'
  'recklessly'
  'relentlessly'
  'reproachfully'
  'repugnantly'
  'ruthlessly'
  'sadistically'
  'savagely'
  'scandalously'
  'shamefully'
  'shamelessly'
  'shockingly'
  'sinisterly'
  'tempestuously'
  'treacherously'
  'tyrannically'
  'uncontrollably'
  'unethically'
  'unscrupulously'
  'vehemently'
  'venomously'
  'viciously'
  'wantonly'
  'wickedly'
]

negativeReactions = [
  'ill'
  'nauseous'
  'question my existence'
  'see red'
  'sick'
  'want to break things'
  'want to die'
  'want to end it all'
]

dwellings = [
  'the rock you crawled out from under'
  'whichever pit you crawled out of'
  'your cave'
  'your hole'
  'your sty'
]
