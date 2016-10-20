package com.ddas.common.util.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * xml 节点信息
 * 
 * @author Administrator
 * 
 */
public class XmlNode {
	/** 节点名称 */
	private String nodeName;
	/** 节点值 */
	private String nodeValue;
	/** 所有的子节点 */
	private List<XmlNode> chidrenNodes = new ArrayList<XmlNode>();

	/**
	 * 根据nodeName来查询所指定的nodeValue
	 * 
	 * @param nodeName
	 *            节点名称
	 * @return 节点值
	 */
	public String get(String nodeName) {
		if (this.getNodeName() != null && nodeName.equals(this.getNodeName())) {
			return this.getNodeValue();
		} else {
			return getNodeValueByNodeName(this, nodeName);
		}
	}

	/**
	 * 循环检测
	 * 
	 * @param pNode
	 * @param nodeName
	 * @return
	 */
	private String getNodeValueByNodeName(XmlNode pNode, String nodeName) {
		if (pNode.getChidrenNodes() != null
				&& pNode.getChidrenNodes().size() > 0) {
			for (XmlNode node : pNode.getChidrenNodes()) {
				String result = getNodeValueByNodeName(node, nodeName);// 递归检测所需要的nodeName对应的nodeValue值
				if (result != null) {// 如果检测到值，则直接返回，不进行下一次的检测
					return result;
				}
			}
		} else {
			if (pNode.getNodeName() != null
					&& nodeName.equals(pNode.getNodeName())) {// node的nodeName与传入参数对比
				return pNode.getNodeValue();
			}
		}
		return null;
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public String getNodeValue() {
		return nodeValue;
	}

	public void setNodeValue(String nodeValue) {
		this.nodeValue = nodeValue;
	}

	public List<XmlNode> getChidrenNodes() {
		return chidrenNodes;
	}

	public void setChidrenNodes(List<XmlNode> chidrenNodes) {
		this.chidrenNodes = chidrenNodes;
	}

	@Override
	public String toString() {
		StringBuffer buffer = new StringBuffer();
		toStringAppender(buffer);
		return buffer.toString().replace(",}", "}").replace("},}", "}}").replace("],}", "]}");
	}

	private void toStringAppender(StringBuffer buffer) {
		buffer.append("{");
		circleString(this, buffer);
		buffer.append("}");
	}

	private void circleString(XmlNode node, StringBuffer buffer) {
		if (node.getNodeName() != null) {
			if (node.getChidrenNodes().size() > 0) {
				buffer.append("\"" + node.getNodeName() + "\":{");
				for (XmlNode subNode : node.getChidrenNodes()) {
					circleString(subNode, buffer);
				}
				buffer.append("},");
			} else {
				buffer.append("\"" + node.getNodeName() + "\":\""
						+ node.getNodeValue() + "\",");
			}

		}
	}

}
