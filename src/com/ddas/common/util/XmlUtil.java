package com.ddas.common.util;

import com.sun.xml.internal.messaging.saaj.util.ByteInputStream;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.util.HashMap;
import java.util.Map;

public class XmlUtil {

	public static Map<String, String> parseXml(String xmlSeg) {
		Map<String, String> result = new HashMap<String, String>();
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory
					.newInstance();
			builderFactory.setValidating(false);
			DocumentBuilder documentBuilder = builderFactory
					.newDocumentBuilder();
			byte[] bs = xmlSeg.getBytes();
			Document document = documentBuilder.parse(new ByteInputStream(bs,
					bs.length));
			// Document document = documentBuilder.parse(xmlSeg);
			// Document document=documentBuilder.parse(new
			// File(XmlUtil.class.getClassLoader().getResource("NewFile.xml").toURI()));
			Element element = document.getDocumentElement();
			circleCom(element, result);
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 提取所有子节点的数据 并去除所有根节点的数据
	 * 
	 * @param element
	 * @param result
	 */
	private static void circleCom(Element element, Map<String, String> result) {
		NodeList list = element.getChildNodes();
		String eleName = element.getNodeName();
		if (list.getLength() > 0) {// 有子节点
			for (int i = 0; i < list.getLength(); i++) {
				Node node = list.item(i);
				if (node instanceof Element) {
					Element subElement = (Element) node;
					circleCom(subElement, result);// 递归
				} else {
					String content = node.getTextContent();
					extractValue(result, eleName, content);
				}
			}
		} else {// 直接取数据
			String content = element.getTextContent();
			extractValue(result, eleName, content);
		}
	}

	/**
	 * 提取数据
	 * 
	 * @param result
	 * @param eleName
	 * @param content
	 */
	private static void extractValue(Map<String, String> result,
			String eleName, String content) {
		if (eleName != null && eleName.contains(":")) {
			String cs[] = eleName.split(":");
			result.put(cs[1], content);
		} else {
			result.put(eleName, content);
		}
	}

}
