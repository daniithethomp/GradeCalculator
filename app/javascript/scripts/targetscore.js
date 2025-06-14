console.log('targetscore.js loaded');
window.addEventListener('DOMContentLoaded', () => {
    
    let targetscoreslider = document.getElementById('target_score');
    let targetscorevalue = document.getElementById('target_score_value');
    updateTargetScoreValue();

    targetscoreslider.addEventListener('input', (event) => {
        targetscorevalue.textContent = event.target.value;
    });

    function updateTargetScoreValue() {
        targetscorevalue.innerHTML = targetscoreslider.value;
    }
});