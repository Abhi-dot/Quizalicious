package com.abhi.QuizApp.controller;


import com.abhi.QuizApp.dto.LoginRequest;
import com.abhi.QuizApp.dto.UserAnswer;
import com.abhi.QuizApp.entity.QuizQuestion;
import com.abhi.QuizApp.repo.QuestionRepo;
import com.abhi.QuizApp.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/api")
public class LoginController {

    @Autowired
    private QuestionService questionService;
    @Autowired
    QuestionRepo questionRepo;

    private final String USERNAME = "root";
    private final String PASSWORD = "Abhi27@2004";



//    @GetMapping("/questions")
//    public List<QuizQuestion> getQuestions() {
//        return questionService.getAllQuestions();
//    }

    @GetMapping("/questions/{category}")
    public List<QuizQuestion> getQuestionsByCategory(@PathVariable String category) {
        return questionService.getQuestionsByCategory(category);
      }

    @PostMapping("/save")
    public QuizQuestion saveQuestion(@RequestBody QuizQuestion question) {
        return questionService.saveQuestion(question);
    }

}
