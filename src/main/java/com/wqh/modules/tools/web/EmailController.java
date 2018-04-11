package com.wqh.modules.tools.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wqh.common.mail.MailSendUtils;
import com.wqh.common.web.BaseController;
import com.wqh.modules.sys.entity.SystemConfig;
import com.wqh.modules.sys.service.SystemConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 发送外部邮件
 * 
 * @version 2016-01-07
 */
@Controller
@RequestMapping(value = "${adminPath}/tools/email")
public class EmailController extends BaseController {

	@Autowired
	private SystemConfigService systemConfigService;
	
	/**
	 * 打开邮件页面
	 */
	@RequestMapping(value = {"index", ""})
	public String index( HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/tools/sendEmail";
	}

	/**
	 * 发送邮件
	 */
	@RequestMapping("send")
	public String send(String emailAddress,  HttpServletResponse response, String title, String content, Model model) throws Exception {
		SystemConfig config = systemConfigService.get("1");
		String[]addresses = emailAddress.split(";");
		String result = "";
		for(String address: addresses){
			boolean isSuccess = MailSendUtils.sendEmail(config.getSmtp(), config.getPort(), config.getMailName(), config.getMailPassword(),address,  title, content, "0");
			if(isSuccess){
				result += address+":<font color='green'>发送成功!</font><br/>";
			}else{
				result += address+":<font color='red'>发送失败!</font><br/>";
			}
		}
			model.addAttribute("result", result);
			return "modules/tools/sendEmailResult";
	}
		
}