package com.project.recipe;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;


public class RecipeR {
	RConnection r = null;
	public REXP img = null;
	public REXP title = null;
	public REXP link = null;
	public REXP by = null;
	public REXP recipe = null;
	public REXP so = null;
	public REXP simg = null;
	public REXP ti = null;
	public REXP pe = null;
	public REXP m = null;
	public REXP l = null;
	public String[] foodimg = null;
	public String[] foodlink = null;
	public String[] foodtitle = null;
	public String[] foodby = null;
	public String inrecipe = null;
	public String[] sauce = null;
	public String sumimg = null;
	public String rtitle = null;
	public String people = null;
	public String time = null;
	public String level = null;
 
	
	public String[] foodimg(String word)throws RserveException, REXPMismatchException{
		r = new RConnection();
		//검색어 이미지 추출
		r.eval("library(httr)");
		r.eval("library(rvest)");
		r.assign("word", word);
		r.eval("word <- repair_encoding(word)");
		r.eval("res<-'http://www.10000recipe.com/recipe/list.html?q='");
		r.eval("res<-paste(res, word, sep='')");
		r.eval("t <- '&order=date&page='");
		r.eval("res <- paste(res,t,sep='')");
		r.eval("i<-1");
		r.eval("flag<-TRUE");
		r.eval("img<-NULL");
		r.eval("repeat{site <- paste(res,i,sep='');" + 
				"  tryCatch(htxt <- read_html(site,encoding='UTF-8'),error = function(e){flag <<- FALSE});" + 
				"  if(i == 4){break};" + 
				"imglink <- html_nodes(htxt, 'div.rcp_m_list2 > div.row > div > a > img');" + 
				"foodimg <- html_attr(imglink, 'src');" + 
				"  result<-data.frame(foodimg);" + 
				"  img <- rbind(img, result);" + 
				"  i <- i+1" + 
				"};");
		r.eval("img<-unlist(img)");
		img= r.eval("img");
		foodimg = img.asStrings();
		return foodimg;
	}
	public String[] foodlink(String word)throws RserveException, REXPMismatchException{
		//레시피 상세주소 불러오기
		r.assign("word", word);
		r.eval("word <- repair_encoding(word)");
		r.eval("res<-'http://www.10000recipe.com/recipe/list.html?q='");
		r.eval("res<-paste(res, word, sep='')");
		r.eval("t <- '&order=date&page='");
		r.eval("res <- paste(res,t,sep='')");
		r.eval("i<-1");
		r.eval("flag<-TRUE");
		r.eval("link<-NULL");
		r.eval("repeat{site <- paste(res,i,sep='');" + 
				"  tryCatch(htxt <- read_html(site,encoding='UTF-8'),error = function(e){flag <<- FALSE});" + 
				"  if(i == 4){break};" + 
				"  links <- html_nodes(htxt, 'div.rcp_m_list2 > div.row > div > a');" + 
				"  foodweblink <- html_attr(links, 'href');" + 
				"  f<-data.frame(foodweblink);" + 
				"  link <- rbind(link, f);" + 
				"  i <- i+1" + 
				"};");
		r.eval("link<-unlist(link)");
		link = r.eval("link");
		foodlink = link.asStrings();
		return foodlink;
	}
	
