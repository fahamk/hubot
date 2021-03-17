# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

  robot.respond /help/i, (res) ->
    res.send "To start a SWAT, type `@RoBC swat start"
  
  robot.respond /swat start/i, (res) ->
    res.send "You have asked to initiate a SWAT with ID: 12592601, in order to complete the initiation, please answer the following questions:\n\
    - Which cloud platform is affected? (Answer with `@RoBC swat update cloud <cloud_platform>`)"
  
  robot.respond /swat update cloud /i, (res) ->
    res.send "Thanks, I've updated the cloud platform, now please answer the next question:\n \
    - Who is handling the SWAT? (Answer with `@RoBC swat update handler <handler_slack_username>`)"

  robot.respond /swat update handler /i, (res) ->
    res.send "Thanks, I've updated the incident's handler, now please answer the next question:\n \
    - What is the issue? (Answer with `@RoBC swat update issue <issue>`)"
  
  robot.respond /swat update issue /i, (res) ->
    res.send "Thanks, I've updated the incident's issue, now please answer the next question:\n \
    - Which component is affected? (Answer with `@RoBC swat update component <component>`)"

  robot.respond /swat update component /i, (res) ->
    res.send "Thanks, I've updated the incident's component info, now please answer the next question:\n \
    - Provide the specific component details i.e server, hostname etc. (Answer with `@RoBC swat update details <component_details>`)"

  robot.respond /swat update details /i, (res) ->
    res.send "Thanks, I've updated the incident's component details. We're good to go\n \
    @channel SWAT has been started with ID: 12592601 \n \
    You can now use the following commands throughout the SWAT: \n \
    1. To update the incident report: `@RoBC swat update 12592601 <your_update_text_here>`\n \
    2. To close the incident and compile a report: `@RoBC swat done 12592601`\n \
    3. To call all relevant incident responders: `@RoBC swat notify 12592601` or if its a specific team, `@RoBC swat notify <team_name>`\n \
    4. At any time you can review the incident summary with `@RoBC swat summary 12592601`"

  robot.respond /swat update 12592601/i, (res) ->
    res.send "I have updated the incident 12592601, to view the summary, ask me by saying: `@RoBC swat summary 12592601`"
  
  robot.respond /swat done 12592601/i, (res) ->
    res.send "I've closed the SWAT 12592601, can you please explain to me the resolution you had for this incident? It'll help me help you out in the future.\n \
    If there was a resolution, type `@RoBC swat resolution 12592601 <your_text_here>`. \n \
    If there isn't any resolution yet, you don't need to do anything, you can always update me in the future with the above command.\n \
    Next you can email the SWAT incident summary to all the relevant people with `@RoBC swat email 12592601`, to see the email list ask `@RoBC swat email-list`"

  robot.respond /swat notify 12592601/i, (res) ->
    res.send "I've sent an alert to all responders, they should be receiving a call from PagerDuty soon."
  
  robot.respond /swat summary 12592601/i, (res) ->
    res.send "SWAT incident summary for 12592601:\n \
    Cloud Platform: OCP \n \
    Handler: Faham Khan \n \
    Issue: A majority of our requests are timing out on the OCP4 prod cluster. \n \
    Component affected: API Server\n \
    Details: 10.211.147.86\n \
    ```Report #1, Faham Khan: There seems to be an issue with the CPU load being overwhelmed\nReport #2, Faham Khan: Turns out we need to up the hardware in order to handle the new traffic coming our way```"

  robot.respond /swat email 12592601/i, (res) ->
    res.send "I've sent an email to everyone on the email list."

  robot.respond /swat resolution 12592601/i, (res) ->
    res.send "I have updated the incident 12592601 with its resolution, to view the summary, ask me by saying: `@RoBC swat summary 12592601`"
  
  robot.respond /oncall ocp/i, (res) ->
    res.send "PagerDuty On-Call:\n\
SRE: Faham Khan (647-778-5935)\n\
SUPPORT: Bogdan Adamiak (647-227-2932)"
  #
  #
  # robot.respond /open the (.*) doors/i, (res) ->
  #   doorType = res.match[1]
  #   if doorType is "pod bay"
  #     res.reply "I'm afraid I can't let you do that."
  #   else
  #     res.reply "Opening #{doorType} doors"
  #
  # robot.hear /I like pie/i, (res) ->
  #   res.emote "makes a freshly baked pie"
  #
  # lulz = ['lol', 'rofl', 'lmao']
  #
  # robot.respond /lulz/i, (res) ->
  #   res.send res.random lulz
  #
  # robot.topic (res) ->
  #   res.send "#{res.message.text}? That's a Paddlin'"
  #
  #
  # enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
  # leaveReplies = ['Are you still there?', 'Target lost', 'Searching']
  #
  # robot.enter (res) ->
  #   res.send res.random enterReplies
  # robot.leave (res) ->
  #   res.send res.random leaveReplies
  #
  # answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  #
  # robot.respond /what is the answer to the ultimate question of life/, (res) ->
  #   unless answer?
  #     res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  #     return
  #   res.send "#{answer}, but what is the question?"
  #
  # robot.respond /you are a little slow/, (res) ->
  #   setTimeout () ->
  #     res.send "Who you calling 'slow'?"
  #   , 60 * 1000
  #
  # annoyIntervalId = null
  #
  # robot.respond /annoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  #
  #   res.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  #
  # robot.respond /unannoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     res.send "Not annoying you right now, am I?"
  #
  #
  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  #
  #   robot.messageRoom room, "I have a secret: #{secret}"
  #
  #   res.send 'OK'
  #
  # robot.error (err, res) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  #
  #   if res?
  #     res.reply "DOES NOT COMPUTE"
  #
  # robot.respond /have a soda/i, (res) ->
  #   # Get number of sodas had (coerced to a number).
  #   sodasHad = robot.brain.get('totalSodas') * 1 or 0
  #
  #   if sodasHad > 4
  #     res.reply "I'm too fizzy.."
  #
  #   else
  #     res.reply 'Sure!'
  #
  #     robot.brain.set 'totalSodas', sodasHad+1
  #
  # robot.respond /sleep it off/i, (res) ->
  #   robot.brain.set 'totalSodas', 0
  #   res.reply 'zzzzz'
