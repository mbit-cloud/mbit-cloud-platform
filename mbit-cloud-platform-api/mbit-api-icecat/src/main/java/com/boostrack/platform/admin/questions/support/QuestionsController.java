package com.boostrack.platform.admin.questions.support;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.boostrack.platform.admin.projects.Project;
//import com.boostrack.platform.admin.projects.support.ProjectMetadataService;
import com.boostrack.platform.admin.support.nav.Navigation;
import com.boostrack.platform.admin.support.nav.Section;

@Controller
@Navigation(Section.QUESTIONS)
class QuestionsController {

//    private final ProjectMetadataService projectMetadata;
//    private final StackOverflowClient stackOverflow;
//
//    private final Log logger = LogFactory.getLog(QuestionsController.class);
//
//    @Autowired
//    public QuestionsController(ProjectMetadataService projectMetadata, StackOverflowClient stackOverflow) {
//        this.projectMetadata = projectMetadata;
//        this.stackOverflow = stackOverflow;
//    }
//
//    @ExceptionHandler(HttpClientErrorException.class)
//    public ModelAndView handleStackOverflowAPIException(HttpClientErrorException clientErrorException) {
//
//        logger.error("Error while fetching questions from StackOverflow API", clientErrorException);
//        ModelAndView mav = new ModelAndView("questions/index");
//        mav.addObject("questions", Collections.emptyList());
//        mav.addObject("projects", getProjectList());
//
//        return mav;
//    }
//
//    @RequestMapping("/questions")
//    public String show(Model model) {
//
//        model.addAttribute("questions", stackOverflow.searchForQuestionsTagged("spring"));
//        model.addAttribute("projects", getProjectList());
//
//        return "questions/index";
//    }
//
//    private List<Project> getProjectList() {
//
//        return projectMetadata.getProjects().stream()
//                .filter(project -> !project.getCategory().equals("attic"))
//                .filter(project -> !project.getStackOverflowTagList().isEmpty())
//                .sorted((p1, p2) -> p1.getName().compareToIgnoreCase(p2.getName()))
//                .collect(Collectors.toList());
//    }

}
