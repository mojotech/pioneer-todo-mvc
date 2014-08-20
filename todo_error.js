module.exports = function(failure){
  return format(failure)
}

format = function(failure){
  var message = shorten(failure, 5)
  return surroundError(message)
}

shorten = function(message, numlines){
  return message.split('\n').splice(0, numlines).join('\n')
}

surroundError = function(message) {
  var split = message.split('\n')
  var error = ['-------------------------------------'].concat(split)
  return error.concat('-------------------------------------').join('\n')
}
