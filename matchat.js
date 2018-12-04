const matchat = document.querySelector('.acp_content').children[0].src
const matchatURL = matchat.slice(8)

window.open('http://' + matchatURL)

// browser bookmark
javascript:(function(){ const matchat = document.querySelector('.acp_content').children[0].src; const matchatURL = matchat.slice(8); window.open('http://' + matchatURL) })()
