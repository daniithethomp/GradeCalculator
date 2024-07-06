console.log('thresholdtest.js loaded');
window.addEventListener('DOMContentLoaded', () => {
    let threshholdtestcheckbox = document.getElementById('test_is_threshold');
    let max_score = document.getElementById('max_score_div');
    let earned_score = document.getElementById('earned_score_div');
    let is_pass = document.getElementById('is_pass_div');

    toggleThresholdTest();

    threshholdtestcheckbox.addEventListener('change', toggleThresholdTest);

    function toggleThresholdTest() {
        if (threshholdtestcheckbox.checked) {
            max_score.style.display = "none";
            earned_score.style.display = "none";
            is_pass.style.display = "block";
        } else {
            max_score.style.display = "block";
            earned_score.style.display = "block";
            is_pass.style.display = "none";
        }
    }
});