/**
 * 
 */
package net.zjwu.mis.base.view;

import java.io.InputStream;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.AbstractView;

import net.sf.jxls.transformer.XLSTransformer;

/**
 * @author Lay
 *
 */
public class JxlsExcelView extends AbstractView {

	private static String content_type = "application/vnd.ms-excel; charset=UTF-8";

	private String fileName;
	private String templateFile;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	
	public String getTemplateFile() {
		return templateFile;
	}
	public void setTemplateFile(String templateFile) {
		this.templateFile = templateFile;
	}

	public JxlsExcelView() {
		setContentType(content_type);
	}

	protected void renderMergedOutputModel (Map map, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		InputStream is = this.getClass().getResourceAsStream(templateFile);
		XLSTransformer transformer = new XLSTransformer();
		Workbook workbook = transformer.transformXLS(is, map);
		response.setContentType(getContentType());
		response.setHeader("Content-Disposition", "attachment; filename=\""
				+ fileName + "\"");
		ServletOutputStream out = response.getOutputStream();
		workbook.write(out);
		out.flush();
	}
}
