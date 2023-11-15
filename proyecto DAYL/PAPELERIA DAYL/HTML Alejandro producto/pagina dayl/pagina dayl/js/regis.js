function toggleForm() {
    var personType = document.getElementById('person-type').value;
    var juridicaForm = document.getElementById('juridica-form');
    var naturalForm = document.getElementById('natural-form');
    var questionSection = document.getElementById('question-section');
  
    if (personType === 'juridica') {
      juridicaForm.style.display = 'block';
      naturalForm.style.display = 'none';
      questionSection.style.display = 'none';
    } else if (personType === 'natural') {
      juridicaForm.style.display = 'none';
      naturalForm.style.display = 'block';
      questionSection.style.display = 'none';
    } else {
      juridicaForm.style.display = 'none';
      naturalForm.style.display = 'none';
      questionSection.style.display = 'block';
    }
  }
  