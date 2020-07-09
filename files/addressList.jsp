<%@ include file="/common/taglibs.jsp"%>   
  
<head>   
    <title><fmt:message key="addressList.title"/></title>   
    <content tag="heading"><fmt:message key="addressList.heading"/></content>   
</head>   
  
<c:set var="buttons">   
    <input type="button" style="margin-right: 5px"  
        onclick="location.href='<c:url value="/editAddress.html"/>'"  
        value="<fmt:message key="button.add"/>"/>   
       
    <input type="button" onclick="location.href='<c:url value="/mainMenu.html"/>'"  
        value="<fmt:message key="button.done"/>"/>   
</c:set>   
  
<c:out value="${buttons}" escapeXml="false" />   
  
<s:set name="addresses" value="addresses" scope="request"/>   
<display:table name="addresses" class="table" requestURI="" id="addressList" export="true" pagesize="25">   
    <display:column property="id" sortable="true" href="editAddress.html" mce_href="editAddress.html"    
        paramId="id" paramProperty="id" titleKey="address.id"/>   
    <display:column property="name" sortable="true" titleKey="address.name"/>   
    <display:column property="street" sortable="true" titleKey="address.street"/>   
    <display:column property="city" sortable="true" titleKey="address.city"/>   
    <display:column property="state" sortable="true" titleKey="address.state"/>   
    <display:column property="zip" sortable="true" titleKey="address.zip"/>   
  
    <display:setProperty name="paging.banner.item_name" value="address"/>   
    <display:setProperty name="paging.banner.items_name" value="addresses"/>   
  
    <display:setProperty name="export.excel.filename" value="Address List.xls"/>   
    <display:setProperty name="export.csv.filename" value="Address List.csv"/>   
    <display:setProperty name="export.pdf.filename" value="Address List.pdf"/>   
</display:table>   
  
<c:out value="${buttons}" escapeXml="false" />   
  
<script type="text/javascript">   
    highlightTableRows("addressList");   
</script>
