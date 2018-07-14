package kr.green.camping.controller.user;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller

@RequestMapping(value="/search/*")

public class SearchController {

	@RequestMapping(value = "/region/list", method = RequestMethod.GET)
	public String getSearchRegion() throws Exception {
		
		
		return "user/board/search/region/list";
	}
	
	
	
}
