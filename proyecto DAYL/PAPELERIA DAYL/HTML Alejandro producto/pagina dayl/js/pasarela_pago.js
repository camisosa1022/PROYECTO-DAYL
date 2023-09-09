// toggleVisibility.js
function toggleSecondFormVisibility(checkboxId) {
    const checkbox = document.getElementById(checkboxId);
    const secondFormContent = document.getElementById('secondFormContent');

    if (checkbox.checked) {
        secondFormContent.style.display = 'block';
    } else {
        secondFormContent.style.display = 'none';
    }
}
