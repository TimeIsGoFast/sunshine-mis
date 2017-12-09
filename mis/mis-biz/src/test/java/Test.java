import java.io.StringReader;
import java.util.Iterator;
import java.util.List;

import net.sf.jsqlparser.parser.CCJSqlParserManager;
import net.sf.jsqlparser.schema.Column;
import net.sf.jsqlparser.statement.update.Update;


/**
 * 
 */

/**
 * @author Lay
 *
 */
public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		CCJSqlParserManager parser = new CCJSqlParserManager();
		Update update = (Update)parser.parse(new StringReader("UPDATE t_s_user SET uid = ?, name = ?, sex = ?, tel = ?, mail = ?, enabled = ?, create_date = ?, update_date = ?, create_by = ?, update_by = ?, remark = ?, password = ? WHERE id = ? "));
		List<Column> columns = update.getColumns();
		for(Iterator<Column> it = columns.iterator();it.hasNext();){
			if(it.next().getColumnName().equalsIgnoreCase("create_by")){
				it.remove();
			}
		}
		System.out.println(update.toString());
	}

}
