function saveIdea(){
  var title = document.getElementById('title')
  var body = document.getElementById('body')
  var save = document.getElementById('button')
  var titleText = title.getElementsByClassName('input-text')[0].value
  var bodyText = body.getElementsByClassName('input-text')[0].value
  stringifyIdea(titleText, bodyText)
}

function stringifyIdea(titleText, bodyText){
  var idea = {title: titleText, idea: bodyText}
  var stringified = JSON.stringify(idea)
  localStorageSave(stringified)
}

function localStorageSave(stringified){
  localStorage.setItem('ideabox', stringified)
}
