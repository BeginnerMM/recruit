var page = 1;
var pageTotal = 5;

var box = new Vue({
    el: '#news-content',
    data: {
        jobs: [{}]
    },
    mounted: function () {
        this.$nextTick(function () {

            $.ajax({
                url: "/news/"+page,
                type: "get",
                dataType: "json",
                success: function (msg) {
                    box.jobs = msg.list
                    if (msg.user != null) {
                        headervue.type = 'user';
                        headervue.person.user = msg.user;
                    }
                },
                error: function (msg) {
                    console.log(msg);
                }
            });

        });
    }
});



function nextPage() {
    page = page + 1;
        $.ajax({
            url: "/news/"+page,
            type: "get",
            dataType: "json",
            success: function (data) {
                $.each(data.list, function (key, val) {
                    box.jobs.push(val);
                });
                if (data.list.length<1){
                    $("#viewMoreButton").empty();
                    $("#viewMoreButton").append("没有更多");
                    $("#viewMoreButton").addClass("disable");
                }
            }, error: function () {
                $("#viewMoreButton").empty();
                $("#viewMoreButton").append("没有更多");
            }
        });

}

