/**
 * Video title generator
 *
 * var matches: table of matches
 * teama: text for team a
 * teamb: text for team b
 */
const matches = document.querySelectorAll('.matches')[1].querySelector('tbody').querySelectorAll('tr')
const teama = document.querySelector('.container.left').children[0].textContent.strip()
const teamb = document.querySelector('.container.right').children[0].textContent.strip()

let date = ""

matches.forEach(m => {
    if (Array.from(m.querySelectorAll('td.team.team-a'))[0].querySelector('a').title === teama && Array.from(m.querySelectorAll('td.team.team-b'))[0].querySelector('a').title === teamb) {
        date = Array.from(m.querySelectorAll('td.full-date'))[0].innerText
    }
})

console.log(teama + ' vs ' + teamb + ' ' + date)

// broswer API only
// copy(teama + ' vs ' + teamb + ' ' + date)