	public String[] foodtitle(String word)throws RserveException, REXPMismatchException{
		//레시피 제목 불러오기
		r.assign("word", word);
		r.eval("word <- repair_encoding(word)");
		r.eval("res<-'http://www.10000recipe.com/recipe/list.html?q='");
		r.eval("res<-paste(res, word, sep='')");
		r.eval("t <- '&order=date&page='");
		r.eval("res <- paste(res,t,sep='')");
		r.eval("i<-1");
		r.eval("flag<-TRUE");
		r.eval("title<-NULL");
		r.eval("repeat{site <- paste(res,i,sep='');" + 
				"  tryCatch(htxt <- read_html(site,encoding='UTF-8'),error = function(e){flag <<- FALSE});" + 
				"  if(i == 4){break};" + 
				"  titles <- html_nodes(htxt, 'div.rcp_m_list2 > div.row > div > a > div > h4');" + 
				"  titles <- html_text(titles, 'ellipsis_title2');" + 
				"  t<-data.frame(titles);" + 
				"  title <- rbind(title, t);" + 
				"  i <- i+1" + 
				"};");
		r.eval("title<-unlist(title)");
		title = r.eval("title");
		foodtitle = title.asStrings();
		return foodtitle;
	}
	public String[] foodby(String word)throws RserveException, REXPMismatchException{
		//레시피 작성자 불러오기
		r.assign("word", word);
		r.eval("word <- repair_encoding(word)");
		r.eval("res<-'http://www.10000recipe.com/recipe/list.html?q='");
		r.eval("res<-paste(res, word, sep='')");
		r.eval("t <- '&order=date&page='");
		r.eval("res <- paste(res,t,sep='')");
		r.eval("i<-1");
		r.eval("flag<-TRUE");
		r.eval("by<-NULL");
		r.eval("repeat{site <- paste(res,i,sep='');" + 
				"  tryCatch(htxt <- read_html(site,encoding='UTF-8'),error = function(e){flag <<- FALSE});" + 
				"  if(i == 4){break};" + 
				"  bys <- html_nodes(htxt, 'div.rcp_m_list2 > div.row > div > a > div > p');" + 
				"  bys <- html_text(bys, 'p');" + 
				"  b<-data.frame(bys);" + 
				"  by <- rbind(by, b);" + 
				"  i <- i+1" + 
				"};");
		r.eval("by<-unlist(by)");
		by = r.eval("by");
		foodby = by.asStrings();
		r.close();
		return foodby;
		}
	public String[] foodimg() {
		// TODO Auto-generated method stub
		return null;
	}
	public String inrecipe(String x)throws RserveException, REXPMismatchException{
		//상세내용 불러오기
		r = new RConnection();
		r.assign("rlink",x);
		r.eval("h =read_html(rlink)");
		r.eval("re = html_nodes(h,css='.view_step')");
		r.eval("recipe <- re[1]");
		r.eval("recipe <- as.character(recipe)");
		recipe = r.eval("recipe");
		inrecipe = recipe.asString();
		return inrecipe;
	}
	public String[] sauce()throws RserveException, REXPMismatchException{
		//식재료불러오기
		r.eval("s = html_nodes(h, '#divConfirmedMaterialArea>ul')");
		r.eval("s = html_text(s,trim=T)");
		r.eval("s <- gsub('\r\n','' , s)");
		r.eval("so <- gsub(' ','',s)");
		so = r.eval("so");
		sauce = so.asStrings();
		return sauce;
	}
	public String sumimg()throws RserveException, REXPMismatchException{
		//섬네일이미지
		r.eval("sum = html_nodes(h,'#main_thumbs')");
		r.eval("simg = html_attr(sum, 'src')");
		simg = r.eval("simg");
		sumimg = simg.asString();
		return sumimg;
	}
	public String rtitle()throws RserveException, REXPMismatchException{
		//제목불러오기
		r.eval("ti = html_nodes(h, '#contents_area > div.view2_summary > h3')");
		r.eval("ti = html_text(ti)");
		ti = r.eval("ti");
		rtitle = ti.asString();
		return rtitle;
	}
	public String people()throws RserveException, REXPMismatchException{
		//인분수
		r.eval("pe = html_nodes(h,'#contents_area > div.view2_summary > div.view2_summary_info > span.view2_summary_info1')");
		r.eval("pe = html_text(pe)");
		pe = r.eval("pe");
		people = pe.asString();
		return people;
	}
	public String time()throws RserveException, REXPMismatchException{
		//소요시간
		r.eval("m = html_nodes(h,'#contents_area > div.view2_summary > div.view2_summary_info > span.view2_summary_info2')");
		r.eval("m = html_text(m)");
		m = r.eval("m");
		time = m.asString();
		return time;
	}
	public String level()throws RserveException, REXPMismatchException{
		//레벨
		r.eval("l = html_nodes(h,'#contents_area > div.view2_summary > div.view2_summary_info > span.view2_summary_info3')");
		r.eval("l = html_text(l)");
		l = r.eval("l");
		level = l.asString();
		r.close();
		return level;
	}
}
