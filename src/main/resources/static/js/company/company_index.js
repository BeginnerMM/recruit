var page = 1;
var pageTotal = 4;
var box = new Vue({
    el: '#job-content',
    data: {
        jobs: [{}]
    },
    mounted: function () {
        this.$nextTick(function () {
            $.ajax({
                url: "/companyPage/" + page,
                type: "get",
                dataType: "json",
                success: function (msg) {
                    box.jobs = msg.conpanyDetailList;
                    if (msg.user != null) {
                        headervue.type = 'user';
                        headervue.person.user = msg.user;
                    }
                },
                error: function (msg) {
                    window.location.href = "localhost:8080/user/login";
                }
            });

        });
    }
});

function nextPage() {
    page = page + 1;
    if (page <= pageTotal) {
        $.ajax({
            url: "/companyPage/" + page,
            type: "post",
            dataType: "json",
            success: function (msg) {
                for (var i = 0; i < msg.conpanyDetailList.length; i++) {
                    box.jobs.push(msg.conpanyDetailList[i]);
                }
                // box.jobs.push(msg.posInfo);
            }, error: function () {
                $("#viewMoreButton").empty();
                $("#viewMoreButton").append("没有更多");
            }
        });
    } else {
        $("#viewMoreButton").empty();
        $("#viewMoreButton").append("没有更多");
        $("#viewMoreButton").addClass("disable");
    }
}

function getSelectValue() {
    var city = $("#city").val()

    $.ajax({
        url:"/companyPage/" + page+"?city="+city,
        type:'get',
        dataType: "json",
        success:function (msg) {
            box.jobs = msg.conpanyDetailList;
            if (msg.user != null) {
                headervue.type = 'user';
                headervue.person.user = msg.user;
            }
        },
        error:function (msg) {

        }
    })

}
