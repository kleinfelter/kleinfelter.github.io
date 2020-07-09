<%@ include file="/common/taglibs.jsp"%>   
  
<head>   
    <title><fmt:message key="addressDetail.title"/></title>   
    <content tag="heading"><fmt:message key="addressDetail.heading"/></content>   
</head>   
  
<s:form id="addressForm" action="saveAddress" method="post" validate="true">   
<s:hidden name="address.id" value="%{address.id}"/>   
  
    <s:textfield key="address.name" required="true" cssClass="text medium"/>   
    <s:textfield key="address.street" required="true" cssClass="text medium"/>   
    <s:textfield key="address.city" required="true" cssClass="text medium"/>   
    <s:textfield key="address.state" required="true" cssClass="text medium"/>   
    <s:textfield key="address.zip" required="true" cssClass="text medium"/>   
  
    <li class="buttonBar bottom">            
        <s:submit cssClass="button" method="save" key="button.save"/>   
        <c:if test="${not empty person.id}">    
            <s:submit cssClass="button" method="delete" key="button.delete" onclick="return confirmDelete('address')"/>   
        </c:if>   
        <s:submit cssClass="button" method="cancel" key="button.cancel"/>   
    </li>   
</s:form>   
  
<script type="text/javascript">   
    Form.focusFirstElement($("addressForm"));   
</script>  
