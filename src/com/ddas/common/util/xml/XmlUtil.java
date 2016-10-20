package com.ddas.common.util.xml;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

public abstract class XmlUtil {
	/**
	 * ����XML��Tag����ȡ��һ���ڵ������
	 * @param filePath
	 * @param xpath
	 * @return
	 */
	public static String getTextByTag(String filePath,String xpath){
		try {
			DocumentBuilderFactory builderFactory=DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder=builderFactory.newDocumentBuilder();
			Document document=documentBuilder.parse(XmlUtil.class.getClassLoader().getResourceAsStream(filePath));
	
			XPathFactory xPathFactory=XPathFactory.newInstance();
			XPath xPath=xPathFactory.newXPath();
			XPathExpression xpathExp=xPath.compile(xpath);
			Object object=xpathExp.evaluate(document, XPathConstants.NODESET);
			
			NodeList list=(NodeList)object;
			return list.getLength()>0?list.item(0).getTextContent().trim():"";
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}
