# Description:
#   Gibbot knows the agile manifesto
#
# Commands:
#   hubot what are the principles - Get a list of the agile manifesto principles
#   hubot principle me - Get a random agile manifesto principle
#
# Author:
#   rowanmanning

module.exports = (robot) ->

  principles = [
    'Our highest priority is to satisfy the customer through early and continuous delivery of valuable software.'
    'Welcome changing requirements, even late in development. Agile processes harness change for the customer\'s competitive advantage.'
    'Deliver working software frequently, from a couple of weeks to a couple of months, with a preference to the shorter timescale.'
    'Business people and developers must work together daily throughout the project.'
    'Build projects around motivated individuals. Give them the environment and support they need, and trust them to get the job done.'
    'The most efficient and effective method of conveying information to and within a development team is face-to-face conversation.'
    'Working software is the primary measure of progress.'
    'Agile processes promote sustainable development. The sponsors, developers, and users should be able to maintain a constant pace indefinitely.'
    'Continuous attention to technical excellence and good design enhances agility.'
    'Simplicity – the art of maximizing the amount of work not done – is essential.'
    'The best architectures, requirements, and designs emerge from self-organizing teams.'
    'At regular intervals, the team reflects on how to become more effective, then tunes and adjusts its behavior accordingly.'
  ]

  robot.respond /what are the( agile( manifesto)?)? principles/i, (msg) ->
    msg.send principles.join('\n\n')

  robot.respond /give me a(n agile( manifesto)?)? principle|principle me/i, (msg) ->
    msg.send msg.random principles
