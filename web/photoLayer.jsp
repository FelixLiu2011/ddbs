<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<%
    String path=request.getContextPath();
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>HomeIndex</title>
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script type="text/javascript">
        var path = "<%=path%>";
    </script>
    <%--照片--%>
    <script type="text/javascript" src="<%=path%>/common/layer/js/layer.js"></script>
<script type="text/javascript">
    /**
     * 照片弹出
     * @param groupId
     */
    function showPhotos(groupId) {
        if(groupId){
            $.ajax(path+'/userPhoto/queryRecordsByPage',{
                data:{
                    "groupId":"10ad54ee3b5fded6",
                    "currentPage":1,
                    "pageSize":10000
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    parsing(data);
                }
            });
        }

        var parsing=function(data){
            var parsedJson={
                "title": "Photo",
                "id": 99935,
                "start": 0,
                "data":[]
            };
            for(var index in data.dataList){
                var _data=data.dataList[index];
                parsedJson.data.push({
                    "alt": _data.photoDescription,
                    "pid": _data.upId,
                    "src": path+_data.photoUrl
                  //  "thumb": path+_data.thumbnailurl
                })
            }
            alert($(window).height())
            layer.photos({
                area: '500px',
                offset:($(window).height() - 500)/2+"px",
                photos:parsedJson
            });
        }
    }

    showPhotos("10ad54ee3b5fded6");
</script>
</head>
<body>
</body>
</html>
