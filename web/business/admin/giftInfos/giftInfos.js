/*用户页面的view*/
var giftInfoMv=new Vue({
    data:{
        dataList:[],
        page:{
            "totalPages":0,
            "pageSize":10,
            "totalCount":0,
            "currentPage":1,
            "renderPages":2,//在页面上要显示的页数,默认为7页 //第一页数据是默认加载的关，所以要减1
            "condition":{
                "searchTime":""
            }
        },
        path:path,
        searchTxt:"" //搜索的内容
    },
    ready:function(){
        //load first page
        var vm=this;
        vm.loadDatas(1);
    },
    methods:{
        loadDatas:function (pageNo) {
            var vm=this;
            $.ajax(path+"/admin/findGiftInfos",{
                dataType:"json",
                data:{
                    pageNo:pageNo,
                    pageSize:vm.page.pageSize,
                    searchTxt:vm.searchTxt,
                    searchTime:vm.page.condition.searchTime
                },
                type:"POST",
                success:function(data){
                    if(data){
                        vm.dataList=data.dataList;
                        vm.page.pageSize=data.pageSize;
                        vm.page.totalCount=data.totalCount;
                        vm.page.currentPage=data.currentPage;
                        if(pageNo==1){//加载第一页数据的时才会加载相应的页数信息
                            vm.page.totalPages=data.totalPages;
                            createGiftPagnation(1,data.totalPages);//创建分页
                        }
                        if(data.condition&&data.condition.searchTime){
                            vm.page.condition.searchTime=data.condition.searchTime;
                        }
                    }
                }
            })
        }
    },
    filters: {
        photoUrl: function (value) {
            return value ? path+value:path+'/common/images/people140x140.jpg';
        }
    }
});
//由于使用Pjax，相当于动态创建了元素内容，要重新绑定相应的挂载点
giftInfoMv.$mount('#giftInfoDiv');

function createGiftPagnation(pageIndex,totalPages){
    $("#giftPageUl").html("");
    if (pageIndex > totalPages || pageIndex < 1) {
        return;
    }
    var options = {
        alignment:"center",//居中显示
        currentPage: pageIndex,//当前页数
        size:"small",
        totalPages: totalPages,//总页数 注意不是总条数
        bootstrapMajorVersion:3,
        onPageChanged: function(event,oldPage,newPage){
            if (oldPage==newPage) {
                return;
            } else {
                giftInfoMv.loadDatas(newPage);
            }
        }
    };
    $("#giftPageUl").bootstrapPaginator(options);
}