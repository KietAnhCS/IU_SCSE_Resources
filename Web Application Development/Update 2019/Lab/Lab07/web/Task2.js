var startBtn = document.getElementById('startBtn')
var content = document.getElementById('content')
var questionField = document.getElementById('questionField')
var submitField = document.getElementById('submitField')

var timeRemain = 60

const startCountDown = () => {
    content.style.display = 'block'
    let refreshBtn = setInterval(() => {
        let mmss = (new Date(timeRemain*1000)).toISOString().substr(14, 5)
        startBtn.innerHTML = `The remaining time: ${mmss} [mm:ss]`
        if (timeRemain === 0) {
            clearInterval(refreshBtn)
            questionField.style.display = 'none'
            submitField.style.display = 'block'
            startBtn.style.display = 'none'
        }

        timeRemain -= 1    
    }, 1000)
}

