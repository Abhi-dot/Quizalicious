let currentQuestionIndex = 0;
let questions = [];
let correctAnswers = 0; // To track the number of correct answers
let totalQuestions = 0; // Will be set dynamically based on the API response
let timeRemaining = 60; // Total time in seconds for the quiz
const timerElement = document.getElementById('timer');
// Fetch questions from the API
async function fetchQuestions() {
  try {
    const response = await fetch('http://localhost:8080/api/questions/Python'); // Python-specific endpoint

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

// Display the current question and its options
function displayQuestion() {
  if (questions.length === 0) return;

  const questionText = document.getElementById('question-text');
  const optionsContainer = document.getElementById('options-container');
  const currentQuestion = questions[currentQuestionIndex];

  // Display the current question text
  questionText.textContent = currentQuestion.questionText;
  optionsContainer.innerHTML = ''; // Clear previous options

  // Render each option as a button
  currentQuestion.options.forEach((option) => {
    const button = document.createElement('button');
    button.textContent = option; // Display the option text
    button.className = 'option';
    button.onclick = () => checkAnswer(option); // Add event listener to check the answer
    optionsContainer.appendChild(button);
  });

  // Update the current question number
  document.getElementById('current-question').textContent = currentQuestionIndex + 1;
}

// Check if the selected answer is correct
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

// Navigate to the next question or display the results
function nextQuestion() {
  if (currentQuestionIndex < questions.length - 1) {
    currentQuestionIndex++;
    displayQuestion();
  } else {
    // Quiz completed, save and display the final score
    localStorage.setItem('quizScore', correctAnswers); // Save the score
    localStorage.setItem('totalQuestions', totalQuestions); // Save total questions
    window.location.href = 'result.html'; // Redirect to Python-specific results page
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

// Initialize the quiz when the page loads
window.onload = fetchQuestions;
