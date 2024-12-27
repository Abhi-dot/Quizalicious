let currentQuestionIndex = 0;
let questions = [];
let correctAnswers = 0; // To track the number of correct answers
let totalQuestions = 0; // Will be set dynamically based on the API response
let timeRemaining = 60; // Total time in seconds for the quiz
const timerElement = document.getElementById('timer');
// To fetch questions from API
async function fetchQuestions() {
  try {
    const response = await fetch('http://localhost:8080/api/questions/.NET');

    if (!response.ok) {
      throw new Error('Network response was not ok.');
    }
    questions = await response.json(); // Assume API returns an array of question objects

    totalQuestions = questions.length; // Set total questions based on fetched data
    document.getElementById('total-questions').textContent = totalQuestions; // Update the total questions in the HTML
    displayQuestion();
  } catch (error) {
    console.error('Error fetching questions:', error);
    document.getElementById('question-text').textContent =
      'Failed to load questions. Please try again.';
  }
}

function displayQuestion() {
  if (questions.length === 0) return;

  const questionText = document.getElementById('question-text');
  const optionsContainer = document.getElementById('options-container');
  const currentQuestion = questions[currentQuestionIndex];

  questionText.textContent = currentQuestion.questionText; // Display the current question text
  optionsContainer.innerHTML = ''; // Clear previous options
  currentQuestion.options.forEach((option) => {
    const button = document.createElement('button');
    button.textContent = option; // Display the option text
    button.className = 'option';
    button.onclick = () => checkAnswer(option); // Add event listener to check the answer
    optionsContainer.appendChild(button);
  });

  document.getElementById('current-question').textContent =
    currentQuestionIndex + 1;
}

function checkAnswer(selectedOption) {
  const currentQuestion = questions[currentQuestionIndex];

  if (selectedOption === currentQuestion.correctAnswer) {
    correctAnswers++;
  }

  // Automatically move to the next question after selecting an answer
  nextQuestion();
}

function prevQuestion() {
  if (currentQuestionIndex > 0) {
      currentQuestionIndex--;
      displayQuestion();
  }
}

function nextQuestion() {
  if (currentQuestionIndex < questions.length - 1) {
    currentQuestionIndex++;
    displayQuestion();
  } else {
    // Quiz completed, save and display the final score
    localStorage.setItem('quizScore', correctAnswers); // Save the score
    localStorage.setItem('totalQuestions', totalQuestions); // Save total questions
    window.location.href = 'result.html'; // Redirect to results page
  }
}

// Function to format time as "minutes:seconds"
function formatTime(seconds) {
  const minutes = Math.floor(seconds / 60);
  const secs = seconds % 60;
  return `${minutes}:${secs < 10 ? '0' : ''}${secs}`;
}

// Function to update the timer every second
function startTimer() {
  const timerInterval = setInterval(() => {
      if (timeRemaining > 0) {
          timeRemaining--;
          timerElement.textContent = formatTime(timeRemaining);
      } else {
          clearInterval(timerInterval); // Stop the timer
          saveQuizResult(); // Save the result and redirect to result page
      }
  }, 1000);
}

// Initialize the quiz when the window loads
window.onload = fetchQuestions;
