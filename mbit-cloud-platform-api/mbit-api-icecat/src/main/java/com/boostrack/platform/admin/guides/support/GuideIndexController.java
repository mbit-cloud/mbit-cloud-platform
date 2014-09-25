package com.boostrack.platform.admin.guides.support;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boostrack.platform.admin.support.nav.Navigation;
import com.boostrack.platform.admin.support.nav.Section;

import static org.springframework.web.bind.annotation.RequestMethod.*;

/**
 * Controller that handles requests for the index page for all guide docs at /guides.
 *
 * @see com.boostrack.platform.admin.guides.support.GettingStartedGuideController
 * @see com.boostrack.platform.admin.guides.support.TutorialController
 * @see com.boostrack.platform.admin.guides.support.UnderstandingDocController
 */
@Controller
@Navigation(Section.GUIDES)
class GuideIndexController {

//    private final GettingStartedGuides gsGuides;
//    private final Tutorials tutorials;
//
//    @Autowired
//    public GuideIndexController(GettingStartedGuides gsGuides, Tutorials tutorials) {
//        this.gsGuides = gsGuides;
//        this.tutorials = tutorials;
//    }
//
//    @RequestMapping(value = "/guides", method = { GET, HEAD })
//    public String viewIndex(Model model) {
//        model.addAttribute("guides", gsGuides.findAll());
//        model.addAttribute("tutorials", tutorials.findAll());
//        return "guides/index";
//    }
}
